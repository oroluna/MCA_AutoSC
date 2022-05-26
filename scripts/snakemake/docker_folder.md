


sudo docker stop WCSim
sudo docker rm WCSim

sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/1_MAC/VaryE/e-:/home/neutrino/in_out_demos -d -it --name=WCSim manu33/wcsim:1.2

sudo docker exec -it WCSim bash -c "cd /home/neutrino/software; source run.sh; cd $SOFTWARE/WCSim_build; ./WCSim /home/neutrino/in_out_demos/wcs_MCA_e-__1_500_MeV.mac; mv /home/neutrino/software/WCSim_build/wcs_MCA_e-__1_500_MeV.root /home/neutrino/in_out_demos"

El root queda en el directorio MAC -> Cambiarlo a su ruta correspondiente


________________________________
# Considerando mas de una particula y su carpetas ... VaryE/e-

sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/1_MAC/:/home/neutrino/in_out_demos -d -it --name=WCSim manu33/wcsim:1.2

sudo docker exec -it WCSim bash -c "cd /home/neutrino/software; source run.sh; cd /home/neutrino/software/WCSim_build; ./WCSim /home/neutrino/in_out_demos/VaryE/e-/wcs_MCA_e-__1_500_MeV.mac; mv /home/neutrino/software/WCSim_build/wcs_MCA_e-__1_500_MeV.root /home/neutrino/in_out_demos/VaryE/e-"

____________________________________

MAC TO ROOT
____________________________________


Por cada particula una regla

# Para e-
sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/1_MAC/VaryE/e-:/home/neutrino/in_out_demos -d -it --name=WCSim_e manu33/wcsim:1.2

sudo docker exec -it WCSim_e bash -c "cd /home/neutrino/software; source run.sh; cd $SOFTWARE/WCSim_build; ./WCSim /home/neutrino/in_out_demos/wcs_MCA_e-__1_500_MeV.mac; mv /home/neutrino/software/WCSim_build/wcs_MCA_e-__1_500_MeV.root /home/neutrino/in_out_demos"

----------------
# Para gamma
sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/1_MAC/VaryE/gamma:/home/neutrino/in_out_demos -d -it --name=WCSim_g manu33/wcsim:1.2

sudo docker exec -it WCSim_g bash -c "cd /home/neutrino/software; source run.sh; cd $SOFTWARE/WCSim_build; ./WCSim /home/neutrino/in_out_demos/wcs_MCA_gamma__1_500_MeV.mac; mv /home/neutrino/software/WCSim_build/wcs_MCA_gamma__1_500_MeV.root /home/neutrino/in_out_demos"

----------------
# Para m-
sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/1_MAC/VaryE/mu-:/home/neutrino/in_out_demos -d -it --name=WCSim_m manu33/wcsim:1.2

sudo docker exec -it WCSim_m bash -c "cd /home/neutrino/software; source run.sh; cd $SOFTWARE/WCSim_build; ./WCSim /home/neutrino/in_out_demos/wcs_MCA_mu-__1_500_MeV.mac; mv /home/neutrino/software/WCSim_build/wcs_MCA_mu-__1_500_MeV.root /home/neutrino/in_out_demos"

____________________________________

ROOT TO NPZ (EVENT_DUMP)  --2--
____________________________________


Por cada particula una regla
-----------------
# Para e-

sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/2_ROOT/VaryE/e-:/home/neutrino/in_out_demos -d -it --name=WCSim_2e manu33/wcsim:1.2


sudo docker exec -it WCSim_2e bash -c "cd /home/neutrino/software; source run.sh; cd /home/WatChMal/DataTools; time python3 event_dump.py /home/neutrino/in_out_demos/wcs_MCA_e-__0_500_MeV.root /home/neutrino/in_out_demos"

# Para gamma

sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/2_ROOT/VaryE/gamma:/home/neutrino/in_out_demos -d -it --name=WCSim_2g manu33/wcsim:1.2


sudo docker exec -it WCSim_2g bash -c "cd /home/neutrino/software; source run.sh; cd /home/WatChMal/DataTools; time python3 event_dump.py /home/neutrino/in_out_demos/wcs_MCA_gamma__0_500_MeV.root /home/neutrino/in_out_demos"


# Para mu

sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/2_ROOT/VaryE/mu-:/home/neutrino/in_out_demos -d -it --name=WCSim_2m manu33/wcsim:1.2


