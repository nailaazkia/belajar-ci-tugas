<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class ProductSeeder extends Seeder
{
    public function run()
    {
        // membuat data
        $data = [
            [
                'nama' => 'Ariel Bracelet',
                'harga'  => 10000,
                'jumlah' => 10,
                'foto' => 'Ariel_Bracelet.jpg',
                'created_at' => date("Y-m-d H:i:s"),
            ],
            [
                'nama' => 'Cinnamoroll Bracelet',
                'harga'  => 10000,
                'jumlah' => 15,
                'foto' => 'Cinnamoroll_Bracelet.jpg',
                'created_at' => date("Y-m-d H:i:s"),
            ],
            [
                'nama' => 'Fearless Bracelet',
                'harga'  => 15000,
                'jumlah' => 8,
                'foto' => 'Fearless_Bracelet.jpg',
                'created_at' => date("Y-m-d H:i:s"),
            ],
            [
                'nama' => 'Hinata Keychain',
                'harga'  => 25000,
                'jumlah' => 10,
                'foto' => 'Hinata_Keychain.jpg',
                'created_at' => date("Y-m-d H:i:s"),
            ],
            [
                'nama' => 'Honeymoon Necklace',
                'harga'  => 20000,
                'jumlah' => 5,
                'foto' => 'Honeymoon_Necklace.jpg',
                'created_at' => date("Y-m-d H:i:s"),
            ],
            [
                'nama' => '1989 Necklace',
                'harga'  => 20000,
                'jumlah' => 15,
                'foto' => '1989_Necklace.jpg',
                'created_at' => date("Y-m-d H:i:s"),
            ]
        ];

        foreach ($data as $item) {
            // insert semua data ke tabel
            $this->db->table('product')->insert($item);
        }
    }
}