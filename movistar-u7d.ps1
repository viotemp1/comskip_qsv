$env:Path = "."

# $env:HOME = "C:\\Users\\usuario"                # ruta donde queremos que se generen las listas m3u, la guía y el directorio oculto .xmltv
# $env:LAN_IP = "192.168.1.15"                    # dirección IP, de las disponibles en el sistema, en la que queremos que el proxy funcione
# $env:EPG_THREADS = "4"                          # número de hilos para descargar la epg
# $env:MP4_OUTPUT = "1"                           # hacer grabaciones a fichero .mp4 y .sub por separado
# $env:RECORDING_THREADS = "4"                    # número de grabaciones simultáneas
# $env:RECORDINGS = "C:\\Users\\usuario\\Videos"  # directorio para grabaciones, si se establece se activará la comprobación periódica de timers.conf
# $env:SANIC_PORT = "8888"                        # puerto en el que el proxy será accesible
# $env:VERBOSE_LOGS = "0"                         # no mostrar la url a la que se accede en los logs

# $env:RECORDINGS = $env:HOMEPATH\Videos\movistar-u7d

start .\movistar_epg.exe -NoNewWindow -RedirectStandardError $env:TMP\movistar_epg_err.log -RedirectStandardOutput $env:TMP\movistar_epg_out.log
sleep 5
start .\movistar_u7d.exe -NoNewWindow -RedirectStandardError $env:TMP\movistar_u7d_err.log -RedirectStandardOutput $env:TMP\movistar_u7d_out.log

tail -F $env:TMP\movistar_epg_err.log $env:TMP\movistar_epg_out.log $env:TMP\movistar_u7d_err.log $env:TMP\movistar_u7d_out.log $env:HOMEPATH\.xmltv\tv_grab_es_movistartv.log