sudo docker exec -it WCSim_2m bash -c "cd /home/neutrino/software; source run.sh; cd /home/WatChMal/DataTools; time python3 event_dump.py /home/neutrino/in_out_demos/wcs_MCA_mu-__0_500_MeV.root /home/neutrino/in_out_demos"


____________________________________

NPZ (EVENT_DUMP) to Image  --3--
____________________________________

# Para e-

sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/3_NPZ_event_dump/VaryE/e-:/home/neutrino/in_out_demos -d -it --name=WCSim_3e manu33/wcsim:1.2

sudo docker exec -it WCSim_3e bash -c "cd /home/neutrino/software; source run.sh; cd /home/WatChMal/DataTools; time python3 event_dump.py /home/neutrino/in_out_demos/wcs_MCA_e-__0_500_MeV.npz /home/neutrino/in_out_demos"


# Para gamma

sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/3_NPZ_event_dump/VaryE/gamma:/home/neutrino/in_out_demos -d -it --name=WCSim_3g manu33/wcsim:1.2


sudo docker exec -it WCSim_3g bash -c "cd /home/neutrino/software; source run.sh; cd /home/WatChMal/DataTools; time python3 event_dump.py /home/neutrino/in_out_demos/wcs_MCA_gamma__0_500_MeV.npz /home/neutrino/in_out_demos"


# Para mu

sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/3_NPZ_event_dump/VaryE/mu-:/home/neutrino/in_out_demos -d -it --name=WCSim_3m manu33/wcsim:1.2


sudo docker exec -it WCSim_3g bash -c "cd /home/neutrino/software; source run.sh; cd /home/WatChMal/DataTools; time python3 event_dump.py /home/neutrino/in_out_demos/wcs_MCA_mu-__0_500_MeV.npz /home/neutrino/in_out_demos"

conda activate snakemake


____________________________________

NPZ (EVENT_DUMP) to Image  --4--
____________________________________

# Para e-

sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/2_ROOT/VaryE/e-:/home/neutrino/in_out_demos -d -it --name=WCSim_4e manu33/wcsim:1.2

sudo docker exec -it WCSim_4e bash -c "cd /home/neutrino/software; source run.sh; cd /home/WatChMal/DataTools; time python3 event_dump_barrel.py /home/neutrino/in_out_demos/wcs_MCA_e-__0_500_MeV.root /home/neutrino/in_out_demos"


# Para gamma

sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/2_ROOT/VaryE/gamma:/home/neutrino/in_out_demos -d -it --name=WCSim_4g manu33/wcsim:1.2

sudo docker exec -it WCSim_4g bash -c "cd /home/neutrino/software; source run.sh; cd /home/WatChMal/DataTools; time python3 event_dump_barrel.py /home/neutrino/in_out_demos/wcs_MCA_gamma__0_500_MeV.root /home/neutrino/in_out_demos"


# Para mu

sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/2_ROOT/VaryE/mu-:/home/neutrino/in_out_demos -d -it --name=WCSim_4m manu33/wcsim:1.2

sudo docker exec -it WCSim_4m bash -c "cd /home/neutrino/software; source run.sh; cd /home/WatChMal/DataTools; time python3 event_dump_barrel.py /home/neutrino/in_out_demos/wcs_MCA_mu-__0_500_MeV.root /home/neutrino/in_out_demos"


#      expand('event_dump/IWCDgrid_varyR_mu-_200MeV_1000evts_{l_corrida}.npz', l_corrida=CORRIDA),
#      expand('NPZ_to_image/IMAGES_IWCDgrid_varyR_mu-_200MeV_1000evts_{l_corrida}.npy', l_corrida=CORRIDA)
#      expand('../../data/1_MAC/VaryE/e-/wcs_MCA_e-__{l_corrida}_500_MeV.mac', l_corrida=CORRIDA),
#      expand('../../data/2_ROOT/VaryE/e-/wcs_MCA_e-__{l_corrida}_500_MeV.root', l_corrida=CORRIDA)
      #expand('../../data/1_MAC/VaryE/{l_particula}/wcs_MCA_{l_particula}__{l_corrida}_500_MeV.mac', l_corrida=CORRIDA, l_particula=PARTICULA),
      #expand('../../data/2_ROOT/VaryE/{l_particula}/wcs_MCA_{l_particula}__{l_corrida}_500_MeV.root', l_corrida=CORRIDA, l_particula=PARTICULA)
