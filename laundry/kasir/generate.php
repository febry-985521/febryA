<?php 
include 'security.php';?>
<!DOCTYPE html>
<html>
<head>
	<title><?php echo $status; ?></title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="wrapper">

		<div class="header">			
            <?php include 'header.php'; ?>
		</div>
        <div class="badan">			
			<div class="sidebar">
				<?php include 'sidebar.php'; ?>
			</div>
			
		<div class="content">
            
        <h2 style="text-align: center">Laporan Transaksi Laundry <p><a href="eksport.php" class="btn-hapus">Eksport</a></p></h2>
        <table border style="border-collapse: collapse; width:90%; text-align:center; margin-left: 5%">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>Tgl</th>
                        <th>Nama</th>
                        <th>Paket</th>
                        <th>Berat</th>
                        <th>Total</th>
                    </tr>

                </thead>
                <tbody>
            <!-- perulangan data -->
                <?php 
                    error_reporting(0);
                    $no=1;
                    $page = (isset($_GET['page']))? $_GET['page'] : 1;
                    $limit = 10;                               
                  $limit_start = ($page - 1) * $limit;
                    $no = $limit_start + 1;
                    $cari = $_POST['cari'];
                    if($cari != ''){
                        $result  = mysqli_query($koneksi,"SELECT transaksi.tanggal, transaksi.id, pelanggan.nama, paket.paket, transaksi.total ,transaksi.berat FROM transaksi 
                        INNER JOIN pelanggan ON pelanggan.id_pelanggan = transaksi.id_pelanggan 
                        INNER JOIN paket ON paket.id=transaksi.id_paket 
                        INNER JOIN owner ON owner.id=transaksi.id_owner 
                        WHERE Id_owner=$id_owner AND transaksi.id LIKE '%$cari%' 
                        OR transaksi.tanggal LIKE '%$cari%' 
                        OR pelanggan.nama LIKE '%$cari%' 
                        OR paket.paket LIKE '%$cari%' 
                        OR transaksi.berat LIKE '%$cari%' 
                        OR transaksi.total LIKE '%$cari%' order by tanggal DESC LIMIT ".$limit_start.",".$limit." ");
                        }
                    else{
                        $result = mysqli_query($koneksi,"SELECT transaksi.tanggal, transaksi.id, pelanggan.nama, paket.paket, transaksi.total ,transaksi.berat FROM transaksi 
                        INNER JOIN pelanggan ON pelanggan.id_pelanggan = transaksi.id_pelanggan 
                        INNER JOIN paket ON paket.id=transaksi.id_paket 
                        WHERE id_owner=$id_owner order by tanggal DESC LIMIT ".$limit_start.",".$limit." ");         
                        }
                    echo mysqli_error($koneksi);
                    
                    error_reporting(0);
                    if(mysqli_num_rows($result)){
                    while($isi = mysqli_fetch_array($result) ){
                        ?>
                        <tr>
                            <td><?= $isi['id']; ?></td>
                            <td><?= $isi['tanggal'];?></td>
                            <td><?= $isi['nama']; ?></td>
                            <td><?= $isi['paket']; ?></td>
                            <td><?= $isi['berat'];?> KG</td>
                            <td>Rp. <?= $isi['total']; ?></td>                            
                        </tr>
                    <?php }} 
                    else{
                        echo "<tr><td colspan='6'><p style='text-align: center'>Data Tidak Ditemukan</p></td></tr>";
                        }?>
                        <tr>
                            <td colspan="5">Pendapatan</td>
                            <td><b>Rp. <?php 
                            $tot  = mysqli_query($koneksi, "SELECT SUM(total) FROM transaksi WHERE id_owner=$id_owner");
                            $SUM = mysqli_fetch_assoc($tot);
                            echo $SUM['SUM(total)'];
                        ?></b></td>
                        </tr>                 
                    </tbody>
                </table>
        
        <nav class="nav-button">
        <ul>
    <!-- LINK FIRST AND PREV -->
            <?php
                if($page == 1){ // Jika page adalah page ke 1, maka disable link PREV
                ?>
                <li><a style="font-weight: bold;">First</a></li>
                <li><a href="#">&laquo;</a></li>
                <?php
                }else{ // Jika page bukan page ke 1
                $link_prev = ($page > 1)? $page - 1 : 1;
                ?>
                <li><a href="generate.php?page=1">First</a></li>
                <li><a href="generate.php?page=<?php echo $link_prev; ?>">&laquo;</a></li>
                <?php
                }
                ?>
                
                <!-- LINK NUMBER -->
                <?php
                // Buat query untuk menghitung semua jumlah data
                $sql_jml = mysqli_query($koneksi, "SELECT COUNT(*) AS jumlah FROM transaksi");
                $get_jumlah = mysqli_fetch_array($sql_jml);
                
                $jumlah_page = ceil($get_jumlah['jumlah'] / $limit); // Hitung jumlah halamannya
                $jumlah_number = 3; // Tentukan jumlah link number sebelum dan sesudah page yang aktif
                $start_number = ($page > $jumlah_number)? $page - $jumlah_number : 1; // Untuk awal link number
                $end_number = ($page < ($jumlah_page - $jumlah_number))? $page + $jumlah_number : $jumlah_page; // Untuk akhir link number
                
                for($i = $start_number; $i <= $end_number; $i++){
                $link_active = ($page == $i)? ' class="active"' : '';
                ?>
                <li <?php echo $link_active; ?>><a href="generate.php?page=<?php echo $i; ?>"><?php echo $i; ?></a></li>
                <?php
                }
                ?>
                
                <!-- LINK NEXT AND LAST -->
                <?php
                // Jika page sama dengan jumlah page, maka disable link NEXT nya
                // Artinya page tersebut adalah page terakhir 
                if($page == $jumlah_page){ // Jika page terakhir
                ?>
                <li><a href="#">&raquo;</a></li>
                <li><a href="#">Last</a></li>
                <?php
                }else{ // Jika Bukan page terakhir
                $link_next = ($page < $jumlah_page)? $page + 1 : $jumlah_page;
                ?>
                <li><a href="generate.php?page=<?php echo $link_next; ?>">&raquo;</a></li>
                <li><a href="generate.php?page=<?php echo $jumlah_page; ?>">Last</a></li>
                <?php
                }
                ?>
            </ul>
            </nav>
        </div>
        <div class="clear">

        </div>
        <div class="footer">
            <p> @copyright Pengelola Data Laundry 2020 By<a target="_blank" href="https://www.instagram.com/official_febryardyansyah/" style="text-decoration:none; color:orange"> Febry</a></p>
        </div>
        
	</div>
</body>
</html>