<%-- 
    Document   : dashboard
    Created on : 01/11/2017, 21:27:58
    Author     : Gabriel Silva
--%>

<%@page import="br.com.integrador.model.Aluno"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nome = (String) request.getSession().getAttribute("nome");

    if (nome == null) {
        request.getSession().setAttribute("nome", null);
        response.sendRedirect("index.jsp");
    } else {
        String[] nomeSplitado = nome.split(" ");
        if (nomeSplitado.length > 2) {
            nome = nomeSplitado[0] + " " + nomeSplitado[1];
        }
    }
%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>IFCommunity | Dashboard</title>
        <!-- Import Materialize CSS -->
        <link type="text/css" rel="stylesheet" href="src/main/css/materialize.min.css" media="screen,projection" />
        <!-- Import Material Icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- Import Style CSS -->
        <link rel="stylesheet" type="text/css" href="src/main/css/style.css">
        <!-- Import prism -->
        <link href="src/main/css/prism.css" rel="stylesheet" />

        <link rel="stylesheet" type="text/css" href="src/main/css/result-light.css">

    </head>

    <body id="body-principal">

        <div class="content-header valign-wrapper">
            <h1 class="section-title">IF<span class="section-title-dois">community</span></h1>
        </div>
        <span id="id-usuario">${id}</span>
        <nav class="nav-side menu">
            <a href="#" class="nav-toggle"></a>
            <header class="avatar">
                <div class="container">
                </div>
                <h2><%out.print(nome);%></h2>
            </header>
            <ul class="para-scroll">
                <li tabindex="0" class="icon-users"><span id="perfil">Perfil</span></li>
                <li tabindex="0" class="icon-materias"><span id="minhas-materias">Minhas matérias</span></li>
                <div class="minhas-materias-adicionadas">
                    <ul class="lista-materias"></ul>
                </div>
                <li tabindex="0" class="icon-dashboard"><span id="adicionar-materias">Gerenciar matérias</span></li>
                <li tabindex="0" class="icon-help"><span id="ajuda">Ajuda</span></li>
                <li tabindex="0" id="li-deslogar" class="icon-sair"><span id="btn-deslogar">Sair</span></li>
            </ul>
        </nav>

        <main class="site-content cor-fundo">

            <!-- Sessão do perfil !--> 
            <section class="postagens perfil section-aparece">
                <div class="box-padrao">
                    <h3>Perfil</h3>
                    <div class="row">
                        <form class="col s12">
                            <div class="row">
                                <div class="input-field col s6">
                                    <i class="material-icons prefix">account_circle</i>
                                    <input id="icon_prefix" type="text" class="validate">
                                    <label for="icon_prefix">Primeiro nome</label>
                                </div>
                                <div class="input-field col s6">
                                    <i class="material-icons prefix">account_circle</i>
                                    <input id="icon_prefix" type="text" class="validate">
                                    <label for="icon_prefix">Sobrenome</label>
                                </div>
                                <div class="input-field col s6">
                                    <i class="material-icons prefix">phone</i>
                                    <input id="icon_telephone" type="tel" class="validate">
                                    <label for="icon_telephone">Celular</label>
                                </div>
                                <div class="input-field col s6">
                                    <i class="material-icons prefix">mail</i>
                                    <input id="email" type="email" class="validate">
                                    <label for="email">Email</label>
                                </div>
                                <div class="input-field col s6">
                                    <i class="material-icons prefix">face</i>
                                    <select>
                                        <option value="" disabled selected>Selecione</option>
                                        <option value="1">1° Período</option>
                                        <option value="2">2° Período</option>
                                        <option value="3">3° Período</option>
                                        <option value="4">4° Período</option>
                                        <option value="5">5° Período</option>
                                    </select>
                                    <label>Período</label>
                                </div>
                                <div class="input-field col s6">
                                    <i class="material-icons prefix">school</i>
                                    <input id="icon_prefix" type="text" class="validate">
                                    <label for="icon_prefix">Matrícula</label>
                                </div>
                            </div>
                            <div class="row center-align">
                                <button class="btn waves-effect waves-light" type="submit" name="action">Ok, tudo certo!
                                    <i class="material-icons right">send</i>
                                </button>
                                <button class="btn waves-effect red darken-3 waves-light" type="reset" name="action">Ops, limpar campos.
                                    <i class="material-icons right">send</i>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </section>

            <!-- Sessão de postagens !--> 
            <section class="postagens minhas-materias row">

                <!-- aqui vão as postagens adicionadas dinamicamente !--> 

            </section>

            <section class="postagens adicionar-materias row">
                <div class="box-padrao">
                    <h3>Gerenciar matérias</h3>
                    <div class="row">
                        <form class="col s12">
                            <div class="input-field col s6">
                                <i class="material-icons prefix">face</i>

                                <select id="periodo-select" data-class="slCadPeriodo" required>
                                    <option value="" disabled selected>Selecione</option>
                                    <option value="1">1° Período</option>
                                    <option value="2">2° Período</option>
                                    <option value="3">3° Período</option>
                                    <option value="4">4° Período</option>
                                    <option value="5">5° Período</option>
                                </select>
                                <label>Período</label>
                            </div>
                            <div class="input-field col s6">
                                <i class="material-icons prefix">face</i>
                                <select id="materia-select" data-class="slCadMateria">
                                    <option value="" disabled selected>Selecione</option>
                                    <option value="1">1° Período</option>
                                    <option value="2">2° Período</option>
                                    <option value="3">3° Período</option>
                                    <option value="4">4° Período</option>
                                    <option value="5">5° Período</option>
                                </select>
                                <label>Matéria</label>
                            </div>
                        </form>
                    </div>
                </div>
                </div>
            </section>


            <!-- Aviso no click de minhas matérias !--> 
            <div class="aviso-minhas-materias container box-padrao">
                <h3>Coding section</h3>
                <div class="page-footer">
                    <div class="container">
                        <div class="row">
                            <div class="col l6 s12 center-align">
                                <h5 class="white-text">Bem vindo ao dashboard de postagens!</h5>
                                <img id="img-code" src="https://www.happycodeclub.com/wp-content/uploads/2017/07/cropped-HappyCodeRedLogo_SmileOnlyCuout-300x300.png">
                            </div>
                            <div class="col l4 offset-l2 s12">
                                <h5 class="white-text">Tips</h5>
                                <ul>
                                    <li>Clique em uma das matérias em que você está cadastrado no menu ao lado.</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="footer-copyright row">
                        <div class="col s6 grey-text"></div>
                        <div class="col s6 grey-text"></div>
                    </div>
                </div>
            </div>

            <!-- aqui é o loader que exibe enquanto carrega algo !--> 
            <div class="preloader-wrapper big active">
                <div class="spinner-layer spinner-blue-only">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div><div class="gap-patch">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>

            <!-- bar para o modal e modal logo abaixo !-->  
            <div class="botao-modal">
                <div class="fixed-action-btn vertical">
                    <a class="btn-floating btn-large indigo darken-3">
                        <i class="large material-icons">code</i>
                    </a>
                    <ul>
                        <li ><a href="#modal1" id="modal-de-escrever-codigo" class="btn-floating green lighten-2 waves-effect waves-light btn modal-trigger tooltipped" data-position="left" data-delay="50" data-tooltip="Adicionar código"><i class="material-icons">add</i></a></li>
                        <li><a class="btn-floating grey tooltipped" data-position="left" data-delay="50" data-tooltip="Buscar"><i class="material-icons">search</i></a></li>
                    </ul>
                </div>
            </div>

            <div id="modal1" class="modal modal-fixed-footer">
                <form id="formDoModal">
                    <div class="modal-head center">
                        <p>Escreva aqui a sua contribuição!</p>
                    </div>
                    <hr>

                    <div class="row col s12">
                        <div class="input-field col s6">
                            <i class= "material-icons prefix small">subject</i>
                            <input id="icon_prefix" type="text" class="validate" required="required">
                            <label for="icon_prefix">Assunto</label>
                        </div>
                        <div id="qual-linguagem-modal" class="input-field col s6">
                            <i class="material-icons prefix small">code</i>
                            <select name="qual-linguagem" required="required">
                                <option value="" disabled selected>Selecione</option>
                                <option value="1">Javascript</option>
                                <option value="2">Java</option>
                                <option value="3">html</option>
                                <option value="4">Texto normal</option>
                            </select>
                            <label>Linguagem</label>
                        </div>

                    </div>

                    <div class="modal-content">   
                    </div>

                    <div class="modal-footer">
                        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Submeter</a>
                    </div>
                </form>
            </div>

        </main>


        <!-- Import jQuery -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <!-- Import Materialize JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <!-- Import Prism JS -->      
        <script src="js/prism.js"></script>
        <script type="text/javascript" src="js/dummy.js"></script>
        <script type="text/javascript" src="js/prism-sql.min.js"></script>
        <script src="//unpkg.com/prismjs/components/prism-ruby.js"></script>
        <!-- Import jQuery Mask JS -->
        <script src="js/jquery.mask.min.js"></script>
        <!-- Import Dashboard JS -->
        <script src="js/dashboard.js"></script>

    </body>

</html>
