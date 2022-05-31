class HomeController < ApplicationController
  before_action :authenticate_user!
  # before_filter :authenticate_user!
  def index
      @menu_rol_nav = menus_y_submenus_usuario(1)
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

  def direccionador_destroy(ruta, url_delete, url_path, menu_name)
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
      url_delete.destroy
      respond_to do |format|
        format.html { redirect_to url_path, notice: menu_name + " fue eliminado exitosamente." }
        format.json { head :no_content }
      end
    else
      redirect_to('/acceso_denegado')
    end
  end


  def menus_y_submenus_usuario(peticion)
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

    menu_principal_list = []
    menu_secundario_list = []

    #Ingresaremos a un array todos los menus principales de este usuario
    @id_menu_principal.each do |mpu|
      @id_menu.each do |idm|
        if mpu == idm && mpu != nil && idm != nil
          menu_principal_list << mpu
        end
      end
    end

    #Ingresaremos a un array los menus secundarios de este usuario
    @id_sub_menu.each do |mpu|
      @id_menu.each do |idm|
        if mpu == idm && mpu != nil && idm != nil
          menu_secundario_list << mpu
        end
      end
    end
    
    menu_hash = {}
    menu_principal_list.each do |men_main|
      #Obtenemos los submenus a partir de un id principal
      @all_sub_menu = obtener_menu_sub([men_main])
      #Obtendremos el id_permiso 

      #Creamos un array en el que se guardaran hashes y luego se guardara en el hash global, se reiniciara en cada iteracion
      menus_secundarios_list = []

      #Obtendremos un menu solo para saber su nombre
      @menu_individual_main = Menu.find(men_main)
      nombre_menu_main = @menu_individual_main.nombre

      #Vamos a compara la lista de submenus con la lista de submenus totales existentes
      @all_sub_menu.each do |men_sec|
        menu_secundario_list.each do |men_sec_user|
          if men_sec == men_sec_user
            @permiso_second_menu = get_permiso_by_id_menu(men_sec)
            if peticion == 1
              if  @permiso_second_menu.nombre_permiso.downcase["mostrar"] || @permiso_second_menu.nombre_permiso.downcase["crear"]
                #Obtener el nombre del menu a partir de el id del permiso
                nombre_menu = get_menu_name_by_id_permiso(@permiso_second_menu.id)
                menus_secundarios_list << {"nombre"=> nombre_menu, "ruta" => @permiso_second_menu.ruta}
                puts @permiso_second_menu.nombre_permiso + " " + @permiso_second_menu.ruta
              end
            else
              nombre_menu = get_menu_name_by_id_permiso(@permiso_second_menu.id)
              menus_secundarios_list << {"nombre"=> nombre_menu, "ruta" => @permiso_second_menu.ruta}
            end
          end
        end
      end

      menu_hash[nombre_menu_main] = menus_secundarios_list
    end
    return menu_hash

  end

  def get_menu_name_by_id_permiso(id_permiso)
    #Recibimos el id_permiso y le devovlemos el nombre del menu
    @menus = Menu.find_by_sql(["select * from menus where id = (SELECT menu_id from menu_permisos where permiso_id  = ? )", id_permiso])

    @name_menu = ''
    @menus.each do |menu|
      @name_menu = menu.nombre
    end
    
    return @name_menu
  end

  def get_permiso_by_id_menu(id_menu)
    @menu_permiso = MenuPermiso.all

    permiso_menu_uniq = 1
    @menu_permiso.each do |men_per|
      #puts men_per.menu_id.to_s + " vs " + id_menu.to_s
      if men_per.menu_id == id_menu
        permiso_menu_uniq = men_per.permiso_id
        break
      end
    end

    @permiso = Permiso.find(permiso_menu_uniq)
    return @permiso
  end

  def get_permiso_of_empleado_by_id_empleado(id_empleado)
    @permisos_empleado = Permiso.find_by_sql(["SELECT * from permisos where id in (SELECT permiso_id from accesos where rol_id in (SELECT rol_id from rol_empleados where empleado_id = ?))", id_empleado])
    
    # puts "Estos son los permisos de este usuario"
    # @permisos_empleado.each do |permiso|
    #   puts permiso.ruta
    # end

    return @permisos_empleado
  end

  def get_menu_of_empleado_by_id_permisos(id_permisos_list)
    #Este metodo recibe como parametro el listado de id permisos y devuelve los menus relacionados a ese listado
    @menu_empleado = Menu.find_by_sql(["select * from menus where id in (SELECT menu_id from menu_permisos where permiso_id in (?))", id_permisos_list])     
    return @menu_empleado
  end
  

  
  def get_crud_permisos(menu_principal, opcion)
    #EL parametro debe ser el nombre del menu padre, NO submeno, en resumen una palabra en comun que compartan todas las rutas del crud que se este viendo
    #Opcion es un entero, si es 1 devolvera un array, si es 2 devolvera un numero para saber si es el crear

    #1-Mostrar
    #2-Detalle
    #3-Crear
    #4-Editar
    #5-Eliminar
    @usuario = current_user.id
    @empleado = obteniendo_empleado(@usuario)

    @permisos_empleado = get_permiso_of_empleado_by_id_empleado(@empleado.id)

    @permisos_de_ruta = []

    @permisos_empleado.each do |permiso|
      if permiso.ruta[menu_principal]
        if permiso.crud == 4 || permiso.crud == 5 || permiso.crud == 3
          @permisos_de_ruta << permiso.id
        end
      end
    end

    sub_menu_list = get_menu_of_empleado_by_id_permisos(@permisos_de_ruta)

    #1-Mostrar
    #2-Detalle
    #3-Crear
    #4-Editar
    #5-Eliminar



    #1 editar, 2 elimina y 3 crear
    permisos_crud = []
    permiso_crear = false

    sub_menu_list.each do |sub_menu|
      @submen_crud = get_crud_permiso_by_id_menu(sub_menu.id)
      puts "Estos son los permisos"
      puts @submen_crud

      if  @submen_crud ==  4
        permisos_crud << 1

      elsif @submen_crud ==  5
        permisos_crud << 2

      elsif @submen_crud ==  3
        permiso_crear = true
      end
    end

    if opcion == 1
      return permisos_crud
    elsif opcion == 2
      return permiso_crear
    else
      return "Opcion no valida"
    end
    
  end

  def get_crud_permiso_by_id_menu(id_menu)
    
    @permiso = Permiso.find_by_sql(["select crud from permisos where id = (SELECT permiso_id from menu_permisos where menu_id = ?)", id_menu])     

    crud_permiso = 0

    @permiso.each do |per|
      crud_permiso = per.crud
    end
    return crud_permiso

  end
end