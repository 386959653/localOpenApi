/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.35-log : Database - officialWeb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS */`officialWeb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `officialWeb`;

/*Table structure for table `role_permission` */

DROP TABLE IF EXISTS `role_permission`;

CREATE TABLE `role_permission` (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  `insert_username` varchar(100) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `update_username` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_permission` */

insert  into `role_permission`(`id`,`role_id`,`permission_id`,`insert_username`,`insert_time`,`update_username`,`update_time`) values (1,1,1,NULL,NULL,NULL,NULL),(2,2,1,NULL,NULL,NULL,NULL);

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL,
  `permission_name` varchar(100) DEFAULT NULL,
  `url` varchar(2083) DEFAULT NULL,
  `insert_username` varchar(100) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `update_username` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`permission_name`,`url`,`insert_username`,`insert_time`,`update_username`,`update_time`) values (1,'管理员','/userList',NULL,NULL,NULL,NULL);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL,
  `role_name` varchar(100) DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL COMMENT '父角色id',
  `insert_username` varchar(100) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `update_username` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`role_name`,`pid`,`insert_username`,`insert_time`,`update_username`,`update_time`) values (1,'admin',2,NULL,NULL,NULL,NULL),(2,'user',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `insert_username` varchar(100) DEFAULT NULL,
  `update_username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`username`,`password`,`update_time`,`insert_time`,`insert_username`,`update_username`) values (1,'test','123','2018-06-14 16:33:13',NULL,NULL,NULL),(2,'admin','123',NULL,NULL,NULL,NULL),(1007176995952451586,NULL,NULL,NULL,'2018-06-14 16:24:56',NULL,NULL),(1007179783004606466,NULL,NULL,NULL,'2018-06-14 16:35:47','anonymousUser',NULL),(1007181970631864322,NULL,NULL,'2018-06-14 16:44:29','2018-06-14 16:44:29','anonymousUser',NULL),(1007182812852318210,NULL,NULL,'2018-06-14 16:47:50','2018-06-14 16:47:50','anonymousUser','anonymousUser');

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `insert_username` varchar(100) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `update_username` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

/*Data for the table `user_role` */

insert  into `user_role`(`id`,`user_id`,`role_id`,`insert_username`,`insert_time`,`update_username`,`update_time`) values (1,1,2,NULL,NULL,NULL,NULL),(2,2,1,NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

drop table if exists carousel;

drop table if exists contact;

drop table if exists product;

/*==============================================================*/
/* Table: carousel                                              */
/*==============================================================*/
create table carousel
(
  id              bigint not null
  comment '主键',
  img_name        varchar(100) comment '图片名称',
  img_url         varchar(2083) comment '图片地址',
  insert_username varchar(100) comment 'insert_username',
  insert_time     datetime comment 'insert_time',
  update_username varchar(100) comment 'update_username',
  update_time     datetime comment 'update_time'
);

alter table carousel
  comment '轮播图表';

/*==============================================================*/
/* Table: contact                                               */
/*==============================================================*/
create table contact
(
  id              bigint not null
  comment '主键',
  qq              varchar(50) comment 'QQ',
  qq_descp        varchar(200) comment 'QQ说明',
  email           varchar(200) comment 'email',
  email_descp     varchar(200) comment 'email说明',
  city            varchar(50) comment '所在城市',
  detail_address  varchar(500) comment '详细地址',
  gps_address     varchar(100) comment '经纬度',
  insert_username varchar(100) comment 'insert_username',
  insert_time     datetime comment 'insert_time',
  update_username varchar(100) comment 'update_username',
  update_time     datetime comment 'update_time'
);

alter table contact
  comment '联系表';


/*==============================================================*/
/* Table: product                                               */
/*==============================================================*/
create table product
(
  id               bigint not null
  comment '主键',
  product_name     varchar(100) comment '产品名称',
  product_abstract varchar(2000) comment '产品简介',
  thumbnail_url    varchar(2083) comment '产品缩略图地址',
  product_detail   varchar(16383) comment '产品详情，最大长度16383字符',
  insert_username  varchar(100) comment 'insert_username',
  insert_time      datetime comment 'insert_time',
  update_username  varchar(100) comment 'update_username',
  update_time      datetime comment 'update_time'
);

alter table product
  comment '产品表';

ALTER TABLE product
  ADD PRIMARY KEY (id);
ALTER TABLE contact
  ADD PRIMARY KEY (id);
ALTER TABLE carousel
  ADD PRIMARY KEY (id);
ALTER TABLE `officialWeb`.`carousel`
  ADD COLUMN `img_link` VARCHAR(2083) NULL
COMMENT '图片链接'
  AFTER `img_url`,
  ADD COLUMN `enable_flag` VARCHAR(1) NULL
COMMENT '启用标志(Y/N)'
  AFTER `img_link`;
alter table `officialWeb`.`carousel`
  ADD COLUMN `order_num` int NULL
COMMENT '排序字段'
  AFTER `enable_flag`;

ALTER TABLE carousel
  MODIFY enable_flag enum ("Y", "N") COMMENT '启用标志(Y/N)';
ALTER TABLE carousel
  ALTER COLUMN enable_flag SET DEFAULT "N";

create table persistent_logins (
  username  varchar(100) not null,
  series    varchar(64) primary key,
  token     varchar(64)  not null,
  last_used timestamp    not null
);

drop table if exists jrebel;
/*==============================================================*/
/* Table: jrebel                                                */
/*==============================================================*/
create table jrebel
(
  id              bigint not null
  comment '主键',
  defined_user_id varchar(100) comment '邮箱',
  token           varchar(36) comment '36位guid',
  insert_username varchar(100) comment 'insert_username',
  insert_time     datetime comment 'insert_time',
  update_username varchar(100) comment 'update_username',
  update_time     datetime comment 'update_time',
  primary key (id)
);

alter table jrebel
  comment 'jrebel注册表';

drop table if exists taobao_order;

/*==============================================================*/
/* Table: taobao_order                                          */
/*==============================================================*/
create table taobao_order
(
  id              bigint not null
  comment '主键',
  order_num       varchar(18) comment '订单编号',
  enable_flag     enum ("Y", "N") default "Y"
  comment '启用标志(Y/N)',
  insert_username varchar(100) comment 'insert_username',
  insert_time     datetime comment 'insert_time',
  update_username varchar(100) comment 'update_username',
  update_time     datetime comment 'update_time',
  primary key (id)
);

alter table taobao_order
  comment '淘宝订单表';
