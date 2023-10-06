import Vue from 'vue'
import Vuex from 'vuex'

import Alert from './modules/alert'
import I18NStore from './modules/i18n'

import PermissionsIndex from './cruds/Permissions'
import PermissionsSingle from './cruds/Permissions/single'
import RolesIndex from './cruds/Roles'
import RolesSingle from './cruds/Roles/single'
import UsersIndex from './cruds/Users'
import UsersSingle from './cruds/Users/single'
import BookTypesIndex from './cruds/BookTypes'
import BookTypesSingle from './cruds/BookTypes/single'
import BookCategoriesIndex from './cruds/BookCategories'
import BookCategoriesSingle from './cruds/BookCategories/single'
import BooksIndex from './cruds/Books'
import BooksSingle from './cruds/Books/single'
import LocationsIndex from './cruds/Locations'
import LocationsSingle from './cruds/Locations/single'
import BookLocationsIndex from './cruds/BookLocations'
import BookLocationsSingle from './cruds/BookLocations/single'
import BookReservesIndex from './cruds/BookReserves'
import BookReservesSingle from './cruds/BookReserves/single'

Vue.use(Vuex)

const debug = process.env.NODE_ENV !== 'production'

export default new Vuex.Store({
  modules: {
    Alert,
    I18NStore,
    PermissionsIndex,
    PermissionsSingle,
    RolesIndex,
    RolesSingle,
    UsersIndex,
    UsersSingle,
    BookTypesIndex,
    BookTypesSingle,
    BookCategoriesIndex,
    BookCategoriesSingle,
    BooksIndex,
    BooksSingle,
    LocationsIndex,
    LocationsSingle,
    BookLocationsIndex,
    BookLocationsSingle,
    BookReservesIndex,
    BookReservesSingle
  },
  strict: debug
})
