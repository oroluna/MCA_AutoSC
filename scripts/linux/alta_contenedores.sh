#!/bin/bash

# Ultima revision mayo 26

#MAC TO ROOT
sudo docker stop WCSim_e; sudo docker rm WCSim_e
sudo docker stop WCSim_g; sudo docker rm WCSim_g
sudo docker stop WCSim_m; sudo docker rm WCSim_m

# Para e-
sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/1_MAC/VaryE/e-:/home/neutrino/in_out_demos -d -it --name=WCSim_e manu33/wcsim:1.2
# Para gamma
sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/1_MAC/VaryE/gamma:/home/neutrino/in_out_demos -d -it --name=WCSim_g manu33/wcsim:1.2
# Para m-
sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/1_MAC/VaryE/mu-:/home/neutrino/in_out_demos -d -it --name=WCSim_m manu33/wcsim:1.2

#ROOT TO NPZ (EVENT_DUMP)  --2--
sudo docker stop WCSim_2e; sudo docker rm WCSim_2e
sudo docker stop WCSim_2g; sudo docker rm WCSim_2g
sudo docker stop WCSim_2m; sudo docker rm WCSim_2m
# Para e-
sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/2_ROOT/VaryE/e-:/home/neutrino/in_out_demos -d -it --name=WCSim_2e manu33/wcsim:1.2
# Para gamma
sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/2_ROOT/VaryE/gamma:/home/neutrino/in_out_demos -d -it --name=WCSim_2g manu33/wcsim:1.2
# Para mu
sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/2_ROOT/VaryE/mu-:/home/neutrino/in_out_demos -d -it --name=WCSim_2m manu33/wcsim:1.2

#NPZ (EVENT_DUMP) to Image  --3--
sudo docker stop WCSim_3e; sudo docker rm WCSim_3e
sudo docker stop WCSim_3g; sudo docker rm WCSim_3g
sudo docker stop WCSim_3m; sudo docker rm WCSim_3m
# Para e-
sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/3_NPZ_event_dump/VaryE/e-:/home/neutrino/in_out_demos -d -it --name=WCSim_3e manu33/wcsim:1.2
# Para gamma
sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/3_NPZ_event_dump/VaryE/gamma:/home/neutrino/in_out_demos -d -it --name=WCSim_3g manu33/wcsim:1.2
# Para mu
sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/3_NPZ_event_dump/VaryE/mu-:/home/neutrino/in_out_demos -d -it --name=WCSim_3m manu33/wcsim:1.2

#NPZ (EVENT_DUMP) to Image  --4--
sudo docker stop WCSim_4e; sudo docker rm WCSim_4e
sudo docker stop WCSim_4g; sudo docker rm WCSim_4g
sudo docker stop WCSim_4m; sudo docker rm WCSim_4m
# Para e-
sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/2_ROOT/VaryE/e-:/home/neutrino/in_out_demos -d -it --name=WCSim_4e manu33/wcsim:1.2
# Para gamma
sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/2_ROOT/VaryE/gamma:/home/neutrino/in_out_demos -d -it --name=WCSim_4g manu33/wcsim:1.2
# Para mu
sudo docker run -v /home/autosc/Documents/MCA_AutoSC/data/2_ROOT/VaryE/mu-:/home/neutrino/in_out_demos -d -it --name=WCSim_4m manu33/wcsim:1.2
