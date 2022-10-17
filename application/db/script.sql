CREATE TABLE Pasien
(
    No_BPJS INT NOT NULL,
    Nama INT NOT NULL,
    Umur INT NOT NULL,
    JK INT NOT NULL,
    Diagnosa INT NOT NULL,
    no_hp INT NOT NULL,
    PRIMARY KEY (No_BPJS)
);

CREATE TABLE Faskes_1
(
    ID_Faskes INT NOT NULL,
    Lokasi INT NOT NULL,
    PRIMARY KEY (ID_Faskes)
);

CREATE TABLE Rujukan
(
    No_Rujukan INT NOT NULL,
    Tgl_Rujukan INT NOT NULL,
    No_BPJS INT NOT NULL,
    ID_Faskes INT NOT NULL,
    PRIMARY KEY (No_Rujukan),
    FOREIGN KEY (No_BPJS) REFERENCES Pasien(No_BPJS),
    FOREIGN KEY (ID_Faskes) REFERENCES Faskes_1(ID_Faskes)
);

CREATE TABLE Rumah_Sakit
(
    ID_RumahSakit INT NOT NULL,
    NamaRS INT NOT NULL,
    No_Rujukan INT NOT NULL,
    PRIMARY KEY (ID_RumahSakit),
    FOREIGN KEY (No_Rujukan) REFERENCES Rujukan(No_Rujukan)
);

CREATE TABLE DokterRs
(
    ID_Dokter INT NOT NULL,
    Nama INT NOT NULL,
    Spesialis INT NOT NULL,
    ID_RumahSakit INT NOT NULL,
    PRIMARY KEY (ID_Dokter),
    FOREIGN KEY (ID_RumahSakit) REFERENCES Rumah_Sakit(ID_RumahSakit)
);