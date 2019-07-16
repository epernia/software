# IDE4PLC

A libre Programming Software for PLC comply with IEC 61131-3.

![Imagen "IDE4PLCv1-0-5.png" no encontrada](docs/assets/img/IDE4PLCv1-0-4.png "IDE4PLC v1.0.5")

## License

Copyright 2012-2019 Eric Nicolás Pernia.

This program is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.

```
For more information about the license, read the files
COPYING.LESSER.txt and COPYING.txt located in the 
IDE4PLC_LICENSE directory.
```

## Project information

- Web sites:
    - https://ide4plc.org/
    - http://www.proyecto-ciaa.com.ar/devwiki/doku.php?id=desarrollo:software-plc
- IDE4PLC project E-mail: ide4plc@gmail.com
- Soft-PLC development group of CIAA project: https://groups.google.com/forum/#!forum/ciaa-software-plc
  
### About the author

- Esp. Ing. Eric Nicolás Pernia (ericpernia@gmail.com). Quilmes, Buenos Aires, Argentina.
- Professor-Researcher at Universidad Nacional de Quilmes (UNQ).
- Responsible for Software-PLC in CIAA Project.
  
### Collaborator in software design and coding

- Dr. Lic. Carlos Lombardi.
- Sub-responsable for Software-PLC in CIAA Project.
  
### Collaborators in the port of the Firmware of IDE4PLC to the EDU-CIAA-NXP

- Mariano Cerdeiro. Responsible for Firmware in CIAA Project.
- Pablo Ridolfi. Responsible for Hardware in CIAA Project.
- Juan Cecconi. Sub-responsable for CIAA-IDE in CIAA Project.
- Leandro Kollenberger.

### Collaborators in software diffusion and testing

- Gerardo Sager.
- María de los Angeles Gómez López.

### Collaborator in software testing and documentation

- Marcelo Chichiri.

## Documentation:

- ["Instalation" guide.](docs/ide4plc-install_en.md)
- [Guia de "instalación".](docs/ide4plc-install_es.md)
- [Guia de uso.](docs/IDE4PLC-Guia de uso-v1.0.4-v0.75.pdf)
- Workshop SASE 2016:
    - [Modulo 1.](docs/SASE_2016_Workshop/SASE 2016 - Workshop IDE4PLC - Modulo 1.pdf)
    - [Modulo 2.](docs/SASE_2016_Workshop/SASE 2016 - Workshop IDE4PLC - Modulo 2.pdf)
    - [Modulo 3.](docs/SASE_2016_Workshop/SASE 2016 - Workshop IDE4PLC - Modulo 3.pdf)
- [Generar imagen de IDE4PLC para Linux desde el codigo fuente.](docs/ide4plc-linux-from-sources_es.md)

## Notes of the current release, 1.0.6

- Release date: 2019/06/22.
- Supported Operative Systems: GNU/Linux x86, GNU/Linux x64 and Windows (x86 and x64).
- Supported boards: CIAA-NXP y EDU-CIAA-NXP.
- Support firmware_v3.

This software is under development. The present version can program the platforms CIAA-NXP and EDU-CIAA-NXP in LADDER DIAGRAM IEC 61131-3 language.

The generated program called MAIN_TASK runs in a single periodic task every 10 ms. This task triggers a program organization unit (POU) of type Program called MAIN_PROGRAM.

MAIN_PROGRAM is the only POU that allows modifying the program, contains previously declared interface variables and Digital Outputs, and some internal variables.

In the CIAA-NXP the Digital Inputs are I0 to I7 and the Digital Outputs are from Q0 to Q7. Not support for analog inputs or outputs yet.

In the EDU-CIAA-NXP the Digital Inputs are TEC1 to TEC4 and the Digital Outputs correspond to LEDR, LEDG, LEDB, LED1, LED2
And LED3. Not support for analog inputs or outputs yet.