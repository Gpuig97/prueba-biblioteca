import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const View = { template: '<router-view></router-view>' }

const routes = [
  {
    path: '/',
    component: () => import('@pages/Layout/DashboardLayout.vue'),
    redirect: 'dashboard',
    children: [
      {
        path: 'dashboard',
        name: 'dashboard',
        component: () => import('@pages/Dashboard.vue'),
        meta: { title: 'global.dashboard' }
      },
      {
        path: 'user-management',
        name: 'user_management',
        component: View,
        redirect: { name: 'permissions.index' },
        children: [
          {
            path: 'permissions',
            name: 'permissions.index',
            component: () => import('@cruds/Permissions/Index.vue'),
            meta: { title: 'cruds.permission.title' }
          },
          {
            path: 'permissions/create',
            name: 'permissions.create',
            component: () => import('@cruds/Permissions/Create.vue'),
            meta: { title: 'cruds.permission.title' }
          },
          {
            path: 'permissions/:id',
            name: 'permissions.show',
            component: () => import('@cruds/Permissions/Show.vue'),
            meta: { title: 'cruds.permission.title' }
          },
          {
            path: 'permissions/:id/edit',
            name: 'permissions.edit',
            component: () => import('@cruds/Permissions/Edit.vue'),
            meta: { title: 'cruds.permission.title' }
          },
          {
            path: 'roles',
            name: 'roles.index',
            component: () => import('@cruds/Roles/Index.vue'),
            meta: { title: 'cruds.role.title' }
          },
          {
            path: 'roles/create',
            name: 'roles.create',
            component: () => import('@cruds/Roles/Create.vue'),
            meta: { title: 'cruds.role.title' }
          },
          {
            path: 'roles/:id',
            name: 'roles.show',
            component: () => import('@cruds/Roles/Show.vue'),
            meta: { title: 'cruds.role.title' }
          },
          {
            path: 'roles/:id/edit',
            name: 'roles.edit',
            component: () => import('@cruds/Roles/Edit.vue'),
            meta: { title: 'cruds.role.title' }
          },
          {
            path: 'users',
            name: 'users.index',
            component: () => import('@cruds/Users/Index.vue'),
            meta: { title: 'cruds.user.title' }
          },
          {
            path: 'users/create',
            name: 'users.create',
            component: () => import('@cruds/Users/Create.vue'),
            meta: { title: 'cruds.user.title' }
          },
          {
            path: 'users/:id',
            name: 'users.show',
            component: () => import('@cruds/Users/Show.vue'),
            meta: { title: 'cruds.user.title' }
          },
          {
            path: 'users/:id/edit',
            name: 'users.edit',
            component: () => import('@cruds/Users/Edit.vue'),
            meta: { title: 'cruds.user.title' }
          }
        ]
      },
      {
        path: 'general-menu',
        name: 'general_menu',
        component: View,
        redirect: { name: 'locations.index' },
        children: [
          {
            path: 'locations',
            name: 'locations.index',
            component: () => import('@cruds/Locations/Index.vue'),
            meta: { title: 'cruds.location.title' }
          },
          {
            path: 'locations/create',
            name: 'locations.create',
            component: () => import('@cruds/Locations/Create.vue'),
            meta: { title: 'cruds.location.title' }
          },
          {
            path: 'locations/:id',
            name: 'locations.show',
            component: () => import('@cruds/Locations/Show.vue'),
            meta: { title: 'cruds.location.title' }
          },
          {
            path: 'locations/:id/edit',
            name: 'locations.edit',
            component: () => import('@cruds/Locations/Edit.vue'),
            meta: { title: 'cruds.location.title' }
          }
        ]
      },
      {
        path: 'book-menu',
        name: 'book_menu',
        component: View,
        redirect: { name: 'book_types.index' },
        children: [
          {
            path: 'book-types',
            name: 'book_types.index',
            component: () => import('@cruds/BookTypes/Index.vue'),
            meta: { title: 'cruds.bookType.title' }
          },
          {
            path: 'book-types/create',
            name: 'book_types.create',
            component: () => import('@cruds/BookTypes/Create.vue'),
            meta: { title: 'cruds.bookType.title' }
          },
          {
            path: 'book-types/:id',
            name: 'book_types.show',
            component: () => import('@cruds/BookTypes/Show.vue'),
            meta: { title: 'cruds.bookType.title' }
          },
          {
            path: 'book-types/:id/edit',
            name: 'book_types.edit',
            component: () => import('@cruds/BookTypes/Edit.vue'),
            meta: { title: 'cruds.bookType.title' }
          },
          {
            path: 'book-categories',
            name: 'book_categories.index',
            component: () => import('@cruds/BookCategories/Index.vue'),
            meta: { title: 'cruds.bookCategory.title' }
          },
          {
            path: 'book-categories/create',
            name: 'book_categories.create',
            component: () => import('@cruds/BookCategories/Create.vue'),
            meta: { title: 'cruds.bookCategory.title' }
          },
          {
            path: 'book-categories/:id',
            name: 'book_categories.show',
            component: () => import('@cruds/BookCategories/Show.vue'),
            meta: { title: 'cruds.bookCategory.title' }
          },
          {
            path: 'book-categories/:id/edit',
            name: 'book_categories.edit',
            component: () => import('@cruds/BookCategories/Edit.vue'),
            meta: { title: 'cruds.bookCategory.title' }
          },
          {
            path: 'books',
            name: 'books.index',
            component: () => import('@cruds/Books/Index.vue'),
            meta: { title: 'cruds.book.title' }
          },
          {
            path: 'books/create',
            name: 'books.create',
            component: () => import('@cruds/Books/Create.vue'),
            meta: { title: 'cruds.book.title' }
          },
          {
            path: 'books/:id',
            name: 'books.show',
            component: () => import('@cruds/Books/Show.vue'),
            meta: { title: 'cruds.book.title' }
          },
          {
            path: 'books/:id/edit',
            name: 'books.edit',
            component: () => import('@cruds/Books/Edit.vue'),
            meta: { title: 'cruds.book.title' }
          }
        ]
      },
      {
        path: 'rent-menu',
        name: 'rent_menu',
        component: View,
        redirect: { name: 'book_locations.index' },
        children: [
          {
            path: 'book-locations',
            name: 'book_locations.index',
            component: () => import('@cruds/BookLocations/Index.vue'),
            meta: { title: 'cruds.bookLocation.title' }
          },
          {
            path: 'book-locations/create',
            name: 'book_locations.create',
            component: () => import('@cruds/BookLocations/Create.vue'),
            meta: { title: 'cruds.bookLocation.title' }
          },
          {
            path: 'book-locations/:id',
            name: 'book_locations.show',
            component: () => import('@cruds/BookLocations/Show.vue'),
            meta: { title: 'cruds.bookLocation.title' }
          },
          {
            path: 'book-locations/:id/edit',
            name: 'book_locations.edit',
            component: () => import('@cruds/BookLocations/Edit.vue'),
            meta: { title: 'cruds.bookLocation.title' }
          },
          {
            path: 'book-reserves',
            name: 'book_reserves.index',
            component: () => import('@cruds/BookReserves/Index.vue'),
            meta: { title: 'cruds.bookReserf.title' }
          },
          {
            path: 'book-reserves/create',
            name: 'book_reserves.create',
            component: () => import('@cruds/BookReserves/Create.vue'),
            meta: { title: 'cruds.bookReserf.title' }
          },
          {
            path: 'book-reserves/:id',
            name: 'book_reserves.show',
            component: () => import('@cruds/BookReserves/Show.vue'),
            meta: { title: 'cruds.bookReserf.title' }
          },
          {
            path: 'book-reserves/:id/edit',
            name: 'book_reserves.edit',
            component: () => import('@cruds/BookReserves/Edit.vue'),
            meta: { title: 'cruds.bookReserf.title' }
          }
        ]
      }
    ]
  }
]

export default new VueRouter({
  mode: 'history',
  base: '/admin',
  routes
})
