<%--
     Document   : index
     Created on : 01/11/2017, 23:35:32
     Author     : Gabriel Silva
--%>
<%
    String nomeUsuario = (String) request.getSession().getAttribute("nome");
    if (nomeUsuario != null) {
        response.sendRedirect("dashboard.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>IFCommunity | Login</title>
        <!-- Import Materialize CSS -->
        <link type="text/css" rel="stylesheet" href="src/main/css/materialize.min.css"  media="screen,projection"/>
        <!-- Import Material Icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- Import Style CSS -->
        <link rel="stylesheet" type="text/css" href="src/main/css/style.css">
    </head>

    <body id="body-login">
        <div class="campo-erro">
            <%                
                String erro = (String) request.getAttribute("erros");
                String login = (String) request.getAttribute("login");
                String errosCadastro = (String) request.getAttribute("erros-cadastro");
                if (erro != null) {
                    out.print("<span id='erro-hiden'>");
                    out.print(erro);
                    out.print("</span>");
                }
                
                if (login != null) {
                    out.print("<span id='login-hidden'>");
                    out.print(login);
                    out.print("</span>");
                }
                
                if (errosCadastro != "") {
                    out.print("<span id='erros-cadastro-hidden'>");
                    out.print(errosCadastro);
                    out.print("</span>");
                }
            %>
        </div>
        <div class="container">
            <div class="row">
                <div id="div-titulo" class="col s6">
                    <h2 id="titulo1">Compartilhe códigos na comunidade IF</h2>
                    <h4 id="titulo2">Plataforma desenvolvida para compartilhar códigos de todos as discilpinas</h4>
                </div>
                <div class="col s1"></div>
                <div class="col s5">
                    <center>

                        <!-- FORM LOGIN -->
                        <form name="form-login" class="col s11 z-depth-3 grey lighten-4 div-form" id="form-login" action="Login" method="POST">
                            <div class="row">
                                <h3 class="indigo-text">IFCommunity</h3>
                                <div class="input-field col s12" id="div-erro-cadastro-span">
                                    <span id="erro-cadsatro-span" class="erro-span"></span>
                                </div>
                                
                            </div>

                            <div class="row">
                                <div class='input-field col s12'>
                                    <input class='validate' type='text' name='login' id='login' />
                                    <label for='login'>Login ou email</label>
                                    <span id="erro-login" class="erro-span"></span>
                                </div>
                            </div>

                            <div class="row">
                                <div class='input-field col s12'>
                                    <input class='validate' type='password' name='senha' id='senha-login' />
                                    <button type="button" id="mostrar-senha-login" class="btn-mostrar-senha"><i class="material-icons">remove_red_eye</i></button>
                                    <label for='senha-login'>Senha</label>
                                    <span id="erro-senha-login" class="erro-span"></span>
                                </div>

                                <label class="esqueci-minha-senha">
                                    <a id="btn-esqueci-senha" class='red-text' href='#!'><b>Esqueci minha senha</b></a>
                                </label>
                            </div>

                            <div class="row">
                                <button id="btn-login" type='submit' name='btn-login' class='col s12 btn btn-large waves-effect indigo'>Login</button>
                            </div>
                            <a href="" id="btn-criar-conta">Criar uma conta</a>
                        </form>

                        <!-- FORM ESQUECI MINHA SENHA -->
                        <form name="form-esqueci-senha" class="col s11 z-depth-3 grey lighten-4 div-form" id="form-esqueci-senha" action="EsqueciSenha" method="POST">
                            <div class="row row-titulo">
                                <h3 class="indigo-text">Esqueci a Senha</h3>
                            </div>

                            <div class="col s12">
                                <h4>FUNÇÃO NÃO IMPLEMENTADA</h4>
                                <h6 class="indigo-text lighten-3-text ">Insira seu email para recuperar sua senha!<br></h6>
                            </div>
                            <div class="row">
                                <div class='input-field col s12'>
                                    <input class='validate' type='email' name='email' id='email-recuperar-senha' maxlength="60" required/>
                                    <label for='email'>Email</label>
                                </div>
                                <span id="texto-enviado-email"></span>
                            </div>
                            <div class="row">
                                <button id="btn-esqueci-senha-submit" type='button' name='btn-esqueci-minha-submit' class='col s12 btn btn-large waves-effect indigo'>Enviar</button>
                            </div>
                            <a href="" id="btn-voltar-login">Voltar</a>
                        </form>

                        <!-- FORM CADASTRAR -->
                        <form name="form-cadastrar" class="col s11 z-depth-3 grey lighten-4 div-form" id="form-cadastrar" action="Cadastrar" method="POST">
                            <div id="form-cadastro">
                                <div class="row row-titulo">
                                    <h3 class="indigo-text">Cadastro</h3>
                                </div>

                                <div class="row">
                                    <div class='input-field col s12'>
                                        <input class='validate' type='text' name='nome' id='nome' minlength="3" maxlength="60" required/>
                                        <label id="nome-cadastro" for='nome'>Nome</label>
                                        <span id="erro-nome" class="erro-span"></span>
                                    </div>

                                    <div class='input-field col s12'>
                                        <input class='validate telefone-mask' type='text' name='telefone' id='telefone' maxlength="18" required/>
                                        <label id="telefone-cadastro" for='telefone'>Telefone</label>
                                        <span id="erro-telefone" class="erro-span"></span>

                                    </div>
                                    <div class='input-field col s9'>
                                        <input class='validate matricula-mask' type='text' name='matricula' id='matricula' minlength="13"  maxlength="14" required/>
                                        <label for='matricula'>Matrícula</label>
                                        <span id="erro-matricula" class="erro-span"></span>
                                    </div>
                                    <div class='input-field col s3'>
                                        <input class='validate' type='number' name='periodo' id='periodo'
                                               maxlength="2"  min="1" max='12' value='1' required/>
                                        <label for='periodo'>Período</label>
                                    </div>
                                </div>

                                <div class="row">
                                    <button id="btn-cadastrar-proximo" type='button' name='btn-cadastrar-proximo' class='col s12 btn btn-large waves-effect indigo disabled'>Próximo</button>
                                </div>
                                <a href="" id="btn-voltar">Voltar</a>
                            </div>

                            <!-- FORM CADASTRAR 2a TELA -->
                            <div id="form-cadastro-2">
                                <div class="row row-titulo">
                                    <h3 class="indigo-text">Finalizar cadastro</h3>
                                </div>

                                <div class="row">
                                    <div class='input-field col s12'>
                                        <input class='validate' type='text' name='login-cadastro' id='login-cadastro' minlength="6" maxlength="20" required/>
                                        <label for='login-cadastro'>Usuário</label>
                                        <span id="erro-usuario" class="erro-span"></span>
                                    </div>
                                    <div class='input-field col s12'>
                                        <input class='validate' type='password' name='senha' id='senha-cadastro' minlength="8" maxlength="25" required/>
                                        <button type="button" id="mostrar-senha-cadastro" class="btn-mostrar-senha"><i class="material-icons">remove_red_eye</i></button>
                                        <label for='senha-cadastro'>Senha</label>
                                        <span id="erro-senha" class="erro-span"></span>
                                    </div>
                                    <div class='input-field col s12'>
                                        <input class='validate' type='email' name='email' id='email' maxlength="60" required/>
                                        <label for='email'>Email</label>
                                        <span id="erro-email" class="erro-span"></span>
                                    </div>
                                </div>

                                <div class="row">
                                    <button id="btn-cadastrar" type='submit' name='btn-cadastrar' class='col s12 btn btn-large waves-effect indigo'>Cadastrar</button>
                                </div>
                                <a href="" id="btn-voltar-tela-2">Voltar</a>
                            </div>
                        </form>
                    </center>
                </div>
            </div>
        </div>

        <!-- Import jQuery -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <!-- Import Materialize JS -->
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <!-- Import jQuery Mask JS -->
        <script src="js/jquery.mask.min.js"></script>
        <!-- Import Login JS -->
        <script src="js/login.js"></script>
    </body>
</html>