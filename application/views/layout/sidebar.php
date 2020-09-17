        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<?= base_url('/user'); ?>">
                <div class="sidebar-brand-icon">
                    <i class="fas fa-calendar-alt" style="font-size: 1rem;"></i>
                </div>
                <div class="sidebar-brand-text mx-1">E-RAPAT <small>Cpanel</small></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <?php

            // Menu Join Query with two tables
            $role_id = $this->session->userdata('role_id');

            $queryMenu = "SELECT `user_menu`.`id`, `menu` 
                            FROM `user_menu` JOIN `user_access_menu` 
                              ON `user_menu`.`id` = `user_access_menu`.`menu_id` 
                           WHERE `user_access_menu`.`role_id` = $role_id 
                        ORDER BY `user_access_menu`.`menu_id` ASC";

            $menu = $this->db->query($queryMenu)->result_array();
            ?>

            <!-- Menu Looping -->
            <?php foreach ($menu as $m) : ?>
                <div class="sidebar-heading text-white">
                    <!-- ROLE <?= $m['menu']; ?> -->
                </div>


                <!-- Sub-Menu Looping based on Menus above -->
                <?php
                $menuId = $m['id'];
                $querySubMenu = "SELECT *
                                     FROM `user_sub_menu` JOIN `user_menu` 
                                       ON `user_sub_menu`.`menu_id` = `user_menu`.`id`
                                    WHERE `user_sub_menu`.`menu_id` = $menuId
                                      AND `user_sub_menu`.`is_active` = 1
                                 ORDER BY `user_sub_menu`.`id` ASC";

                $subMenu = $this->db->query($querySubMenu)->result_array();
                ?>

                <?php foreach ($subMenu as $sm) : ?>
                    <?php if ($title == $sm['title']) : ?>
                        <!-- Nav Item - Dashboard -->
                        <li class="nav-item active">
                        <?php else : ?>
                        <li class="nav-item">
                        <?php endif; ?>
                        <?php if ($sm['title'] == 'Edit Profile') : ?>
                            <a class="hide"></a>
                        <?php else : ?>
                            <a class="nav-link py-2" href="<?= base_url($sm['url']); ?>">
                                <i class="<?= $sm['icon']; ?>"></i>
                                <span><?= $sm['title']; ?></span></a>
                        <?php endif; ?>
                        </li>
                    <?php endforeach; ?>
                <?php endforeach; ?>

                <!-- Divider -->
                <hr class="sidebar-divider mt-3">

                <!-- Logout Menu -->
                <li class="nav-item">
                    <a class="nav-link py-2" href="#" data-toggle="modal" data-target="#logoutModal">
                        <i class="fas fa-power-off fa-sm fa-fw mr-2 text-gray-400"></i>
                        <span>Logout</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider mt-3">



        </ul>
        <!-- End of Sidebar -->