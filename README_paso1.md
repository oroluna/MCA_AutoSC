# MCA_AutoSC
Automatizacíon utilizando supercomputo

Instrucciones y ejemplos de ayuda para probar el funcionamiento de las cajas negras (rutinas en python, aplicaciones, contenedores), y verificar que se generan correctamente las salidas en base a sus entradas

---  

## Ejemplo de procesamiento indivuales de 

En el Proceso 3 utilizar el siguiente comando  
(Es necesario revisar la documentación correspondiente)  

python3 mac_files_config.py -i 100 -d ../data/in_out_demos  

---  
Para los procesos 4, 5 y 8 descargar la imágen WCSim de Docker Hub:

```
 sudo docker pull manu33/wcsim:1.2
```
---

### En el proceso 4, para utilizar el contenedor para ejecutar herramienta WCSim:
(M)

Se tomara como entrada un archivo .MAC  
Se espera de salida un archivo .ROOT  

---  

### En el proceso 5, utilizar el contenedor de WCSim y mandar llamar la rutina en python dentro del contenedor:
(M) 
Se tomara como entrada un archivo .ROOT  
Se espera de salida un archivo .NPZ  

---  

### En el proceso 6, utilizar rutina en Python "npz_to_images.py":
(F-ok)  
Se tomara como entrada un archivo .NPZ  
Se espera de salida un archivo .NPZ  (con formato de imagen)  

**Sintaxis requerida para su ejecución:**

   python3 npz_to_images.py -m <geometry-file-npy> [-f <target-npz-file> | -d <target-directory with npz files>]

**Ejemplo:** 
   
time python3 /MCA_AutoSC/scripts/python/npz_to_images.py 
   -m MCA_AutoSC/data/Geometries/IWCD_geometry_mPMT.npy 
   -f MCA_AutoSC/data/in_out_demos/<Nombre_archivo.npz>

  
  
Ubicación del script:                MCA_AutoSC/scripts/python/  
Ubicación del archivo de geometria:  MCA_AutoSC/data/Geometries/


---  

### En el proceso 7, para utilizar el contenedor es:  
(F) 
Se tomara como entrada un archivo .NPZ  
Se espera de salida un archivo .ipynb  (Jupyter Notebook)  

MCA_AutoSC/scripts/notebook/  

---  


### En el proceso 8, para utilizar el contenedor de WCSim y mandar llamar la rutina en python dentro del contenedor:  
(M)  
Se tomara como entrada un archivo .ROOT  
Se espera de salida un archivo .NPZ  

---  

### En el proceso 9, para utilizar el contenedor es:  
(F)  
Se tomara como entrada un conjunto de archivos .NPZ  
Se espera de salidas de archivo .H5  

---  

### En el proceso 10, para utilizar el contenedor es:  
(F)  
Se tomara como entrada un archivo .H5  
Se espera de salida un archivo .ipynb  
