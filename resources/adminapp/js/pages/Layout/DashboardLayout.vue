<template>
  <div class="wrapper" :class="{ 'nav-open': $sidebar.showSidebar }">
    <event-hub></event-hub>
    <side-bar :sidebarLinks="sidebarLinks">
      <mobile-menu slot="content"></mobile-menu>
    </side-bar>

    <div class="main-panel">
      <top-navbar></top-navbar>
      <div class="content">
        <dashboard-content></dashboard-content>
      </div>
    </div>
  </div>
</template>

<script>
import DashboardContent from './Content.vue'
import TopNavbar from './TopNavbar.vue'
import MobileMenu from './MobileMenu.vue'

export default {
  components: {
    DashboardContent,
    TopNavbar,
    MobileMenu
  },
  data() {
    return {
      sidebarLinks: [
        {
          title: 'global.dashboard',
          icon: 'dashboard',
          path: { name: 'dashboard' }
        },
        {
          title: 'cruds.userManagement.title',
          icon: 'person',
          path: { name: 'user_management' },
          gate: 'user_management_access',
          children: [
            {
              title: 'cruds.permission.title',
              icon: 'perm_data_setting',
              path: { name: 'permissions.index' },
              gate: 'permission_access'
            },
            {
              title: 'cruds.role.title',
              icon: 'group',
              path: { name: 'roles.index' },
              gate: 'role_access'
            },
            {
              title: 'cruds.user.title',
              icon: 'person',
              path: { name: 'users.index' },
              gate: 'user_access'
            }
          ]
        },
        {
          title: 'cruds.generalMenu.title',
          icon: 'table_view',
          path: { name: 'general_menu' },
          gate: 'general_menu_access',
          children: [
            {
              title: 'cruds.location.title',
              icon: 'table_view',
              path: { name: 'locations.index' },
              gate: 'location_access'
            }
          ]
        },
        {
          title: 'cruds.bookMenu.title',
          icon: 'table_view',
          path: { name: 'book_menu' },
          gate: 'book_menu_access',
          children: [
            {
              title: 'cruds.bookType.title',
              icon: 'table_view',
              path: { name: 'book_types.index' },
              gate: 'book_type_access'
            },
            {
              title: 'cruds.bookCategory.title',
              icon: 'table_view',
              path: { name: 'book_categories.index' },
              gate: 'book_category_access'
            },
            {
              title: 'cruds.book.title',
              icon: 'table_view',
              path: { name: 'books.index' },
              gate: 'book_access'
            }
          ]
        },
        {
          title: 'cruds.rentMenu.title',
          icon: 'table_view',
          path: { name: 'rent_menu' },
          gate: 'rent_menu_access',
          children: [
            {
              title: 'cruds.bookLocation.title',
              icon: 'table_view',
              path: { name: 'book_locations.index' },
              gate: 'book_location_access'
            },
            {
              title: 'cruds.bookReserf.title',
              icon: 'table_view',
              path: { name: 'book_reserves.index' },
              gate: 'book_reserf_access'
            }
          ]
        }
      ]
    }
  }
}
</script>
