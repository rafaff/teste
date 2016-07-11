/*
*******************************************
*   Editora: Casa do Código               *
*   Livro..: MySQL do básico ao Avançado  *
*   ISBN...:                              *  
*   Autor..: Vinicius Carvalho de Souza   *
*******************************************

Arquivo: definicao.sql

*/

-- Inicio Criação das Tabelas -- 
	create table comclien(
			n_numeclien int not null auto_increment, 
			c_codiclien varchar(10),
			c_nomeclien varchar(50),
			c_razaclien varchar(50),
			d_dataclien date,
			c_cnpjclien varchar(15),
			c_foneclien varchar(15),
			c_cidaclien varchar(50),
			c_estaclien varchar(50),
			primary key (n_numeclien));		
		
		
	create table comforne(
			n_numeforne int not null auto_increment,
			c_codiforne varchar(10),
			c_nomeforne varchar(50),
			c_razaforne varchar(50),
			c_foneforne varchar(15), 
			primary key(n_numeforne));	
  
	create table comprodu(
			n_numeprodu int not null auto_increment,
			c_codiprodu varchar(20),
			c_descprodu varchar(100),
			n_valoprodu float(10,2),
			c_situprodu varchar(1),
			n_numeforne int,
			primary key(n_numeprodu));	
		
	create table comvenda(
			n_numevenda int not null auto_increment,
			c_codivenda varchar(10),
			n_numeclien int not null,
			n_numeforne int not null,
			n_numevende int not null,
			n_valovenda float(10,2),
			n_descvenda float(10,2),
			n_totavenda float(10,2),
			d_datavenda date,	
			primary key(n_numevenda));	

 create table comvende(
			n_numevende int not null auto_increment,
			c_codivende varchar(10),
			c_nomevende varchar(50),
			c_razavende varchar(50),
			c_fonevende varchar(10),
			n_porcvende float(10,2),
			primary key(n_numevende));			
		
	create table comivenda(
			n_numeivenda int not null auto_increment,
			n_numevenda  int not null,
			n_numeprodu  int not null,
			n_valoivenda float(10,2),
			n_qtdeivenda int,
			n_descivenda float(10,2),
			primary key(n_numeivenda));
-- Fim Criação das Tabelas -- 		
		
-- Inicio Alteração das Tabeals --

	alter table comclien add column c_cidaclien varchar(50);
	
	alter table comclien add column c_estclien varchar(50);		
	
	alter table comclien drop column c_estclien;	
	
	alter table comclien add column c_estaclien varchar(50);	
	
	alter table comclien modify column  c_estaclien int;
	
	alter table comclien modify column c_estaclien varchar(100);
	
-- Fim Alteração das Tabeals --	

-- Inicio de exclusão de tabelas -- 
	drop table comvendas;
-- Fim de exclusão de tabelas -- 

-- Inicio da criação dos inidex -- 
	alter table comprodu 
			add index comprodu_conforne_idx (n_numeforne asc);

	alter table comvenda 
			add index comvenda_comclien (n_numeclien asc);

  alter table comvenda 
			add index comvenda_comforne_idx (n_numeforne asc);
		 
	alter table comivenda 
			add index comivenda_comprodu_idx(n_numeprodu asc);

-- Fim da criação dos index --								
			
-- Inicio da criação das constraints de chave estrangeira -- 			
	alter table comvenda add constraint fk_comprodu_conforne
			foreign key(n_numeforne)
				references comforne(n_numeforne)
					on delete no action
					on update no action;


  alter table comvenda add constraint fk_comvenda_comclien 
			foreign key(n_numeclien) 
				references comclien(n_numeclien)
					on delete no action
					on update no action;

  alter table comvenda add constraint fk_comvenda_comvende 
			foreign key(n_numevende) 
				references comvende(n_numevende)
					on delete no action
					on update no action;
					
  alter table comvenda add constraint fk_comvenda_comforne 
			foreign key(n_numeforne) 
				references comforne(n_numeforne)
					on delete no action
					on update no action;

  alter table comivenda add constraint fk_comivenda_comprodu 
			foreign key(n_numeprodu) 
				references comprodu (n_numeprodu)
					on delete no action 
					on update no action;			
--  Fim da criação das constraints -- 		

-- Inicio da criação de usuarios -- 

	-- criar um usuario
 create user 'comercial'@'%' identified by 'comerci@l';

	-- dando permissão
 grant all privileges on *.* to 'comercial'@'%' with grant option;	

	-- selecionando as permissões do usuario
 show grants for comercial@localhost;	

	-- para consultar os usuarios criados 
 select user,	host from mysql.user;
	
-- Fim da criação de usuarios -- 

