<?php

namespace Database\Seeders;

use App\Models\Permission;
use Illuminate\Database\Seeder;

class PermissionsTableSeeder extends Seeder
{
    public function run()
    {
        $permissions = [
            [
                'id'    => 1,
                'title' => 'user_management_access',
            ],
            [
                'id'    => 2,
                'title' => 'permission_create',
            ],
            [
                'id'    => 3,
                'title' => 'permission_edit',
            ],
            [
                'id'    => 4,
                'title' => 'permission_show',
            ],
            [
                'id'    => 5,
                'title' => 'permission_delete',
            ],
            [
                'id'    => 6,
                'title' => 'permission_access',
            ],
            [
                'id'    => 7,
                'title' => 'role_create',
            ],
            [
                'id'    => 8,
                'title' => 'role_edit',
            ],
            [
                'id'    => 9,
                'title' => 'role_show',
            ],
            [
                'id'    => 10,
                'title' => 'role_delete',
            ],
            [
                'id'    => 11,
                'title' => 'role_access',
            ],
            [
                'id'    => 12,
                'title' => 'user_create',
            ],
            [
                'id'    => 13,
                'title' => 'user_edit',
            ],
            [
                'id'    => 14,
                'title' => 'user_show',
            ],
            [
                'id'    => 15,
                'title' => 'user_delete',
            ],
            [
                'id'    => 16,
                'title' => 'user_access',
            ],
            [
                'id'    => 17,
                'title' => 'book_menu_access',
            ],
            [
                'id'    => 18,
                'title' => 'book_type_create',
            ],
            [
                'id'    => 19,
                'title' => 'book_type_edit',
            ],
            [
                'id'    => 20,
                'title' => 'book_type_show',
            ],
            [
                'id'    => 21,
                'title' => 'book_type_delete',
            ],
            [
                'id'    => 22,
                'title' => 'book_type_access',
            ],
            [
                'id'    => 23,
                'title' => 'book_category_create',
            ],
            [
                'id'    => 24,
                'title' => 'book_category_edit',
            ],
            [
                'id'    => 25,
                'title' => 'book_category_show',
            ],
            [
                'id'    => 26,
                'title' => 'book_category_delete',
            ],
            [
                'id'    => 27,
                'title' => 'book_category_access',
            ],
            [
                'id'    => 28,
                'title' => 'book_create',
            ],
            [
                'id'    => 29,
                'title' => 'book_edit',
            ],
            [
                'id'    => 30,
                'title' => 'book_show',
            ],
            [
                'id'    => 31,
                'title' => 'book_delete',
            ],
            [
                'id'    => 32,
                'title' => 'book_access',
            ],
            [
                'id'    => 33,
                'title' => 'rent_menu_access',
            ],
            [
                'id'    => 34,
                'title' => 'location_create',
            ],
            [
                'id'    => 35,
                'title' => 'location_edit',
            ],
            [
                'id'    => 36,
                'title' => 'location_show',
            ],
            [
                'id'    => 37,
                'title' => 'location_delete',
            ],
            [
                'id'    => 38,
                'title' => 'location_access',
            ],
            [
                'id'    => 39,
                'title' => 'general_menu_access',
            ],
            [
                'id'    => 40,
                'title' => 'book_location_create',
            ],
            [
                'id'    => 41,
                'title' => 'book_location_edit',
            ],
            [
                'id'    => 42,
                'title' => 'book_location_show',
            ],
            [
                'id'    => 43,
                'title' => 'book_location_delete',
            ],
            [
                'id'    => 44,
                'title' => 'book_location_access',
            ],
            [
                'id'    => 45,
                'title' => 'book_reserf_create',
            ],
            [
                'id'    => 46,
                'title' => 'book_reserf_edit',
            ],
            [
                'id'    => 47,
                'title' => 'book_reserf_show',
            ],
            [
                'id'    => 48,
                'title' => 'book_reserf_delete',
            ],
            [
                'id'    => 49,
                'title' => 'book_reserf_access',
            ],
        ];

        Permission::insert($permissions);
    }
}
