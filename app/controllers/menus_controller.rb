class MenusController < ApplicationController
  before_action :set_menu, only: %i[ show edit update destroy ]

  # GET /menus or /menus.json
  def index
    @menus = Menu.all

    

    @accesos = prueba()
    
  end

  # GET /menus/1 or /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit

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
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to menus_url, notice: "Menu was successfully destroyed." }
      format.json { head :no_content }
    end
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

    def prueba()
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

      @id_menu_rol = obtener_menu_principal(@id_menu)

      @id_sub_menu_rol = obtener_menu_sub(@id_menu_rol)

      puts "estos son los id menus subs"
      puts @id_sub_menu_rol

      arreglo = []
      @accesos.each do |acceso|
        if acceso.rol_id == 1
          arreglo << acceso

          #puts "estoy en el if"
          #puts acceso.rol_id
        end
        #puts "esto es un acceso"
        #puts acceso.rol_id
      end
      arreglo
    end

    def obteniendo_empleado(usuario)
      @empleado = Empleado.all
      @id_empleado = ''

      puts "este es el usuario"
      puts @usuario

      @empleado.each do |emp|
        if emp.user_id == usuario
          @id_empleado = emp    
          #puts "entre al if"
          #puts emp.user_id
        end 
      end
     # puts @id_empleado
      @id_empleado
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

      @acceso_permiso = Acceso.all

      @permisos_id = []

      #vamos a recorrer todos os roles del usuario
      roles.each do |rolp|
        #para cada rol del usuario vamos a recorrer la tabla acceso
        @acceso_permiso.each do |acce|
          if rolp == acce.rol_id
            @permisos_id << acce.permiso_id
          end
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

      @menu_p = Menu.all

      @menu_a = []

      @menu_p.each do |m|
        idMenu.each do |me|
          if m.id == me
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
            puts "estpy en el if esto es p"
            puts p
            puts s.id
            @menu_sa << s.id
          end
        end
      end

      @menu_sa.uniq


    end



end
