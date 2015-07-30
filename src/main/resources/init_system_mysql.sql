
/* t_permission1 */
INSERT INTO `t_permission` (`id`, `name`, `ismenu`, `al`, `dt`, `ct`, `ut`) VALUES (1,'manager:user:list',1,'用户列表','/manager/user/list',NULL,'2015-06-10 00:11:14');
/* t_permission2 */
INSERT INTO `t_permission` (`id`, `name`, `ismenu`, `al`, `dt`, `ct`, `ut`) VALUES (2,'manager:authority:users:list',1,'用户权限','/manager/authority/users/list',NULL,'2015-06-10 21:32:50');
/* t_permission3 */
INSERT INTO `t_permission` (`id`, `name`, `ismenu`, `al`, `dt`, `ct`, `ut`) VALUES (3,'manager:authority:roles:list',1,'角色列表','/manager/authority/roles/list',NULL,'2015-06-10 21:12:51');
/* t_permission4 */
INSERT INTO `t_permission` (`id`, `name`, `ismenu`, `al`, `dt`, `ct`, `ut`) VALUES (4,'manager:authority:permissions:list',1,'权限列表','/manager/authority/permissions/list',NULL,'2015-06-10 00:14:53');
/* t_permission6 */
INSERT INTO `t_permission` (`id`, `name`, `ismenu`, `al`, `dt`, `ct`, `ut`) VALUES (6,'manager:order:list',1,'订单列表','',NULL,'2015-06-10 00:16:47');
/* t_permission7 */
INSERT INTO `t_permission` (`id`, `name`, `ismenu`, `al`, `dt`, `ct`, `ut`) VALUES (7,'manager:user:update',0,'用户修改','',NULL,'2015-06-10 22:31:18');
/* t_permission 8*/
INSERT INTO `t_permission` (`id`, `name`, `ismenu`, `al`, `dt`, `ct`, `ut`) VALUES (8,'manager:user:delete',0,'用户删除','',NULL,'2015-06-10 22:32:06');
/* t_permission9 */
INSERT INTO `t_permission` (`id`, `name`, `ismenu`, `al`, `dt`, `ct`, `ut`) VALUES (9,'manager:user:query',0,'用户查询','',NULL,'2015-06-10 22:32:49');

/* t_role1 */
INSERT INTO `t_role` (`id`, `name`, `al`, `dt`, `ct`, `ut`) VALUES (1,'admin',NULL,NULL,NULL,NULL);


/* t_role_permission1 */
INSERT INTO `t_role_permission` (`role_id`, `permission_id`) VALUES (1,4);
/* t_role_permission2 */
INSERT INTO `t_role_permission` (`role_id`, `permission_id`) VALUES (1,3);
/* t_role_permission3 */
INSERT INTO `t_role_permission` (`role_id`, `permission_id`) VALUES (1,2);
/* t_role_permission4 */
INSERT INTO `t_role_permission` (`role_id`, `permission_id`) VALUES (1,8);
/* t_role_permission5 */
INSERT INTO `t_role_permission` (`role_id`, `permission_id`) VALUES (1,1);
/* t_role_permission6 */
INSERT INTO `t_role_permission` (`role_id`, `permission_id`) VALUES (1,9);
/* t_role_permission7 */
INSERT INTO `t_role_permission` (`role_id`, `permission_id`) VALUES (1,7);
/* t_role_permission6 */
INSERT INTO `t_role_permission` (`role_id`, `permission_id`) VALUES (1,6);
/* t_user_role1 */
INSERT INTO `t_user_role` (`u_id`, `role_id`) VALUES (6,1);
/* user_general_info */
INSERT INTO `user_general_info` (`id`, `user_type`, `user_name`, `email`, `password`, `family_name`, `last_name`, `mobile`, `telephone`, `location`, `birthday`, `head_thumb`, `begin_time`, `gender`, `salt`, `register_check_state`, `authentication_stat`, `ct`, `ut`) VALUES (6,0,'a1','a1@163.com','aa52864d7252d01f460de82cc2f6f142d7fe24cadc46f6f2d45022c54d85d5db','a1','a1','13412341234',NULL,NULL,'2015-06-10 21:54:46',NULL,'2015-06-10 21:54:46',NULL,'1bb87a2bcec343ca9dff4a9944d514a8',1,0,'2015-06-10 21:54:46','2015-06-10 21:54:46');

