

INSERT INTO `peticion` (`id`, `titulo`, `descripcion`, `fase`) VALUES
(1, 'Arreglar bache', 'Arreglar un bache enfrente que hace que las ambulancias se atoren', 'inicial'),
(2, 'Pintar pared', 'Pintar la pared de mi casa porque ya está gachita', 'inicial'),
(3, 'Becas para la primaria', 'La primaria necesita becas para los niños porque no les alcanza ni para los lápices', 'inical');

--
-- Dumping data for table `peticion_user`
--

INSERT INTO `peticion_user` (`peticion_id`, `user_username`) VALUES
(1, 'cix'),
(2, 'cix'),
(3, 'juan');

--
-- Dumping data for table `play_evolutions`
--

INSERT INTO `play_evolutions` (`id`, `hash`, `applied_at`, `apply_script`, `revert_script`, `state`, `last_problem`) VALUES
(1, '97454da6f1f5eb9d635d4ab7948965f7d62259f8', '2015-01-01 01:39:20', 'create table person (\nname                      varchar(255),\nother                     varchar(255))\n;\n\ncreate table peticion (\nid                        bigint auto_increment not null,\ntitulo                    varchar(255),\ndescripcion               varchar(255),\nfase                      varchar(255),\nconstraint pk_peticion primary key (id))\n;\n\ncreate table tarea (\nid                        bigint auto_increment not null,\ntitulo                    varchar(255),\nterminada                 tinyint(1) default 0,\nfecha_entrega             datetime,\nasignado_username         varchar(255),\npeticion_id               bigint,\nconstraint pk_tarea primary key (id))\n;\n\ncreate table user (\nusername                  varchar(255) not null,\nnombre                    varchar(255),\napellido                  varchar(255),\npassword                  varchar(255),\ncorreo                    varchar(255),\nconstraint pk_user primary key (username))\n;\n\n\ncreate table peticion_user (\npeticion_id                    bigint not null,\nuser_username                  varchar(255) not null,\nconstraint pk_peticion_user primary key (peticion_id, user_username))\n;\nalter table tarea add constraint fk_tarea_asignado_1 foreign key (asignado_username) references user (username) on delete restrict on update restrict;\ncreate index ix_tarea_asignado_1 on tarea (asignado_username);\nalter table tarea add constraint fk_tarea_peticion_2 foreign key (peticion_id) references peticion (id) on delete restrict on update restrict;\ncreate index ix_tarea_peticion_2 on tarea (peticion_id);\n\n\n\nalter table peticion_user add constraint fk_peticion_user_peticion_01 foreign key (peticion_id) references peticion (id) on delete restrict on update restrict;\n\nalter table peticion_user add constraint fk_peticion_user_user_02 foreign key (user_username) references user (username) on delete restrict on update restrict;', 'SET FOREIGN_KEY_CHECKS=0;\n\ndrop table person;\n\ndrop table peticion;\n\ndrop table peticion_user;\n\ndrop table tarea;\n\ndrop table user;\n\nSET FOREIGN_KEY_CHECKS=1;', 'applied', '');

--
-- Dumping data for table `tarea`
--

INSERT INTO `tarea` (`id`, `titulo`, `terminada`, `fecha_entrega`, `asignado_username`, `peticion_id`) VALUES
(1, 'comprar cemento', 0, NULL, 'jose', 1);

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `nombre`, `apellido`, `password`, `correo`) VALUES
('cix', 'Roberto', 'Rojas', 'a1a1a1', 'r@r.com'),
('juan', 'Juan', 'Perez', 'aaa', 'juan@algo.com'),
('jose', 'Jose', 'Lopez', 'bbb', 'jose@local.com');
