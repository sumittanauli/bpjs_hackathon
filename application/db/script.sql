CREATE TABLE Pasien
(
	No_BPJS INT NOT NULL,
	Nama varchar(200) NOT NULL,
	Umur varchar(200) NOT NULL,
	JK enum('L','P') NOT NULL,
	no_hp INT NOT NULL,
	PRIMARY KEY (No_BPJS)
);

CREATE TABLE Faskes_1
(
	ID_Faskes INT NOT NULL,
	Lokasi varchar(200) NOT NULL,
	PRIMARY KEY (ID_Faskes)
);

CREATE TABLE DokterRs
(
	ID_Dokter INT NOT NULL,
	Nama varchar(200) NOT NULL,
	Spesialis varchar(200) NOT NULL,
	PRIMARY KEY (ID_Dokter)
);

CREATE TABLE Rujukan
(
	No_Rujukan INT NOT NULL,
	Tgl_Rujukan date NOT NULL,
	Diagnosa varchar(200) NOT NULL,
	No_BPJS INT NOT NULL,
	ID_Faskes INT NOT NULL,
	PRIMARY KEY (No_Rujukan),
	FOREIGN KEY (No_BPJS) REFERENCES Pasien(No_BPJS),
	FOREIGN KEY (ID_Faskes) REFERENCES Faskes_1(ID_Faskes)
);

CREATE TABLE Rumah_Sakit
(
	ID_RumahSakit INT NOT NULL,
	NamaRS varchar(200) NOT NULL,
	ID_Dokter INT NOT NULL,
	No_Rujukan INT NOT NULL,
	PRIMARY KEY (ID_RumahSakit),
	FOREIGN KEY (ID_Dokter) REFERENCES DokterRs(ID_Dokter),
	FOREIGN KEY (No_Rujukan) REFERENCES Rujukan(No_Rujukan)
);
