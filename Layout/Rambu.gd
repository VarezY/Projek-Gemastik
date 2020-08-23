extends Node

var rambu_dict = [{"Rambu" : "Berhenti", "Text" : "Larangan berhenti sampai jarak 15 m dari tempat pemasangan rambu menurut arah lalu lintas, kecuali dinyatakan lain dengan papan tambahan", "Texture" : preload("res://Assets/Side/IsoSide/dilarangBerhenti_left.png")},
				{"Rambu" : "Putar Balik", "Text" : "Larangan berbalik arah bagi kendaraan bermotor maupun tidak bermotor", "Texture" : preload("res://Assets/Side/IsoSide/dilarangMemutar_left.png")},
				{"Rambu" : "Pakir", "Text" : "Larangan parkir sampai jarak 15 m dari tempat pemasangan rambu menurut arah lalu lintas, kecuali dinyatakan lain dengan papan tambahan", "Texture" : preload("res://Assets/Side/IsoSide/dilarangParkir_left.png")},
				{"Rambu" : "Jalan Tutup", "Text" : "Larangan masuk bagi semua kendaraan bermotor maupun tidak bermotor", "Texture" : preload("res://Assets/Side/IsoSide/dilarangMasuk_left.png")},
				{"Rambu" : "Ditutup", "Text" : "Larangan masuk bagi semua kendaraan bermotor maupun tidak bermotor dari kedua arah", "Texture" : preload("res://Assets/Side/IsoSide/ditutup_right.png")},
				{"Rambu" : "Stop", "Text" : "Dilarang berjalan terus, wajib berhenti sesaat dan meneruskan perjalanan setelah mendapat kepastian aman dari lalu lintas arah lainnya", "Texture" : preload("res://Assets/Side/IsoSide/berhentiSementara_left.png")},
				{"Rambu" : "Akhir", "Text" : "Batas akhir semua larangn setempat terhadap kendaraan bergerak", "Texture" : preload("res://Assets/Side/IsoSide/berakhir_left.png")},
				{"Rambu" : "Satu Arah", "Text" : "Wajib berjalan lurus ke depan", "Texture" : preload("res://Assets/Side/IsoSide/1e.png")},
				{"Rambu" : "Belok Kanan", "Text" : "Wajib mengikuti arah yang di tunjuk", "Texture" : preload("res://Assets/Side/IsoSide/1c.png")},
				{"Rambu" : "Belok Kiri", "Text" : "Wajib mengikuti arah yang di tunjuk", "Texture" : preload("res://Assets/Side/IsoSide/1d.png")},
				{"Rambu" : "Dua", "Text" : "Wajib melewati salah satu lajur yang di tunjuk", "Texture" : preload("res://Assets/Side/IsoSide/3c.png")},
				{"Rambu" : "Jalur Kanan", "Text" : "Lajur atau bagian jalan yang wajib di lewati", "Texture" : preload("res://Assets/Side/IsoSide/3b.png")},
				{"Rambu" : "Jalur Kiri", "Text" : "Lajur atau bagian jalan yang wajib di lewati", "Texture" : preload("res://Assets/Side/IsoSide/3a.png")},
				{"Rambu" : "Pertigaan Kanan", "Text" : "Wajib mengikuti salah satu arah yang di tunjuk", "Texture" : preload("res://Assets/Side/IsoSide/2b.png")},
				{"Rambu" : "Pertigaan kiri", "Text" : "Wajib mengikuti salah satu arah yang di tunjuk", "Texture" : preload("res://Assets/Side/IsoSide/2a.png")},
				{"Rambu" : "Kanan", "Text" : "Wajib mengikuti arah ke kanan", "Texture" : preload("res://Assets/Side/IsoSide/1b.png")},
				{"Rambu" : "Kiri", "Text" : "Wajib mengikuti arah ke kiri", "Texture" : preload("res://Assets/Side/IsoSide/1a.png")},
				{"Rambu" : "Bunderan", "Text" : "Wajib mengikuti arah yang ditentukan pada bunderan ", "Texture" : preload("res://Assets/Side/IsoSide/1f.png")}
				]



