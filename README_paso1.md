Para unirte a la videollamada, haz clic en este enlace: https://meet.google.com/rvc-butp-tfo
Si quieres unirte por teléfono, llama al +52 55 8421 0898 e introduce este PIN: 302 406 465 5513#
Para ver más números de teléfono, haz clic en este enlace: https://tel.meet/rvc-butp-tfo?hs=5




# Prerequisitos


Tener instalado docker  
Crear o tener a la mano cuenta de docker / docker hub
Tener instalado anaconda navigator  
Tener instalado GIT  -  Se puede revisar si esta instalado y su version con:   
   $ git --version   
Tener instalado ATOM u Otro editor de Texto   https://atom.io/
Tener instalado la app Htop:  
   $ sudo apt install htop   


# MCA_AutoSC
Automatización utilizando supercómputo

Instrucciones y ejemplos de ayuda para probar el funcionamiento de las cajas negras (rutinas en python, aplicaciones, contenedores), y verificar que se generan correctamente las salidas en base a sus entradas.

Descargar el ZIP del repositorio de GitHub.

---  

## Ejemplo de procesamiento individuales de 

En el Proceso 3 utilizar el siguiente comando  
Ir a la carpeta: Crear_MAC.
(Es necesario revisar la documentación correspondiente)  

```
python3 mac_files_config.py -i 100 -d ../data/in_out_demos  
``` 

Para el caso de procesamiento por particula ejecutar lo siguiente, dentro del directorio Crear_MAC   

