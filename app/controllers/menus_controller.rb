class MenusController < ApplicationController
  before_action :set_menu, only: %i[ show edit update destroy ]

  # GET /menus or /menus.json
  def index
    @menus = Menu.all
    #@accesos = verificarAcceso()

    @menu_show = Menu.all
    @ruta_local = "/menus"
    
    @direccion = direccionador(@ruta_local,@menu_show)   

    @direccion
  end

  # GET /menus/1 or /menus/1.json
  def show
    
    
    @menu_detalle = @menu
    @ruta_local = "/menus/:id"
    @ruta_eliminar = ""


    @permisos_crud = get_crud_permisos(@ruta_local)
    puts @permisos_crud
    
    @direccion = direccionador(@ruta_local,@menu_detalle)   

    @direccion

  end

  # GET /menus/new
  def new
    
    @menu = Menu.new
    @ruta_local = "/menus/new"
    
    @direccion = direccionador(@ruta_local,@menu)   

    @direccion
    
  end

  # GET /menus/1/edit
  def edit

    @menu_edit = edit_menu_path
    @ruta_local = "/menus/:id/edit"
    
    @direccion = direccionador(@ruta_local,@menu_edit)   

    @direccion

  end

  # POST /menus or /menus.json
  def create
    @menu = Menu.new(menu_params)
    
    respond_to do |format|
      if @menu.save
        format.html { redirect_to menu_url(@menu), notice: "Menu was successfully created." }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /menus/1 or /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to menu_url(@menu), notice: "Menu was successfully updated." }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1 or /menus/1.json
  def destroy
   #definimos la ruta para eliminar
   @ruta_local = "/menus/:id"
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local)
   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_params
      params.require(:menu).permit(:nombre, :menu_id)
    end

    def verificarAcceso()
      @accesos = Acceso.all

      @usuario = current_user.id
      
      #obtenemos el empleado a partir del id usuario de la sesion activa, este es un objeto empleado
      @empleado = obteniendo_empleado(@usuario)
      
      #aqui tenemos los id roles del empleado que tiene la sesion activa, obtenemos un array de enteros
      @id_rol = rol_empleado(@empleado.id)
      
      #obtenemos un array de enteros con los id permisos del usuario activo
      #select id_permiso from acceso where id_rol = 
      @id_permiso = obtener_id_permiso(@id_rol)
      
      #obtendremos un array de enteros de los id menus del usuario activo de la tabla menu rol
      #select id_menu from menu_rol where id_rol = 
      @id_menu = obtener_id_menu_de_rol_menu(@id_rol)
      
      # SELECT DISTINCT padres.menu_id from menus padres where padres.menu_id 
      # in 
      # (SELECT DISTINCT menu_rols.menu_id FROM menus inner join menu_rols on menus.id = menu_rols.menu_id)
      #aqui vamos a comparar los id menus con los id submenus de la tabla menu
      @id_menu_principal = obtener_menu_principal(@id_menu)
      
      #puts "este es el menu principal"
      #puts @id_menu_principal
      #aqui obtenemos todos los sub menus
      @id_sub_menu = obtener_menu_sub(@id_menu_principal)

      #select id_permiso from menu_permiso where id_menu in (id_sub_menu_rol)
      @id_permiso_menu_permiso = obtener_id_permiso_de_menu_permiso(@id_sub_menu)

      #aqui vamos a obtener los permisos /rutas a los que tiene acceso este rol
      @menus_para_usuarios = validar_permisos_de_usuario(@id_permiso,@id_permiso_menu_permiso)

      @tabla_permisos = obtener_tabla_permiso(@menus_para_usuarios)

      @tabla_permisos
    end

    def obteniendo_empleado(usuario)
      @empleado = Empleado.find(usuario)

      return @empleado
    end

    def rol_empleado(id_empleado)
      @rol_empl = RolEmpleado.all
      rolemp = []

      @rol_empl.each do |role|
        if role.empleado_id == id_empleado
          rolemp << role.rol_id
        end 
      end
      rolemp
    end


    def obtener_id_permiso(roles)
      @permisos_id = []

      roles.each do |rol|
        @permisos_un_rol = Permiso.find_by_sql(["SELECT permiso_id from accesos where rol_id = ?", rol])
        @permisos_un_rol.each do |pr_rol|
          @permisos_id << pr_rol.permiso_id
        end
      end

      @permisos_id
    end

    def obtener_id_menu_de_rol_menu(roles)
      @menu_id = MenuRol.all

      @menus_id = []

      #vamos a recorrer todos os roles del usuario
      roles.each do |rolp|
        #para cada rol del usuario vamos a recorrer la tabla acceso
        @menu_id.each do |men|
          if rolp == men.rol_id
            @menus_id << men.menu_id
          end
        end
      end

      @menus_id

    end

    def obtener_menu_principal(idMenu)
      #idMenu devuelve 4,3
      #esperamos que nos devuelva 4
      @menu_p = Menu.all

      @menu_a = []

      @menu_p.each do |m|
        idMenu.each do |me|
          if m.menu_id == me && m.menu_id != nil
            @menu_a << m.menu_id  
          end
        end
      end
      #para eliminar repetidos con uniq
      @menu_a.uniq

    end

    def obtener_menu_sub(idMenuPrinc)
      @menu_s = Menu.all

      @menu_sa = []
      
      idMenuPrinc.each do |p|
        @menu_s.each do |s|
          if s.menu_id == p && s.menu_id != nil
            @menu_sa << s.id
          end
        end
      end

      @menu_sa.uniq

    end

    def obtener_id_permiso_de_menu_permiso(idSubMenu)
      @menu_permiso = MenuPermiso.all
      @menu_permiso_a = []
      @menu_permiso.each do |mp|
        idSubMenu.each do |sm|
          if sm == mp.menu_id
            @menu_permiso_a << mp.permiso_id
          end
        end
      end
      @menu_permiso_a
    end

    def validar_permisos_de_usuario(idPermisoUsuario, idSubMenu)
      #idPermisoUsuario son los permisos que el rol tiene en la tabla acceso
      #idSubMenu con todos los sub menus disponibles
      @permisos_de_rol = []

      idSubMenu.each do |sm|
        idPermisoUsuario.each do |pu|
          if sm == pu
            @permisos_de_rol << sm
          end 
        end
      end

      @permisos_de_rol

    end

    def obtener_tabla_permiso(idMenuUsuario)

      @tabla_permiso_list = []

      idMenuUsuario.each do |mu|
        @tabla_permiso = Permiso.find(mu)
        @tabla_permiso_list << @tabla_permiso
      end

      @tabla_permiso_list
    end

    def direccionador(ruta,direccion)

      @accesoss = verificarAcceso()
      @control = false
      
      @accesoss.each do |a|
        
        if a.ruta == ruta
          @control = true
          break
        else 
          @control = false
        end
      end

      if @control == true
        return direccion
      else
        return redirect_to('/acceso_denegado')
      end

    end

    def direccionador_destroy(ruta)
      @accesoss = verificarAcceso()
      @control = false
      
      @accesoss.each do |a|
        puts a.ruta + " vs " + ruta
        if a.ruta == ruta
          @control = true
          break
        else 
          @control = false
        end
      end

      if @control == true
        @menu.destroy
        respond_to do |format|
          format.html { redirect_to menus_url, notice: "Menu was successfully destroyed." }
          format.json { head :no_content }
        end
      else
        redirect_to('/acceso_denegado')
      end
    end


    def get_crud_permisos(ruta)
      @usuario = current_user.id
      @empleado = obteniendo_empleado(@usuario)
      @id_rol = rol_empleado(@empleado.id)
      @id_permiso = obtener_id_permiso(@id_rol)

      @id_permiso.each do |perm|
        @permisinho = Permiso.find_by_sql(["SELECT * from permisos where id = ? and ruta = ?", perm, ruta])
      end
      #.find_by_sql(["", ])

      puts "Aqui estoy imprimiendo mis pruebas"
      @permisinho.each do |per|
        puts per.permiso_id
      end

      @id_menu = obtener_id_menu_de_rol_menu(@id_rol)

      sub_menu_list = Menu.find(@id_menu)
      
      #1 editar y 2 eliminar
      permisos_crud = []
      sub_menu_list.each do |sub_menu|
        if sub_menu.nombre.downcase["editar"]
          permisos_crud << 1

        elsif sub_menu.nombre.downcase["eliminar"]
          permisos_crud << 2
        end
      end

      return permisos_crud
    end

end
