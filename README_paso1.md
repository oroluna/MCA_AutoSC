# MCA_AutoSC
Automatización utilizando supercómputo

Instrucciones y ejemplos de ayuda para probar el funcionamiento de las cajas negras (rutinas en python, aplicaciones, contenedores), y verificar que se generan correctamente las salidas en base a sus entradas.

Descargar el ZIP del repositorio de GitHub.

---  

## Ejemplo de procesamiento indivuales de 

En el Proceso 3 utilizar el siguiente comando  
(Es necesario revisar la documentación correspondiente)  

```
python3 mac_files_config.py -i 100 -d ../data/in_out_demos  
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
* MCA_AutoSC-main/data/in_out_demos

Creación del contenedor y vinculacion de la carpeta:

```
sudo docker run -v < ruta-maquina-local >/MCA_AutoSC-main/data/in_out_demos:/home/neutrino/in_out_demos -d -it --name=WCSim manu33/wcsim:1.2 
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
Visualizar archivo .root en la siguiente ruta: < ruta-maquina-local >/MCA_AutoSC-main/data/in_out_demos

---  

### En el proceso 5, utilizar el contenedor de WCSim y mandar llamar la rutina en python dentro del contenedor:
(M) 
Se tomara como entrada un archivo .ROOT  
Se espera de salida un archivo .NPZ  
Rutina de python ejecutada: **event_dump.py** 
```
sudo docker exec -it WCSim bash -c "cd /home/neutrino/software; source run.sh; cd /home/WatChMal/DataTools; time python3 event_dump.py /home/neutrino/in_out_demos/wcs_MCA_e-__0_500_MeV.root /home/neutrino/in_out_demos"
```


---  

### En el proceso 6, utilizar rutina en Python "npz_to_images.py":
(F-ok)  
Se tomara como entrada un archivo .NPZ  
Se espera de salida un archivo .NPY  (con formato de imagen)  

**Sintaxis requerida para su ejecución:**

   python3 npz_to_image.py -m <geometry-file-npy> [-f <target-npz-file> | -d <target-directory with npz files>]

**Ejemplo:** 
   
time python3 /MCA_AutoSC/scripts/python/npz_to_image.py 
   -m MCA_AutoSC/data/Geometries/IWCD_geometry_mPMT.npy 
   -f MCA_AutoSC/data/in_out_demos/<Nombre_archivo.npz>

  
  
Ubicación del script:                MCA_AutoSC/scripts/python/  
Ubicación del archivo de geometria:  MCA_AutoSC/data/Geometries/


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
Se espera de salida un archivo .ipynb  
```
python3 merge_h5.py <nombre_archivo1>.h5 <nombre_archivo2>.h5 <nombre_archivoN>.h5 -o <nombre_archivo_salida>.ipynb
```
 Ubicación del script: MCA_AutoSC/scripts/python/