```
python3 mac_files_config.py --config_json config_e.json -d /home/forozco/MCA_AutoSC/data/1_MAC/VaryE/e- -i 25  
python3 mac_files_config.py --config_json config_mu.json -d /home/forozco/MCA_AutoSC/data/1_MAC/VaryE/mu- -i 25  
python3 mac_files_config.py --config_json config_gamma.json -d /home/forozco/MCA_AutoSC/data/1_MAC/VaryE/gamma -i 25  
```
---  
Para los procesos 4, 5 y 8 descargar la [imagen WCSim](https://hub.docker.com/r/manu33/wcsim "manu33/wcsim") de Docker Hub:

1. Se debe tener una cuenta en [Docker Hub.](https://hub.docker.com/ "https://hub.docker.com")

2. Loggearte en terminal: 
```
 sudo docker login
```
3. Descargar la imagen WCSim:
```
 sudo docker pull manu33/wcsim:1.2
```
4. Se puede comprobar que se descargó correctamente con el comando:
```
 sudo docker images
```
Y aparecerá algo como: 

![images](/Imagenes/sudoDockerImages.png "sudoDockerImages")

Ruta de la carpeta a vincular con los archivos .mac: 
* MCA_AutoSC/data/in_out_demos (Es importante verificar que el nombre del proyecto GIT, sea el mismo "MCA_AutoSC" porque se estara referenciando varias veces)

Creación del contenedor y vinculacion de la carpeta:

```
sudo docker run -v < ruta-maquina-local >/MCA_AutoSC/data/in_out_demos:/home/neutrino/in_out_demos -d -it --name=WCSim manu33/wcsim:1.2 
```
---

### En el proceso 4, para utilizar el contenedor para ejecutar herramienta WCSim:
(M)

Se tomará como entrada un archivo .MAC  
Se espera de salida un archivo .ROOT  

Ejecución WCSim:

Cambiar el archivo.mac y archivo.root por su nombre correspondiente, por ejemplo: wcs_MCA_e-__0_500_MeV.mac
```
sudo docker exec -it WCSim bash -c "cd /home/neutrino/software; source run.sh; cd $SOFTWARE/WCSim_build; ./WCSim /home/neutrino/in_out_demos/<archivo>.mac; mv /home/neutrino/software/WCSim_build/<archivo>.root /home/neutrino/in_out_demos"
```
Visualizar archivo .root en la siguiente ruta: < ruta-maquina-local >/MCA_AutoSC/data/in_out_demos

---  

### En el proceso 5, utilizar el contenedor de WCSim y mandar llamar la rutina en python dentro del contenedor:
(M) 
Se tomara como entrada un archivo .ROOT  
Se espera de salida un archivo .NPZ  

## Nota: Para el caso de ser instalación de primera vez.  
(POR CORREGIR, HACER USO DE UNA HERRAMIENTAS PARA AMBIENTE VIRTUAL)
Considerar instalar     

numpy  $ pip3 install numpy  
pandas $ pip3 install pandas  
matplotlib  
   python -m pip3 install -U pip  
   python -m pip3 install -U matplotlib   

Rutina de python ejecutada: **event_dump.py** 
```
sudo docker exec -it WCSim bash -c "cd /home/neutrino/software; source run.sh; cd /home/WatChMal/DataTools; time python3 event_dump.py /home/neutrino/in_out_demos/<Nombre de archivo>.root /home/neutrino/in_out_demos"
```


---  

### En el proceso 6, utilizar rutina en Python "npz_to_images.py":
(F-ok)  
Se tomara como entrada un archivo .NPZ  
Se espera de salida un archivo .NPY  (con formato de imagen)  

**Sintaxis requerida para su ejecución:**

   python3 npz_to_image.py -m <geometry-file-npy> [-f <target-npz-file> | -d <target-directory with npz files>]

**Ejemplo:** 
   
time python3 <ruta_usuario>/MCA_AutoSC/scripts/python/npz_to_image.py 
   -m <ruta_usuario>/MCA_AutoSC/data/Geometries/IWCD_geometry_mPMT.npy 
   -f <ruta_usuario>/MCA_AutoSC/data/in_out_demos/<Nombre_archivo.npz>
        
Ubicación del script:                <ruta_usuario>/MCA_AutoSC/scripts/python/  
Ubicación del archivo de geometria:  <ruta_usuario>/MCA_AutoSC/data/Geometries/


---  

###  En el proceso 7, el archivo generado en NPZ, se puede visualizar con un scripts de Jupyter-Notebook, dentro del script se debe espeficar la ruta de un archivo seleccionado al azar, para visualizar su contenido.
(F) 
Se tomara como entrada un archivo .NPZ  
Se espera de salida un archivo .ipynb  (Jupyter Notebook)  

 Ubicación de los notebooks
MCA_AutoSC/scripts/notebook/Analisis_mu-.ipynb  
MCA_AutoSC/scripts/notebook/Analisis_gamma.ipynb  
MCA_AutoSC/scripts/notebook/Analisis_e-.ipynb  

---  


### En el proceso 8, para utilizar el contenedor de WCSim y mandar llamar la rutina en python dentro del contenedor:  
(M)  
Se tomará como entrada un archivo .ROOT  
Se espera de salida un archivo .NPZ  

Rutina de python ejecutada: **event_dump_barrel.py** 
```
sudo docker exec -it WCSim bash -c "cd /home/neutrino/software; source run.sh; cd /home/WatChMal/DataTools; time python3 event_dump_barrel.py /home/neutrino/in_out_demos/wcs_MCA_e-__0_500_MeV.root /home/neutrino/in_out_demos"
```
---  

### En el proceso 9:  
(F)  
Se tomará como entrada un archivo .NPZ  (*Creado en el proceso 5*)
 
Se espera de salida un archivo .H5  
```
python3 np_to_digihit_array_hdf5_FJOL.py <ruta-maquina-local>/MCA_AutoSC-main/data/in_out_demos/<nombre_archivo_entrada>.npz -o <nombre_archivo_salida>.h5
```
Ubicación del script: MCA_AutoSC/scripts/python/

---  

### En el proceso 10:  
(F)  
Se tomarán como entrada un conjunto de archivos .H5  
Se espera de salida un archivo .H5  
```
python3 merge_h5.py <nombre_archivo1>.h5 <nombre_archivo2>.h5 <nombre_archivoN>.h5 -o <nombre_archivo_salida>.h5
```
 Ubicación del script: MCA_AutoSC/scripts/python/
