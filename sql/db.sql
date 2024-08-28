CREATE TABLE `device` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `typeId` varchar(255) DEFAULT NULL,
  `pointId` varchar(255) DEFAULT NULL,
  `unitId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `device_data` (
  `id` varchar(255) NOT NULL,
  `value` float DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type_id` varchar(255) DEFAULT NULL,
  `point_id` varchar(255) DEFAULT NULL,
  `unit_id` varchar(255) DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `device_type` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `measure_point` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `unit_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `permission` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `role` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `syslog` (
  `id` varchar(255) NOT NULL,
  `visit_time` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `execution_time` bigint DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `unit` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `manager_name` varchar(255) DEFAULT NULL,
  `manager_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_num` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `unit_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_role` (
  `user_id` varchar(255) NOT NULL,
  `role_id` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
