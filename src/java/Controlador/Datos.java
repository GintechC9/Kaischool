package Controlador;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.*;
import java.util.*;
import java.io.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Alumno
 */
public class Datos {

    //Creamos la conexion a la BD
    public static Connection getConnection() {

        String username, password, url;

        url = "jdbc:mysql://localhost/kaischool";
        username = "root";
        password = "n0m3l0";
        Connection con = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);
            System.out.println("Conexion Exitosa");

        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            System.out.println("Coneccion no exitosa");
        }

        return con;
    }

    public static int guardar(Usuario u) {

        int estado = 0;
        int x = 0;

        try {

            Connection con = Datos.getConnection();
            PreparedStatement set;
            String v = "SELECT * FROM musuario where clave_usu='" + u.getClave() + "'";

            set = con.prepareStatement(v);
            ResultSet rs = set.executeQuery();

            if (rs.next()) {
                estado = 0;
                estado = set.executeUpdate();
                con.close();

            } else {

                String qw = "SELECT * FROM mjefe where num_jef='" + u.getNumerojefe() + "'";

                set = con.prepareStatement(qw);
                rs = set.executeQuery();

                if (rs.next()) {

                    estado = -2;
                    estado = set.executeUpdate();
                    con.close();

                } else {

                    if (u.getTipo() == 3) {

                        String q = "insert into musuario (clave_usu,password_usu,pregunta_usu,respuesta_usu,tipo_usu,codigoalu_usu,estado_usu) values (?,?,?,?,?,?,?)";

                        set = con.prepareStatement(q);

                        set.setString(1, u.getClave());
                        set.setString(2, u.getPassword());
                        set.setInt(3, u.getPregunta());
                        set.setString(4, u.getRespuesta());
                        set.setInt(5, u.getTipo());
                        set.setString(6, u.getCodigo());
                        set.setInt(7, u.getEstado());

                        estado = set.executeUpdate();

                        String a = "insert into mjefe (num_jef,clave_usu) values (?,?)";

                        set = con.prepareStatement(a);

                        set.setString(1, u.getNumerojefe());
                        set.setString(2, u.getClave());

                        estado = set.executeUpdate();

                        for (int i = 0; i < 5; i++) {

                            String g = "G";
                            g = g.concat(CodigoG(3));
                            String Codigo = CodigoG(5);
                            String b = "insert into mgrupo (codigogrupo_grup,nom_grup,num_jef) values ('" + Codigo + "','" + g + "','" + u.getNumerojefe() + "')";
                            set = con.prepareStatement(b);
                            estado = set.executeUpdate();

                        }
                        x = 1;
                    }
                }

                String qwx = "SELECT * FROM malumno where bol_alu='" + u.getBoleta() + "'";

                set = con.prepareStatement(qwx);
                rs = set.executeQuery();

                if (rs.next()) {
                    estado = -3;
                    estado = set.executeUpdate();
                    con.close();

                } else {

                    String qwxz = "SELECT * FROM mgrupo where codigogrupo_grup='" + u.getCodigogrupo() + "'";

                    set = con.prepareStatement(qwxz);
                    rs = set.executeQuery();

                    if (rs.next()) {

                        String qwxza = "SELECT * FROM malumno where codigogrupo_alu='" + u.getCodigogrupo() + "'";

                        set = con.prepareStatement(qwxza);
                        rs = set.executeQuery();
                        int conteo = 0;
                        while (rs.next()) {
                            conteo++;
                        }
                        if (conteo > 44) {
                            estado = -15;
                        } else {
                            if (u.getTipo() == 2) {

                                String q = "insert into musuario (clave_usu,password_usu,pregunta_usu,respuesta_usu,tipo_usu,codigoalu_usu,estado_usu) values (?,?,?,?,?,?,?)";

                                set = con.prepareStatement(q);

                                set.setString(1, u.getClave());
                                set.setString(2, u.getPassword());
                                set.setInt(3, u.getPregunta());
                                set.setString(4, u.getRespuesta());
                                set.setInt(5, u.getTipo());
                                set.setString(6, u.getCodigo());
                                set.setInt(7, u.getEstado());

                                estado = set.executeUpdate();

                                String zqsa = "insert into mpreguntasr(ingreso_pre,vivienda_pre,trabajo_pre) values (0,0,0)";
                                set = con.prepareStatement(zqsa);
                                estado = set.executeUpdate();

                                String qwxzrda = "SELECT * FROM mpreguntasr";
                                int registroa = 0;
                                set = con.prepareStatement(qwxzrda);
                                rs = set.executeQuery();
                                while (rs.next()) {
                                    registroa++;
                                }

                                String zqs = "insert into crendimiento(clave_usu,rendimiento_ren,resultadop_ren,resultadoe_ren,id_pre) values ('" + u.getClave() + "',0,0,0," + registroa + ")";
                                set = con.prepareStatement(zqs);
                                estado = set.executeUpdate();

                                String qwxzrd = "SELECT * FROM crendimiento";
                                int registro = 0;
                                set = con.prepareStatement(qwxzrd);
                                rs = set.executeQuery();
                                while (rs.next()) {
                                    registro++;
                                }

                                String z = "insert into malumno (bol_alu,clave_usu,codigo_alu,codigogrupo_alu,id_ren,pf_alu,ph_alu,pp_alu) values (?,?,?,?,?,0,0,0)";

                                set = con.prepareStatement(z);

                                set.setString(1, u.getBoleta());
                                set.setString(2, u.getClave());
                                set.setString(3, u.getCodigo());
                                set.setString(4, u.getCodigogrupo());
                                set.setInt(5, registro);

                                estado = set.executeUpdate();
                                con.close();
                            }
                        }
                    } else {

                        if (x == 1) {
                        } else {
                            estado = -4;
                        }
                    }
                }

                if (u.getTipo() == 1) {

                    String qwxzt = "SELECT * FROM malumno where codigo_alu='" + u.getCodigo() + "'";

                    set = con.prepareStatement(qwxzt);
                    rs = set.executeQuery();

                    if (rs.next()) {

                        String q = "insert into musuario (clave_usu,password_usu,pregunta_usu,respuesta_usu,tipo_usu,codigoalu_usu,estado_usu) values (?,?,?,?,?,?,?)";

                        set = con.prepareStatement(q);

                        set.setString(1, u.getClave());
                        set.setString(2, u.getPassword());
                        set.setInt(3, u.getPregunta());
                        set.setString(4, u.getRespuesta());
                        set.setInt(5, u.getTipo());
                        set.setString(6, u.getCodigo());
                        set.setInt(7, u.getEstado());

                        estado = set.executeUpdate();
                    } else {
                        estado = -5;
                        estado = set.executeUpdate();
                        con.close();

                    }
                }

                con.close();

            }

        } catch (Exception xp) {
            System.out.println("ERROR en Guardar.");
            System.out.println(xp.getMessage());
            System.out.println(xp.getStackTrace());
        }

        return estado;
    }

    public static Usuario VerificarUsuario(String clave, String password) {

        Connection con = Datos.getConnection();
        Usuario u = new Usuario();

        try {

            String q = "SELECT * FROM musuario WHERE clave_usu='" + clave + "' AND password_usu='" + password + "'";

            PreparedStatement set = con.prepareStatement(q);
            ResultSet rs = set.executeQuery(q);

            if (rs.next()) {
                u.setClave(rs.getString(1));
                u.setPassword(rs.getString(2));
                u.setTipo(rs.getInt(5));
                u.setCodigo(rs.getString(6));
                u.setEstado(rs.getInt(7));

                if (u.getTipo() == 2) {
                    String qw = "SELECT * FROM malumno WHERE clave_usu='" + clave + "'";

                    set = con.prepareStatement(qw);
                    rs = set.executeQuery(qw);

                    if (rs.next()) {
                        u.setBoleta(rs.getString(1));
                        u.setClave(rs.getString(2));
                        u.setCodigoalumno(rs.getString(3));
                        u.setCodigogrupo(rs.getString(4));
                        u.setId_ren(rs.getInt(5));
                    }
                } else if (u.getTipo() == 3) {
                    String qwx = "SELECT * FROM mjefe WHERE clave_usu='" + clave + "'";

                    set = con.prepareStatement(qwx);
                    rs = set.executeQuery(qwx);

                    if (rs.next()) {
                        u.setNumerojefe(rs.getString(1));
                        u.setClave(rs.getString(2));

                    }
                }
            }
            con.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
            ex.getMessage();
        }
        return u;
    }

    public static int SuspenderUsuario(String clave) {

        int estado = 0;

        try {
            Connection con = Datos.getConnection();

            String q = "update musuario set estado_usu=0 where clave_usu='" + clave + "'";

            PreparedStatement set = con.prepareStatement(q);
            estado = set.executeUpdate();
            con.close();

        } catch (Exception x) {
            System.out.println("No se conecto a la tabla.");
            System.out.println(x.getMessage());
            System.out.println(x.getStackTrace());
        }

        return estado;
    }

    public static int HabilitarUsuario(String clave) {

        int estado = 0;

        try {
            Connection con = Datos.getConnection();

            String q = "update musuario set estado_usu=1 where clave_usu='" + clave + "'";

            PreparedStatement set = con.prepareStatement(q);
            estado = set.executeUpdate();
            con.close();

        } catch (Exception x) {
            System.out.println("No se conecto a la tabla.");
            System.out.println(x.getMessage());
            System.out.println(x.getStackTrace());
        }

        return estado;
    }

    public static Usuario RecuperarContrasena(String clave) {

        Usuario u = new Usuario();

        try {
            Connection con = Datos.getConnection();
            PreparedStatement set;
            ResultSet rs;

            String q = "select * from musuario where clave_usu='" + clave + "'";

            set = con.prepareStatement(q);
            rs = set.executeQuery(q);

            if (rs.next()) {

                u.setClave(rs.getString(1));
                u.setPassword(rs.getString(2));
                u.setPregunta(rs.getInt(3));
                u.setRespuesta(rs.getString(4));
                con.close();

            } else {
                System.out.println("No existe ese Usuario");
                con.close();
            }

        } catch (Exception x) {
            System.out.println("No se conecto a la tabla.");
            System.out.println(x.getMessage());
            System.out.println(x.getStackTrace());

        }

        return u;
    }

    public static List<Usuario> ConsultaAdmin() {

        List<Usuario> lista = new ArrayList<Usuario>();

        try {

            Connection con = Datos.getConnection();

            String q = "select * from musuario";

            PreparedStatement set = con.prepareStatement(q);
            ResultSet rs = set.executeQuery(q);
            String ad;
            while (rs.next()) {

                Usuario u = new Usuario();
                ad = rs.getString(1);
                if (ad.equals("Admin")) {
                } else {
                    u.setClave(rs.getString(1));
                    u.setTipo(rs.getInt(5));
                    u.setEstado(rs.getInt(7));
                    lista.add(u);
                    ad = "";
                }
            }

            con.close();

        } catch (Exception x) {
            System.out.println("No se conecto a la tabla.");

        }

        return lista;
    }

    private static final String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

    public static String CodigoG(int count) {
        StringBuilder builder = new StringBuilder();
        while (count-- != 0) {
            int character = (int) (Math.random() * ALPHA_NUMERIC_STRING.length());
            builder.append(ALPHA_NUMERIC_STRING.charAt(character));
        }
        return builder.toString();
    }

    public static List<Grupo> ConsultaGrupos(String NumeroJefe) {

        List<Grupo> list = new ArrayList<Grupo>();

        try {

            Connection con = Datos.getConnection();

            String q = "select * from mgrupo where num_jef='" + NumeroJefe + "'";

            PreparedStatement set = con.prepareStatement(q);
            ResultSet rs = set.executeQuery(q);
            int i = 0;
            while (rs.next()) {
                Grupo g = new Grupo();
                g.setCodigoGrupo(rs.getString(1));
                g.setNombreGrupo(rs.getString(2));
                g.setNumeroEmp(rs.getString(3));
                list.add(g);
            }

            con.close();

        } catch (Exception x) {
            System.out.println("Error en ConsultarGrupos.");
            System.out.println(x.getMessage());
            System.out.println(x.getStackTrace());
        }

        return list;
    }

    public static int CambiarNombreGrupo(String Grupo, String Nombre) {
        int estado = 0;

        try {
            Connection con = Datos.getConnection();

            String qr = "SELECT * FROM mgrupo WHERE nom_grup='" + Nombre + "'";

            PreparedStatement set = con.prepareStatement(qr);
            ResultSet rs = set.executeQuery(qr);

            if (rs.next()) {
                estado = -5;
            } else {

                String q = "update mgrupo set nom_grup='" + Nombre + "' where nom_grup='" + Grupo + "'";

                set = con.prepareStatement(q);
                estado = set.executeUpdate();
                con.close();
            }
        } catch (Exception x) {
            System.out.println("ERROR:En Cambiar Nombre Grupo");
            System.out.println(x.getMessage());
            System.out.println(x.getStackTrace());
        }

        return estado;
    }

    public static List<Usuario> ConsultaAlumnos(String Grupo) {

        List<Usuario> lista = new ArrayList<Usuario>();
        Connection con = Datos.getConnection();
        PreparedStatement set;
        ResultSet rs;

        try {

            String qwx = "SELECT * FROM mgrupo WHERE nom_grup='" + Grupo + "'";

            set = con.prepareStatement(qwx);
            rs = set.executeQuery(qwx);
            String codigo = "";

            if (rs.next()) {
                codigo = rs.getString(1);
            }

            String q = "select * from malumno where codigogrupo_alu='" + codigo + "'";

            set = con.prepareStatement(q);
            rs = set.executeQuery(q);
            while (rs.next()) {

                Usuario u = new Usuario();
                u.setBoleta(rs.getString(1));
                u.setClave(rs.getString(2));
                String qwxa = "SELECT * FROM mpreguntasr WHERE id_pre='" + rs.getInt(5) + "'";
                set = con.prepareStatement(qwxa);
                ResultSet rsa = set.executeQuery(qwxa);
                if (rsa.next()) {
                    u.setIngreso(rsa.getInt(2));
                    u.setVivienda(rsa.getInt(3));
                    u.setTrabajo(rsa.getInt(4));
                    u.setPersonalidad(rsa.getInt(5));
                    lista.add(u);
                }
            }

            con.close();

        } catch (Exception x) {

            System.out.println("No se conecto a la tabla.");
            System.out.println(x.getMessage());
            x.printStackTrace();
        }
        return lista;
    }

    public static int GuardarResultadoTestP(int Resultado, int id) {
        int estado = 0;

        Connection con = Datos.getConnection();
        PreparedStatement set;
        ResultSet rs;

        try {

            String qr = "SELECT * FROM crendimiento WHERE id_ren='" + id + "'";
            set = con.prepareStatement(qr);
            rs = set.executeQuery(qr);

            if (rs.next()) {
                String q = "update crendimiento set resultadop_ren='" + Resultado + "' where id_ren='" + id + "'";

                set = con.prepareStatement(q);
                estado = set.executeUpdate();
                con.close();

            } else {
                estado = -1;

            }
        } catch (Exception x) {
            System.out.println("ERROR:En Guardar Resultado Test Personalidad");
            System.out.println(x.getMessage());
            System.out.println(x.getStackTrace());
        }

        return estado;
    }

    public static int GuardarResultadoTestE(int Resultado, int id) {
        int estado = 0;

        Connection con = Datos.getConnection();
        PreparedStatement set;
        ResultSet rs;

        try {

            String qr = "SELECT * FROM crendimiento WHERE id_ren='" + id + "'";
            set = con.prepareStatement(qr);
            rs = set.executeQuery(qr);

            if (rs.next()) {
                String q = "update crendimiento set resultadoe_ren='" + Resultado + "' where id_ren='" + id + "'";

                set = con.prepareStatement(q);
                estado = set.executeUpdate();
                con.close();

            } else {
                estado = -1;

            }
        } catch (Exception x) {
            System.out.println("ERROR:En Guardar Resultado Test Personalidad");
            System.out.println(x.getMessage());
            System.out.println(x.getStackTrace());
        }

        return estado;
    }

    public static int GuardarPreguntasRE(int ingreso, int trabajo, int vivienda, int id) {
        int estado = 0;

        Connection con = Datos.getConnection();
        PreparedStatement set;
        ResultSet rs;

        try {

            String qr = "SELECT * FROM crendimiento WHERE id_ren='" + id + "'";
            set = con.prepareStatement(qr);
            rs = set.executeQuery(qr);

            if (rs.next()) {
                int registro = rs.getInt(6);
                String q = "update mpreguntasr set ingreso_pre=" + ingreso + ", trabajo_pre=" + trabajo + ",vivienda_pre=" + vivienda + " where id_pre=" + registro + "";

                set = con.prepareStatement(q);
                estado = set.executeUpdate();
                con.close();

            } else {
                estado = -1;

            }
        } catch (Exception x) {
            System.out.println("ERROR:En Preguntas Importantes E");
            System.out.println(x.getMessage());
            System.out.println(x.getStackTrace());
        }

        return estado;
    }

    public static int GuardarPreguntasRP(int id, int resultadop) {
        int estado = 0;

        Connection con = Datos.getConnection();
        PreparedStatement set;
        ResultSet rs;

        try {

            String qr = "SELECT * FROM crendimiento WHERE id_ren='" + id + "'";
            set = con.prepareStatement(qr);
            rs = set.executeQuery(qr);

            if (rs.next()) {
                int registro = rs.getInt(6);
                String q = "update mpreguntasr set personalidad_pre=" + resultadop + " where id_pre=" + registro + "";

                set = con.prepareStatement(q);
                estado = set.executeUpdate();
                con.close();

            } else {
                estado = -1;

            }
        } catch (Exception x) {
            System.out.println("ERROR:En Preguntas Importantes P");
            System.out.println(x.getMessage());
            System.out.println(x.getStackTrace());
        }

        return estado;
    }

    public static void RendimientoA(String Boleta) {

        try {
            //Process p = Runtime.getRuntime().exec("cmd /c dir");
            Process p = Runtime.getRuntime().exec("python C:\\Users\\Usuario\\Documents\\NetBeansProjects\\Kaischool\\RendimientoA.py " + Boleta);
            p.waitFor();
            BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
            String line = reader.readLine();
            while (line != null) {
                System.out.println(line);
                line = reader.readLine();
            }

        } catch (IOException e1) {
            System.out.println("IOException:");
            e1.printStackTrace();
        } catch (InterruptedException e2) {
            System.out.println("InterruptedException:");
            e2.printStackTrace();
        }
        System.out.println("Done");
    }

    public static Usuario ConsultaTests(String Clave) {

        Connection con = Datos.getConnection();
        PreparedStatement set;
        ResultSet rs;
        Usuario u = new Usuario();
        try {

            String qwx = "SELECT * FROM crendimiento WHERE clave_usu='" + Clave + "'";

            set = con.prepareStatement(qwx);
            rs = set.executeQuery(qwx);
            if (rs.next()) {
                u.setClave(rs.getString(2));
                u.setPersonalidad(rs.getInt(4));
                u.setEconomico(rs.getInt(5));
            }

            con.close();

        } catch (Exception e) {

            System.out.println("No se conecto a la tabla.");
            System.out.println(e.getMessage());
            e.printStackTrace();
        }

        return u;
    }

    public static List<String> ConsultaAlu(String Codigo) {

        List<String> lista = new ArrayList<>();
        Connection con = Datos.getConnection();
        PreparedStatement set;
        ResultSet rs;

        try {

            String qwx = "SELECT * FROM malumno WHERE codigo_alu='" + Codigo + "'";

            set = con.prepareStatement(qwx);
            rs = set.executeQuery(qwx);
            String clave = "";
            String boleta = "";
            if (rs.next()) {
                clave = rs.getString(2);
                boleta = rs.getString(1);
                lista.add(boleta);
                lista.add(clave);
            }
            con.close();

        } catch (Exception x) {

            System.out.println("ERROR: Consulta Alu");
            System.out.println(x.getMessage());
            x.printStackTrace();
        }
        return lista;
    }

    public static String ConsulAlu(String Clave) {

        Connection con = Datos.getConnection();
        PreparedStatement set;
        ResultSet rs;
        String boleta = "";
        try {

            String qwx = "SELECT * FROM malumno WHERE clave_usu='" + Clave + "'";

            set = con.prepareStatement(qwx);
            rs = set.executeQuery(qwx);
            if (rs.next()) {
                boleta = rs.getString(1);
            }
            con.close();

        } catch (Exception x) {

            System.out.println("ERROR: Consulta Alu");
            System.out.println(x.getMessage());
            x.printStackTrace();
        }
        return boleta;
    }

    public static String ConsulG(String codigo) {

        Connection con = Datos.getConnection();
        PreparedStatement set;
        ResultSet rs;
        String nombre = "";
        try {

            String qwx = "SELECT * FROM mgrupo WHERE codigogrupo_grup='" + codigo + "'";

            set = con.prepareStatement(qwx);
            rs = set.executeQuery(qwx);
            if (rs.next()) {
                nombre = rs.getString(2);
            }
            con.close();

        } catch (Exception x) {

            System.out.println("ERROR: Consulta Grupo");
            System.out.println(x.getMessage());
            x.printStackTrace();
        }
        return nombre;
    }

    public static Usuario ConsultaAlumno(String Boleta) {
        Usuario u = new Usuario();
        Connection con = Datos.getConnection();
        PreparedStatement set;
        ResultSet rs;

        try {
            //System.out.println(Boleta);
            //System.out.println("SI3");
            String qwx = "SELECT * FROM malumno WHERE bol_alu='" + Boleta + "'";
            set = con.prepareStatement(qwx);
            rs = set.executeQuery(qwx);
            int idren = 0;
            if (rs.next()) {
                u.setBoleta(Boleta);
                u.setClave(rs.getString(2));
                idren = rs.getInt(5);
            }
            //System.out.println(u.getClave());
            //System.out.println("SI2");
            //System.out.println(idren);

            String q = "select * from crendimiento where id_ren =" + idren;

            set = con.prepareStatement(q);
            rs = set.executeQuery(q);
            int idpre = 0;
            if (rs.next()) {
                idpre = rs.getInt(6);

            }
            //System.out.println("SI");
            //System.out.println(idpre);
            String qwxa = "SELECT * FROM mpreguntasr WHERE id_pre=" + idpre;
            set = con.prepareStatement(qwxa);
            ResultSet rsa = set.executeQuery(qwxa);
            //System.out.println("No");
            if (rsa.next()) {
                u.setIngreso(rsa.getInt(2));
                u.setVivienda(rsa.getInt(3));
                u.setTrabajo(rsa.getInt(4));
                u.setPersonalidad(rsa.getInt(5));
            }

            con.close();

        } catch (Exception x) {

            System.out.println("No se conecto a la tablaA.");
            System.out.println(x.getMessage());
            x.printStackTrace();
        }
        return u;
    }

    public static List<Usuario> ConsultaAlumnosP(int filtrado) {

        List<Usuario> lista = new ArrayList<Usuario>();
        List<Integer> lista2 = new ArrayList<Integer>();
        List<Integer> codigo = new ArrayList<Integer>();
        Connection con = Datos.getConnection();
        PreparedStatement set;
        ResultSet rs;

        if (filtrado == 1) {

            try {
                int var = 2;

                String qwx = "SELECT * FROM MPreguntasR WHERE trabajo_pre='" + var + "'";

                set = con.prepareStatement(qwx);
                rs = set.executeQuery(qwx);

                while (rs.next()) {
                    codigo.add(rs.getInt(1));

                }
                for (int i = 0; i < codigo.size(); i++) {

                    String q = "select * from crendimiento where id_pre='" + codigo.get(i) + "'";

                    set = con.prepareStatement(q);
                    rs = set.executeQuery(q);
                    if (rs.next()) {
                        int f = rs.getInt(1);
                        System.out.println("f " + f);
                        lista2.add(rs.getInt(1));
                    }
                }
                for (int i = 0; i < lista2.size(); i++) {
                    Usuario u = new Usuario();
                    int valor = lista2.get(i);
                    System.out.println("Valor" + valor);
                    String qwxa = "SELECT * FROM malumno WHERE id_ren='" + valor + "'";
                    set = con.prepareStatement(qwxa);
                    ResultSet rsa = set.executeQuery(qwxa);
                    while (rsa.next()) {

                        u.setBoleta(rsa.getString(1));
                        System.out.println(u.getBoleta());
                        u.setClave(rsa.getString(2));

                        System.out.println("clave" + u.getClave());
                        lista.add(u);
                    }

                }
                con.close();

            } catch (Exception x) {

                System.out.println("No se conecto a la tabla.");
                System.out.println(x.getMessage());
                x.printStackTrace();
            }
        }
        if (filtrado == 2) {

            try {
                int var = 6;

                String qwx = "SELECT * FROM MPreguntasR WHERE trabajo_pre='" + var + "'";

                set = con.prepareStatement(qwx);
                rs = set.executeQuery(qwx);

                while (rs.next()) {
                    codigo.add(rs.getInt(1));

                }
                for (int i = 0; i < codigo.size(); i++) {

                    String q = "select * from crendimiento where id_pre='" + codigo.get(i) + "'";

                    set = con.prepareStatement(q);
                    rs = set.executeQuery(q);
                    if (rs.next()) {
                        int f = rs.getInt(1);
                        System.out.println("f " + f);
                        lista2.add(rs.getInt(1));
                    }
                }
                for (int i = 0; i < lista2.size(); i++) {
                    Usuario u = new Usuario();
                    int valor = lista2.get(i);
                    System.out.println("Valor" + valor);
                    String qwxa = "SELECT * FROM malumno WHERE id_ren='" + valor + "'";
                    set = con.prepareStatement(qwxa);
                    ResultSet rsa = set.executeQuery(qwxa);
                    while (rsa.next()) {

                        u.setBoleta(rsa.getString(1));
                        System.out.println(u.getBoleta());
                        u.setClave(rsa.getString(2));

                        System.out.println("clave" + u.getClave());
                        lista.add(u);
                    }

                }
                con.close();

            } catch (Exception x) {

                System.out.println("No se conecto a la tabla.");
                System.out.println(x.getMessage());
                x.printStackTrace();
            }
        }
        if (filtrado == 3) {

            try {
                int var = 21;

                String qwx = "SELECT * FROM MPreguntasR WHERE vivienda_pre='" + var + "'";

                set = con.prepareStatement(qwx);
                rs = set.executeQuery(qwx);

                while (rs.next()) {
                    codigo.add(rs.getInt(1));

                }
                for (int i = 0; i < codigo.size(); i++) {

                    String q = "select * from crendimiento where id_pre='" + codigo.get(i) + "'";

                    set = con.prepareStatement(q);
                    rs = set.executeQuery(q);
                    if (rs.next()) {
                        int f = rs.getInt(1);
                        System.out.println("f " + f);
                        lista2.add(rs.getInt(1));
                    }
                }
                for (int i = 0; i < lista2.size(); i++) {
                    Usuario u = new Usuario();
                    int valor = lista2.get(i);
                    System.out.println("Valor" + valor);
                    String qwxa = "SELECT * FROM malumno WHERE id_ren='" + valor + "'";
                    set = con.prepareStatement(qwxa);
                    ResultSet rsa = set.executeQuery(qwxa);
                    while (rsa.next()) {

                        u.setBoleta(rsa.getString(1));
                        System.out.println(u.getBoleta());
                        u.setClave(rsa.getString(2));

                        System.out.println("clave" + u.getClave());
                        lista.add(u);
                    }

                }
                con.close();

            } catch (Exception x) {

                System.out.println("No se conecto a la tabla.");
                System.out.println(x.getMessage());
                x.printStackTrace();
            }
        }
        if (filtrado == 4) {

            try {
                int var = 14;

                String qwx = "SELECT * FROM MPreguntasR WHERE vivienda_pre='" + var + "'";

                set = con.prepareStatement(qwx);
                rs = set.executeQuery(qwx);

                while (rs.next()) {
                    codigo.add(rs.getInt(1));

                }
                for (int i = 0; i < codigo.size(); i++) {

                    String q = "select * from crendimiento where id_pre='" + codigo.get(i) + "'";

                    set = con.prepareStatement(q);
                    rs = set.executeQuery(q);
                    if (rs.next()) {
                        int f = rs.getInt(1);
                        System.out.println("f " + f);
                        lista2.add(rs.getInt(1));
                    }
                }
                for (int i = 0; i < lista2.size(); i++) {
                    Usuario u = new Usuario();
                    int valor = lista2.get(i);
                    System.out.println("Valor" + valor);
                    String qwxa = "SELECT * FROM malumno WHERE id_ren='" + valor + "'";
                    set = con.prepareStatement(qwxa);
                    ResultSet rsa = set.executeQuery(qwxa);
                    while (rsa.next()) {

                        u.setBoleta(rsa.getString(1));
                        System.out.println(u.getBoleta());
                        u.setClave(rsa.getString(2));

                        System.out.println("clave" + u.getClave());
                        lista.add(u);
                    }

                }
                con.close();

            } catch (Exception x) {

                System.out.println("No se conecto a la tabla.");
                System.out.println(x.getMessage());
                x.printStackTrace();
            }
        }
        if (filtrado == 5) {

            try {
                int var = 7;

                String qwx = "SELECT * FROM MPreguntasR WHERE vivienda_pre='" + var + "'";

                set = con.prepareStatement(qwx);
                rs = set.executeQuery(qwx);

                while (rs.next()) {
                    codigo.add(rs.getInt(1));

                }
                for (int i = 0; i < codigo.size(); i++) {

                    String q = "select * from crendimiento where id_pre='" + codigo.get(i) + "'";

                    set = con.prepareStatement(q);
                    rs = set.executeQuery(q);
                    if (rs.next()) {
                        int f = rs.getInt(1);
                        System.out.println("f " + f);
                        lista2.add(rs.getInt(1));
                    }
                }
                for (int i = 0; i < lista2.size(); i++) {
                    Usuario u = new Usuario();
                    int valor = lista2.get(i);
                    System.out.println("Valor" + valor);
                    String qwxa = "SELECT * FROM malumno WHERE id_ren='" + valor + "'";
                    set = con.prepareStatement(qwxa);
                    ResultSet rsa = set.executeQuery(qwxa);
                    while (rsa.next()) {

                        u.setBoleta(rsa.getString(1));
                        System.out.println(u.getBoleta());
                        u.setClave(rsa.getString(2));

                        System.out.println("clave" + u.getClave());
                        lista.add(u);
                    }

                }
                con.close();

            } catch (Exception x) {

                System.out.println("No se conecto a la tabla.");
                System.out.println(x.getMessage());
                x.printStackTrace();
            }
        }
        if (filtrado == 6) {

            try {
                int var = 2;

                String qwx = "SELECT * FROM MPreguntasR WHERE ingreso_pre='" + var + "'";

                set = con.prepareStatement(qwx);
                rs = set.executeQuery(qwx);

                while (rs.next()) {
                    codigo.add(rs.getInt(1));

                }
                for (int i = 0; i < codigo.size(); i++) {

                    String q = "select * from crendimiento where id_pre='" + codigo.get(i) + "'";

                    set = con.prepareStatement(q);
                    rs = set.executeQuery(q);
                    if (rs.next()) {
                        int f = rs.getInt(1);
                        System.out.println("f " + f);
                        lista2.add(rs.getInt(1));
                    }
                }
                for (int i = 0; i < lista2.size(); i++) {
                    Usuario u = new Usuario();
                    int valor = lista2.get(i);
                    System.out.println("Valor" + valor);
                    String qwxa = "SELECT * FROM malumno WHERE id_ren='" + valor + "'";
                    set = con.prepareStatement(qwxa);
                    ResultSet rsa = set.executeQuery(qwxa);
                    while (rsa.next()) {

                        u.setBoleta(rsa.getString(1));
                        System.out.println(u.getBoleta());
                        u.setClave(rsa.getString(2));

                        System.out.println("clave" + u.getClave());
                        lista.add(u);
                    }

                }
                con.close();

            } catch (Exception x) {

                System.out.println("No se conecto a la tabla.");
                System.out.println(x.getMessage());
                x.printStackTrace();
            }
        }
        if (filtrado == 7) {

            try {
                int var = 4;

                String qwx = "SELECT * FROM MPreguntasR WHERE ingreso_pre='" + var + "'";

                set = con.prepareStatement(qwx);
                rs = set.executeQuery(qwx);

                while (rs.next()) {
                    codigo.add(rs.getInt(1));

                }
                for (int i = 0; i < codigo.size(); i++) {

                    String q = "select * from crendimiento where id_pre='" + codigo.get(i) + "'";

                    set = con.prepareStatement(q);
                    rs = set.executeQuery(q);
                    if (rs.next()) {
                        int f = rs.getInt(1);
                        System.out.println("f " + f);
                        lista2.add(rs.getInt(1));
                    }
                }
                for (int i = 0; i < lista2.size(); i++) {
                    Usuario u = new Usuario();
                    int valor = lista2.get(i);
                    System.out.println("Valor" + valor);
                    String qwxa = "SELECT * FROM malumno WHERE id_ren='" + valor + "'";
                    set = con.prepareStatement(qwxa);
                    ResultSet rsa = set.executeQuery(qwxa);
                    while (rsa.next()) {

                        u.setBoleta(rsa.getString(1));
                        System.out.println(u.getBoleta());
                        u.setClave(rsa.getString(2));

                        System.out.println("clave" + u.getClave());
                        lista.add(u);
                    }

                }
                con.close();

            } catch (Exception x) {

                System.out.println("No se conecto a la tabla.");
                System.out.println(x.getMessage());
                x.printStackTrace();
            }
        }
        if (filtrado == 8) {

            try {
                int var = 6;

                String qwx = "SELECT * FROM MPreguntasR WHERE ingreso_pre='" + var + "'";

                set = con.prepareStatement(qwx);
                rs = set.executeQuery(qwx);

                while (rs.next()) {
                    codigo.add(rs.getInt(1));

                }
                for (int i = 0; i < codigo.size(); i++) {

                    String q = "select * from crendimiento where id_pre='" + codigo.get(i) + "'";

                    set = con.prepareStatement(q);
                    rs = set.executeQuery(q);
                    if (rs.next()) {
                        int f = rs.getInt(1);
                        System.out.println("f " + f);
                        lista2.add(rs.getInt(1));
                    }
                }
                for (int i = 0; i < lista2.size(); i++) {
                    Usuario u = new Usuario();
                    int valor = lista2.get(i);
                    System.out.println("Valor" + valor);
                    String qwxa = "SELECT * FROM malumno WHERE id_ren='" + valor + "'";
                    set = con.prepareStatement(qwxa);
                    ResultSet rsa = set.executeQuery(qwxa);
                    while (rsa.next()) {

                        u.setBoleta(rsa.getString(1));
                        System.out.println(u.getBoleta());
                        u.setClave(rsa.getString(2));

                        System.out.println("clave" + u.getClave());
                        lista.add(u);
                    }

                }
                con.close();

            } catch (Exception x) {

                System.out.println("No se conecto a la tabla.");
                System.out.println(x.getMessage());
                x.printStackTrace();
            }
        }
        if (filtrado == 9) {

            try {
                int var = 8;

                String qwx = "SELECT * FROM MPreguntasR WHERE ingreso_pre='" + var + "'";

                set = con.prepareStatement(qwx);
                rs = set.executeQuery(qwx);

                while (rs.next()) {
                    codigo.add(rs.getInt(1));

                }
                for (int i = 0; i < codigo.size(); i++) {

                    String q = "select * from crendimiento where id_pre='" + codigo.get(i) + "'";

                    set = con.prepareStatement(q);
                    rs = set.executeQuery(q);
                    if (rs.next()) {
                        int f = rs.getInt(1);
                        System.out.println("f " + f);
                        lista2.add(rs.getInt(1));
                    }
                }
                for (int i = 0; i < lista2.size(); i++) {
                    Usuario u = new Usuario();
                    int valor = lista2.get(i);
                    System.out.println("Valor" + valor);
                    String qwxa = "SELECT * FROM malumno WHERE id_ren='" + valor + "'";
                    set = con.prepareStatement(qwxa);
                    ResultSet rsa = set.executeQuery(qwxa);
                    while (rsa.next()) {

                        u.setBoleta(rsa.getString(1));
                        System.out.println(u.getBoleta());
                        u.setClave(rsa.getString(2));

                        System.out.println("clave" + u.getClave());
                        lista.add(u);
                    }

                }
                con.close();

            } catch (Exception x) {

                System.out.println("No se conecto a la tabla.");
                System.out.println(x.getMessage());
                x.printStackTrace();
            }
        }
        if (filtrado == 10) {

            try {
                int var = 9;

                String qwx = "SELECT * FROM MPreguntasR WHERE personalidad_pre<'" + var + "'";

                set = con.prepareStatement(qwx);
                rs = set.executeQuery(qwx);

                while (rs.next()) {
                    codigo.add(rs.getInt(1));

                }
                for (int i = 0; i < codigo.size(); i++) {

                    String q = "select * from crendimiento where id_pre='" + codigo.get(i) + "'";

                    set = con.prepareStatement(q);
                    rs = set.executeQuery(q);
                    if (rs.next()) {
                        int f = rs.getInt(1);
                        System.out.println("f " + f);
                        lista2.add(rs.getInt(1));
                    }
                }
                for (int i = 0; i < lista2.size(); i++) {
                    Usuario u = new Usuario();
                    int valor = lista2.get(i);
                    System.out.println("Valor" + valor);
                    String qwxa = "SELECT * FROM malumno WHERE id_ren='" + valor + "'";
                    set = con.prepareStatement(qwxa);
                    ResultSet rsa = set.executeQuery(qwxa);
                    while (rsa.next()) {

                        u.setBoleta(rsa.getString(1));
                        System.out.println(u.getBoleta());
                        u.setClave(rsa.getString(2));

                        System.out.println("clave" + u.getClave());
                        lista.add(u);
                    }

                }
                con.close();

            } catch (Exception x) {

                System.out.println("No se conecto a la tabla.");
                System.out.println(x.getMessage());
                x.printStackTrace();
            }
        }
        if (filtrado == 11) {

            try {

                String qwx = "SELECT * FROM MPreguntasR WHERE personalidad_pre BETWEEN 9 AND 13";

                set = con.prepareStatement(qwx);
                rs = set.executeQuery(qwx);

                while (rs.next()) {
                    codigo.add(rs.getInt(1));

                }
                for (int i = 0; i < codigo.size(); i++) {

                    String q = "select * from crendimiento where id_pre='" + codigo.get(i) + "'";

                    set = con.prepareStatement(q);
                    rs = set.executeQuery(q);
                    if (rs.next()) {
                        int f = rs.getInt(1);
                        System.out.println("f " + f);
                        lista2.add(rs.getInt(1));
                    }
                }
                for (int i = 0; i < lista2.size(); i++) {
                    Usuario u = new Usuario();
                    int valor = lista2.get(i);
                    System.out.println("Valor" + valor);
                    String qwxa = "SELECT * FROM malumno WHERE id_ren='" + valor + "'";
                    set = con.prepareStatement(qwxa);
                    ResultSet rsa = set.executeQuery(qwxa);
                    while (rsa.next()) {

                        u.setBoleta(rsa.getString(1));
                        System.out.println(u.getBoleta());
                        u.setClave(rsa.getString(2));

                        System.out.println("clave" + u.getClave());
                        lista.add(u);
                    }

                }
                con.close();

            } catch (Exception x) {

                System.out.println("No se conecto a la tabla.");
                System.out.println(x.getMessage());
                x.printStackTrace();
            }
        }
        if (filtrado == 12) {

            try {

                String qwx = "SELECT * FROM MPreguntasR WHERE personalidad_pre<13";

                set = con.prepareStatement(qwx);
                rs = set.executeQuery(qwx);

                while (rs.next()) {
                    codigo.add(rs.getInt(1));

                }
                for (int i = 0; i < codigo.size(); i++) {

                    String q = "select * from crendimiento where id_pre='" + codigo.get(i) + "'";

                    set = con.prepareStatement(q);
                    rs = set.executeQuery(q);
                    if (rs.next()) {
                        int f = rs.getInt(1);
                        System.out.println("f " + f);
                        lista2.add(rs.getInt(1));
                    }
                }
                for (int i = 0; i < lista2.size(); i++) {
                    Usuario u = new Usuario();
                    int valor = lista2.get(i);
                    System.out.println("Valor" + valor);
                    String qwxa = "SELECT * FROM malumno WHERE id_ren='" + valor + "'";
                    set = con.prepareStatement(qwxa);
                    ResultSet rsa = set.executeQuery(qwxa);
                    while (rsa.next()) {

                        u.setBoleta(rsa.getString(1));
                        System.out.println(u.getBoleta());
                        u.setClave(rsa.getString(2));

                        System.out.println("clave" + u.getClave());
                        lista.add(u);
                    }

                }
                con.close();

            } catch (Exception x) {

                System.out.println("No se conecto a la tabla.");
                System.out.println(x.getMessage());
                x.printStackTrace();
            }
        }
        return lista;
    }

    public static boolean ValidarS(String cadena) {

        String REG_EXP = "\\\\Â¿+|\\\\?+|\\\\Â°+|\\\\Â¬+||\\\\!+|\\\\#+|\\\\$+|" + "\\\\%+|\\\\&+|\\\\=+|\\\\â€™+|\\\\Â¡+|\\\\++|\\\\*+|\\\\~+|\\\\";
        Pattern pattern = Pattern.compile(REG_EXP);
        System.out.println(pattern);
        Matcher matcher = pattern.matcher(cadena);
        System.out.println(cadena);
        System.out.println("QUE SERA?");
        System.out.println(matcher.find()); //imprime true si tiene alguno de los caracteres anteriores o false si no tiene ninguno
        return true;
    }

}
