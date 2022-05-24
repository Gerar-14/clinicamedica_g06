class SeguridadsController < ApplicationController

    def self.holamundo(nombre)
    puts "hola mundo " + nombre
    end

    def self.verificarAcceso(idUsuario)
    @accesos = Acceso.all
    
    @usuario = idUsuario
    #@usuario = current_user.id

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
    #select 

    #puts "estos son las ruta y sus nombres"

    #@tabla_permisos.each do |tp|
        # puts tp.nombre_permiso
        # puts tp.ruta
    #end
    #puts @tabla_permisos

    #arreglo = []
    #@accesos.each do |acceso|
        #if acceso.rol_id == 1
        # arreglo << acceso

        #puts "estoy en el if"
        #puts acceso.rol_id
        #end
        #puts "esto es un acceso"
        #puts acceso.rol_id
    #end
    #arreglo
    end

    def self.obteniendo_empleado(usuario)
    @empleado = Empleado.all
    @id_empleado = ''

    #puts "este es el usuario"
    #puts @usuario

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

    def self.rol_empleado(id_empleado)
    @rol_empl = RolEmpleado.all
    rolemp = []

    @rol_empl.each do |role|
        if role.empleado_id == id_empleado
        rolemp << role.rol_id
        end 
    end

    rolemp

    end

    def self.obtener_id_permiso(roles)

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

    def self.obtener_id_menu_de_rol_menu(roles)
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

    def self.obtener_menu_principal(idMenu)
    #idMenu devuelve 4,3
    #esperamos que nos devuelva 4
    @menu_p = Menu.all

    @menu_a = []

    @menu_p.each do |m|
        idMenu.each do |me|
        #puts m.menu_id.to_s + " vs " + me.to_s
        if m.menu_id == me && m.menu_id != nil
            @menu_a << m.menu_id  
            #puts "entre al if esto tiene m.id"
            #puts m.id
        end
        end
    end
    #para eliminar repetidos con uniq
    @menu_a.uniq

    end

    def self.obtener_menu_sub(idMenuPrinc)
    #idMenuPrinc es 3
    @menu_s = Menu.all

    @menu_sa = []

    idMenuPrinc.each do |p|
        @menu_s.each do |s|
        #puts s.menu_id.to_s + " vs " + p.to_s
        if s.menu_id == p && s.menu_id != nil
            #puts "estpy en el if esto es p"
            #puts p
            #puts s.id
            @menu_sa << s.id
        end
        end
    end

    @menu_sa.uniq

    end

    def self.obtener_id_permiso_de_menu_permiso(idSubMenu)

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

    def self.validar_permisos_de_usuario(idPermisoUsuario, idSubMenu)
    #idPermisoUsuario son los permisos que el rol tiene en la tabla acceso
    #idSubMenu con todos los sub menus disponibles
    @permisos_de_rol = []

    idSubMenu.each do |sm|
        idPermisoUsuario.each do |pu|
        #puts pu.to_s + " vs " + sm.to_s
        if sm == pu
            @permisos_de_rol << sm
        end 
        end
    end

    @permisos_de_rol

    end

    def self.obtener_tabla_permiso(idMenuUsuario)

    @tabla_permiso_list = []

    idMenuUsuario.each do |mu|
        @tabla_permiso = Permiso.find(mu)
        #puts "esta es la tabla permiso"
        #puts @tabla_permiso.nombre_permiso
        #puts @tabla_permiso.ruta
        @tabla_permiso_list << @tabla_permiso
    end

    @tabla_permiso_list
    end

    def self.direccionador(ruta,direccion,idUsuario)

    @accesoss = verificarAcceso(idUsuario)
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
        return '/home'
    end

    end

    def self.direccionador_destroy(ruta,idUsuario)
    @accesoss = verificarAcceso(idUsuario)
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
        #puts "entre al if del controller"
        @menu.destroy
        respond_to do |format|
        format.html { redirect_to menus_url, notice: "Menu was successfully destroyed." }
        format.json { head :no_content }
        end
        #return direccion
    else
        #puts "entre al else del controller"
        return '/home'
    end
    end

end