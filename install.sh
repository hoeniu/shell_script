echo "Download gcc 6.2"

wget http://ftp.gnu.org/gnu/gcc/gcc-6.2.0/gcc-6.2.0.tar.gz  /dev/null

tar -xzf gcc-6.2.0.tar.gz > /dev/null

yum install -y gcc && yum install -y gcc-c++

echo "Download gmp,mpfr and mpc"
wget ftp://gcc.gnu.org/pub/gcc/infrastructure/gmp-4.3.2.tar.bz2 && tar jxvf gmp-4.3.2.tar.bz2 /dev/null 
wget http://mirrors.kernel.org/gnu/m4/m4-1.4.9.tar.gz && tar zxvf m4-1.4.9.tar.gz /dev/null
wget ftp://gcc.gnu.org/pub/gcc/infrastructure/mpfr-2.4.2.tar.bz2 && tar jxvf mpfr-2.4.2.tar.bz2 /dev/null
wget ftp://gcc.gnu.org/pub/gcc/infrastructure/mpc-0.8.1.tar.gz && tar zxvf mpc-0.8.1.tar.gz /dev/null


echo    "         --------------------------INSTALL ----------------------------
         --------------------------------------------------------------
         -----------------------------M4------------------------------- 
         --------------------------------------------------------------"
     
cd m4-1.4.9 

clear

echo -n "please chose an absolute directory name:" && read m4Directory   

if [ -d $m4Directory ]

then

  echo   "The Directory has exist."
  
else 

  echo    "M4 will be install $m4Directory"

fi


mkdir $M4Direct && ./configure --prefix=$M4Direct
echo "PATH=$PATH:$M4Directory/bin" >> ~/.bashrc





echo    "         --------------------------INSTALL ----------------------------
         --------------------------------------------------------------
         -----------------------------gmp-------------------------------
         --------------------------------------------------------------"

cd gmp-4.3.2

clear

echo -n "please chose an absolute directory name:" && read gmpDirectory

if [ -d $m4Directory ]

then

  echo   "The Directory has exist."

else

  echo    "M4 will be install $gmpDirectory"

fi

mkdir $gmpDirect && ./configure --prefix=$gmpDirect



echo    "         --------------------------INSTALL ----------------------------
         --------------------------------------------------------------
         -----------------------------mpfr-------------------------------
          --------------------------------------------------------------"

cd mpfr-2.4.2

       

echo -n "please chose an absolute directory name:" && read mpfrDirectory

if [ -d $m4Directory ]

   then

       echo   "The Directory has exist."

   else

       echo    "M4 will be install $mpfrDirectory"

fi

 mkdir $mpfrDirect && ./configure --prefix=$mpfrDirect

echo    "         --------------------------INSTALL ----------------------------
         --------------------------------------------------------------
         -----------------------------mpc-------------------------------
          --------------------------------------------------------------"

cd mpc-0.8.2

       

echo -n "please chose an absolute directory name:" && read mpfrDirectory

if [ -d $mpcDirectory ]

   then

       echo   "The Directory has exist."

   else

       echo    "mpc  will be install $mpcDirectory"

fi

 mkdir $mpcDirect && ./configure --prefix=$mpcDirect
