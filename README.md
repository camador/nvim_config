# Configuración y plugins para Neovim (>= 0.9.x)

Ficheros de configuración para linux.

## Tabla de contenidos

<details>
<summary>Ver Tabla de contenidos</summary>

1. [Instalación](#instalación)
2. [Plugins](#plugins)
   1. [Esquemas de colores](#esquemas-de-colores)
   2. [Ayudas para el código](#ayudas-para-el-código)
      1. [Autocompletado de código](#autocompletado-de-código)
         1. [Snippets](#snippets)
      2. [LSP](#lsp)
      3. [Copilot](#copilot)
   3. [Búsqueda difusa](#búsqueda-difusa)
   4. [Git](#git)
   5. [Interfaz y navegación](#interfaz-y-navegación)
3. [Atajos de teclado](#atajos-de-teclado-personalizados)
   1. [Normal mode](#normal-mode)
   2. [Visual mode](#visual-mode)
   3. [Visual block mode](#visual-block-mode)
   4. [Terminal block mode](#terminal-block-mode)
   5. [Ayudas del código](#ayudas-del-código)
      1. [Autocompletando código](#autocompletando-código)
         1. [Diagnóstico](#diagnóstico)
         2. [Buffers con LSP](#buffers-con-lsp)
      2. [nvim-autopairs](#nvim-autopairs)
      3. [Comments.nvim](#Commentsnvim)
   6. [telescope.nvim](#telescope)
   7. [gitsigns.nvim](#gitsigns.nvim)
   8. [nvim-tree.lua](#nvim-treelua)
4. [Descripción](#descripción)
   1. [Opciones de configuración](#opciones-de-configuración)
   2. [Atajos de teclado](#atajos-de-teclado)
   3. [Gestión de plugins](#gestión-de-plugins)
   4. [Esquema de colores](#esquema-de-colores)
   5. [Autocompletado](#autocompletado)
   6. [Configuración de LSP](#configuración-de-lsp)
      1. [Ficheros de configuración](#ficheros-de-configuración)
   7. [Configuración de copilot.lua](#configuracion-de-copilotlua)
   7. [Configuración de telescope.nvim](#configuracion-de-telescope)
   8. [Configuración de nvim-treesitter](#configuracion-de-nvim-treesitter)
   9. [Configuración de nvim-autopairs](#configuracion-de-nvim-autopairs)
   10. [Configuración de Commnets.nvim](#configuracion-de-commentsnvim)
   11. [Configuración de gitsigns.nvim](#configuracion-de-gitsignsnvim)
   12. [Configuración de nvim-tree.lua](#configuracion-de-nvim-treelua)
5. [Tipos de letra](#tipos-de-letra)
6. [Referencias](#referencias)
7. [Licencia](#licencia)
</details>

## Instalación

<details>
<summary>Ver instrucciones de instalación</summary>

```sh
git clone git@github.com:camador/nvim_config.git ~/desarrollo/nvim_config
ln -s ~/desarrollo/nvim_config/config_nvim ~/.config/nvim
ln -s ~/desarrollo/nvim_config/local_share_nvim ~/.local/share/nvim
sudo apt install xclip fonts-firacode git ripgrep fd-find tar curl
```

- `xclip` es necesario para que funcione el portapapeles.
- `fonts-firacode` es el tipo de letra usado (definido en [~/.config/nvim/lua/mi_config/options.lua](config_nvim/lua/mi_config/options.lua)).
- `git` es necesario para [packer.nvim](https://github.com/wbthomason/packer.nvim) y opcional para [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
- `ripgrep` es necesario para que el [live_grep](https://github.com/nvim-telescope/telescope.nvim#file-pickers) (`<leader>fs`) de [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim).
- `fd-find` es una [alternativa a find](https://github.com/sharkdp/fd) recomendada por [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim#optional-dependencies).
- `tar` es necesario para [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
- `curl` es necesario para [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).

Instalación de [Nerd fonts](https://github.com/ryanoasis/nerd-fonts):

```sh
mkdir -p ~/.local/share/fonts
cp -r ~/desarrollo/nvim_config/fonts ~/.local/share
```

En Neovim, instalar/actualizar los plugins:

```
:PackerSync
```

Reiniciar Neovim.

Establecer Neovim como editor del sistema (seleccionar `/usr/bin/nvim`):

```sh
sudo update-alternatives --config editor
```

</details>

## Plugins

<details>
<summary>Ver lista de Plugins instalados</summary>

- [packer.nvim](https://github.com/wbthomason/packer.nvim): Gestor de plugins.
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim): Librería lua necesaria para varios plugins.
- [popup.nvim](https://github.com/nvim-lua/popup.nvim): Popup API de Vim en Neovim.

## Esquemas de colores

- [LunarVimColorschemes](https://github.com/lunarvim/colorschemes): Varios esquema de colores.
- [Tokyo Night](https://github.com/folke/tokyonight.nvim): Varios esquema de colores.
- [Edge](https://github.com/sainnhe/edge): Esquema de colores.

## Ayudas para el código

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Mejora el coloreado del código y permite auto indentado.
- [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow): Muestra cada par de paréntesis de un color distinto.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs): Cierra automática los pares de paréntisis, comillas, etc. Se integra con [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) y [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
- [Comment.nvim](https://github.com/numToStr/Comment.nvim): Facilita el comentado de código.
- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring): Comentarios según el contexto usando [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
- [vim-surround](https://github.com/tpope/vim-surround): Inserta y edita pares de tags, paréntesis, comillas, etc.
- [vim-rails](https://github.com/tpope/vim-rails): Desarrollo de aplicaciones Rails.
- [Sparkup](https://github.com/rstacruz/sparkup): Permite escribir HTML muy rápido.

### Autocompletado de código

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): Plugin para autocompletado.
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer): Fuente para autocompletado de buffers.
- [cmp-path](https://github.com/hrsh7th/cmp-path): Fuente para autocompletado de paths.
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline): Fuente para autocompletado de línea de comandos.
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip): Fuente para autocompletado de snippets.

#### Snippets

- [LuaSnip](https://github.com/L3MON4D3/LuaSnip): Motor para snippets.
- [Friendly Snippets](https://github.com/rafamadriz/friendly-snippets): Snippets de muchos lenguajes.

### LSP

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): Configuraciones para el [cliente LSP de Neovim](https://neovim.io/doc/user/lsp.html).
- [mason.nvim](https://github.com/williamboman/mason.nvim): Gestor de servidores LSP.
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim): Puente entre [mason.nvim](https://github.com/williamboman/mason.nvim) y [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp): Fuente para autocompletado LSP para [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim): Formato y diagnóstico.

### Copilot

- [copilot.lua](https://github.com/zbirenbaum/copilot.lua): Integración de [Copilot](https://github.com/features/copilot) en Nvim.
- [copilot-cmp](https://github.com/zbirenbaum/copilot-cmp): Copilot como fuente de [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).

## Búsqueda difusa

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): Herramienta configurable y extensible de búsqueda difusa.
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim): Ordenador (sorter) nativo de [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) para mejorar el rendimiento.
- [Nvim-web-devincos](https://github.com/nvim-tree/nvim-web-devicons): Iconos de ficheros para [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim).

## Git

- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): Indicadores visuales de Git.

## Interfaz y navegación

- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua): Un explorador de ficheros escrito en Lua que sustituya a `:Explorer`.
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim): Statusline mejorada.
- [EasyMotion](https://github.com/easymotion/vim-easymotion): Facilita y acelera los movimientos en el texto visualizado.
</details>

## Atajos de teclado personalizados

<details>
<summary>Ver atajos de teclado</summary>

- La tecla `<leader>` es la barra espaciadora.

### Normal mode

#### Navegación entre ventanas (splits) más sencilla

- `<C-h>`: Para moverse a la ventana izquierda en lugar de `<C-w>h`.
- `<C-j>`: Para moverse a la ventana inferior en lugar de `<C-w>j`.
- `<C-k>`: Para moverse a la ventana superior en lugar de `<C-w>k`.
- `<C-l>`: Para moverse a la ventana derecha en lugar de `<C-w>l`.

#### Redimensión con los cursores

- `<C-Up>`: Aumenta el tamaño horizontal.
- `<C-Down>`: Reduce el tamaño horizontal.
- `<C-Left>`: Aumenta el tamaño vertical.
- `<C-Right>`: Reduce el tamaño vertical.

#### Navegación entre buffers

- `<S-l>`: Siguiente buffer.
- `<S-h>`: Anterior buffer.

### Visual mode

#### Permanece en visual mode al indentar

- `>`: Aumenta la indentación y conserva la selección.
- `<`: Reduce la indentación y conserva la selección.

#### Mueve el texto seleccionado

- `<A-k>`: Mueve el texto seleccionado hacia arriba.
- `<A-j>`: Mueve el texto seleccionado hacia abajo.
- `p`: Permite pegar un texto previamente seleccionado (yunk) sobre otro sin perder sin perder la selección original. [Demo](https://youtu.be/w7i4amO_zaE?t=1593).

### Visual block mode

#### Mueve el texto seleccionado

- `K`: Mueve el texto seleccionado hacia arriba.
- `J`: Mueve el texto seleccionado hacia abajo.
- `<A-k>`: Mueve el texto seleccionado hacia arriba.
- `<A-j>`: Mueve el texto seleccionado hacia abajo.

### Terminal mode

#### Navegación entre terminales más sencilla

- `<C-h>`: Para moverse al terminal derecha.
- `<C-j>`: Para moverse al terminal inferior.
- `<C-k>`: Para moverse al terminal superior.
- `<C-l>`: Para moverse al terminal izquierda.

### Ayudas del código

#### nvim-treesitter 

##### Selección incremental

- `<C-Space>`: Inicia la selección.
- `<C-Space>`: Incrementa la selección un nodo.
- `<C-s>`: Incrementa el scope de la selección.
- `<S-Space>`: Decrementa la selección un nodo.

#### nvim-autopairs

- `M-e`: Ejecuta la función [FastWrap](https://github.com/windwp/nvim-autopairs#fastwrap) de [nvim-autopairs](https://github.com/windwp/nvim-autopairs). Permite elegir la ubicación del par de cierre. [Demo](https://github.com/windwp/nvim-autopairs#fastwrap).

#### Comments.nvim

##### Normal mode

- `gcc`: Conmuta el comentario de línea en la línea actual (`//`).
- `gbc`: Conmuta el comentario de bloque de la línea actual (`/* */`).
- `gco`: Inserta un comentario en la línea siguiente y entra en modo de inserción.
- `gcO`: Inserta un comentario en la línea anterior y entra en modo de inserción.
- `gcA`: Inserta un comentario al final de la línea actual y entra en modo de inserción.

#### Sparkup

- `C-e`: Expande la cadena a tags HTML.

##### Visual mode

- `gc`: Conmuta el comentario en la selección. Comentario de línea (`//`).
- `gb`: Conmuta el comentario en la selección. Comentario de bloque (`/* */`).

#### Autocompletando código

- `<C-k>`: Anterior ítem.
- `<C-j>`: Siguiente ítem.
- `<C-Space>`: Inicia el autocompletado. Usar antes de escribir. Muestra todas las opciones disponibles.
- `<C-e>`: Descarta el autocompletado.
- `<C-b>`: Desplazamiento en popups que no caben en la pantalla.
- `<C-f>`: Desplazamiento en popups que no caben en la pantalla.

##### Diagnóstico

- `<leader>l`: Lista de diagnósticos de la línea en la que se encuentra el cursor.
- `[d`: Ir al siguiente ítem de diagnóstico.
- `]d`: Ir al anterior ítem de diagnóstico.
- `<leader>q`: Muestra todas las líneas de diagnóstico del buffer en la lista de ubicaciones (`:lw`) de Neovim.

##### Buffers con LSP

- `<leader>gd`: Ir a la declaración del símbolo sobre el que se encuentre el cursor.
- `<leader>gD`: Ir a la definición del símbolo sobre el que se encuentre el cursor.
- `K`: Muestra un popup con información sobre el símbolo sobre el que se encuentre el cursor.
- `<leader>gi`: Muestra todas las implementaciones del símbolo sobre el que se encuentre el cursor en la ventana quickfix (`:cw`) de Neovim.
- `<C-k>`: Muestra un popup con la definición del símbolo sobre el que se encuentre el cursor.
- `<leader>wa`: Añade el directorio actual al espacio de trabajo de LSP.
- `<leader>wr`: Elimina el directorio actual al espacio de trabajo de LSP.
- `<leader>wl`: Lista los directorios del espacio de trabajo de LSP.
- `<leader>D`: Ir a la definición del tipo del símbolo sobre el que se encuentre el cursor.
- `<leader>rn`: Renombra todas las ocurrencias del símbolo sobre el que se encuentre el cursor.
- `<leader>ca`: Muestra una lista de acciones de código disponibles en la posición actual del cursor.
- `<leader>gr`: Muestra todas las referencias al símbolo sobre el que se encuentre el cursor en la ventana quickfix (`:cw`) de Neovim.
- `<leader>f`: Formatea el código del buffer según el servidor LSP asociado.

### Telescope

#### Modos de invocación

##### Ficheros

- `<leader>ff`: Búsqueda difusa de ficheros.
- `<leader>fb`: Búsqueda de buffers abiertos.
- `<leader>fc`: Búsqueda de la cadena bajo el cursor o texto seleccionado.
- `<leader>fh`: Histórico de búsquedas realizadas.
- `<leader>fs`: Búsqueda de una cadena.

##### Git

- `<C-p>`: Ficheros de Git
- `<leader>gb`: Ramas de Git.
- `<leader>gc`: Commits de Git.
- `<leader>gst`: Git status.

##### LSP

- `<leader>ld`: Lista de diagnósticos de LSP en los buffers abiertos.
- `<leader>lr`: Lista de referencias de la cadena en la que se encuentre el cursor.
- `<leader>ls`: Lista de símbolos en el buffer actual.

##### Vim

- `<leader>vc`: Lista de comandos de plugins/usuario disponibles.
- `<leader>vh`: Histórico de comandos ejecutados.
- `<leader>vk`: Lista de atajaos de teclado.

#### Modo inserción

- `C-h`: Muestra los atajos de teclado disponibles en Telescope para el modo inserción. El resultado depende del tipo de búsqueda (`Picker`) que se esté realizando (ficheros, Git, etc).
- `C-j`: Muestra el siguiente ítem del historial de búsquedas.
- `C-k`: Muestra el anterior ítem del historial de búsquedas.

##### Modo normal

- `?`: Muestra los atajos de teclado disponibles en Telescope para el modo normal. El resultado depende del tipo de búsqueda (`Picker`) que se esté realizando (ficheros, Git, etc).

### gitsigns.nvim

##### Navegación

- `]c`: Ir al cambio siguiente.
- `[c`: Ir al cambio anterior.

##### Acciones

- `<leader>hs`: Pasa los cambios de la línea o selección actual al index (`git add`).
- `<leader>hr`: Descarta los cambios de la línea o selección actual (`git reset`).
- `<leader>hS`: Pasa todos los cambios del buffer al index (`git add`).
- `<leader>hu`: Deshace el último paso a index (`git restore`).
- `<leader>hR`: Descarta los cambios del buffer (`git reset`).
- `<leader>hp`: Muestra un popup con los cambios de la línea actual.
- `<leader>hb`: Muestra un popup con el blame de la línea actual.
- `<leader>tb`: Conmuta la visualización del blame de la línea actual al final de la línea.
- `<leader>hd`: Realiza un diff contra index.
- `<leader>hD`: Realiza un diff de contra HEAD.
- `<leader>td`: Conmuta la visualización de las líneas eliminadas.

### nvim-tree.lua

#### En un buffer

- `<leader>e`: Comnuta la visualización del explorador de ficheros en la parte izquierda.
- `<leader>E`: Abre el explorador de ficheros y selecciona el fichero correspondiente al buffer actual, desplegando los directorios si es necesario.

#### En el explorador de ficheros

- `g?`: Muestra/oculta los atajos de teclado.
</details>

## Descripción

<details>
<summary>Ver Descripción de plugins y ficheros de configuración</summary>

Toda la configuración está escrita en [Lua](https://www.lua.org/) y se encuentra distribuida en varios ficheros contenidos en el directorio [~/.config/nvim/lua/mi_config](config_nvim/lua/mi_config). Estos ficheros son cargados por el script [~/.config/nvim/init.lua](config_nvim/init.lua), que es leído por Neovim al arrancar.

### Opciones de configuración

Fichero [~/.config/nvim/lua/mi_config/options.lua](config_nvim/lua/mi_config/options.lua): Opciones generales de configuración. Análogo a `.vimrc`.

### Atajos de teclado

Fichero [~/.config/nvim/lua/mi_config/keymaps.lua](config_nvim/lua/mi_config/keymaps.lua): Definición de los atajos de teclado generales.

Algunos plugins tienen sus propios atajos de teclado definidos en sus ficheros de configuración.

### Gestión de plugins

Fichero [~/.config/nvim/lua/mi_config/plugins.lua](config_nvim/lua/mi_config/plugins.lua): Instalación automática de ([packer.nvim](https://github.com/wbthomason/packer.nvim)) y resto de plugins.

### Esquema de colores

Fichero [~/.config/nvim/lua/mi_config/colorscheme.lua](config_nvim/lua/mi_config/colorscheme.lua): Establece el esquema de colores de forma segura. Si no existe el esquema seleccionado informa al usuario.

### Autocompletado

Fichero [~/.config/nvim/lua/mi_config/cmp.lua](config_nvim/lua/mi_config/cmp.lua): Define las fuentas de autocompletado usadas por [nvim-cmp](https://github.com/hrsh7th/nvim-cmp). Tras instalar una [fuente](https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources) como plugin en Packer hay que añadirla en este fichero en los apartados `formatting` y `sources` usando el nombre definido en la documentación de dicha fuente.

La [fuente para snippets](https://github.com/saadparwaiz1/cmp_luasnip) necesita de los plugins adicionales descritos en el apartado [Plugins/Snippets](#snippets).

Para que se muestren correctamente los iconos definidos en el apartado `kind_icons` es necesario instalar el tipo de letra [Nerd fonts](https://github.com/ryanoasis/nerd-fonts) (ver instrucciones de [Instalación](#instalación)).

### Configuración de LSP

LSP necesita de tres componentes para funcionar:

- Configuraciones para cada servidor LSP instalado. Proporcionadas por [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
- Un gestor de la instalación/actualización de servidores ([mason.nvim](https://github.com/williamboman/mason.nvim)), con [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) para facilitar la integración con [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
- Una fuente de autocompletado para [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) que muestre las sugerencias del servidor LSP ([cmp-nvim-lsp](https://github.com/)).

#### Ficheros de configuración

Los scripts de configuración de LSP están contenidos en el directorio [~/.config/nvim/lua/mi_config/lsp/](config_nvim/lua/mi_config/lsp/) y son los siguientes:

- [init.lua](config_nvim/lua/mi_config/lsp/init.lua): Si `nvim_lspconfig`, `mason` y `mason-lspconfig` están instalados carga sus configuraciones.
- [mason.lua](config_nvim/lua/mi_config/lsp/mason.lua): [Inicializa](https://github.com/williamboman/mason.nvim#setup) `mason`.
- [mason-lspconfig.lua](config_nvim/lua/mi_config/lsp/mason-lspconfig.lua): [Inicializa](https://github.com/williamboman/mason-lspconfig.nvim#configuration) `mason-lspconfig`.
- [lspconfig.lua](config_nvim/lua/mi_config/lsp/lspconfig.lua): Inicializa los servidores instalados por `mason` y establece la configuración general de `nvim-lspconfig` (keymaps, visualización,... ). Ver [Quickstart](https://github.com/neovim/nvim-lspconfig#quickstart) de `nvim-lspconfig`.
- [null-ls.lua](config_nvim/lua/mi_config/lsp/null-ls.lua): Habilita el formateo y diagnóstico para los distitntos lenguajes. Cada lenguaje necesita la instalación del correspondiente binario (`:NullLsInfo` en un buffer para ver las opciones disponibles en el apartado _Supported Source(s)_).

Además, en [cmp.lua](config_nvim/lua/mi_config/cmp.lua) hay que añadir la fuente (`cmp-nvim-lsp`) en los apartados `formatting` y `sources`.

[mason-lspconfig.lua](config_nvim/lua/mi_config/lsp/mason-lspconfig.lua) instala automáticamente `lua_ls` (para Lua), `tsserver` (para JavaScript), `solargraph` (para Ruby, solo soporte de Rubocop) y `pyright` y `black` (para Python). Los servidores instalados manualmente con `mason` deben ser añadidos al fichero [lspconfig.lua](config_nvim/lua/mi_config/lsp/lspconfig.lua):

```lua
lspconfig.<nombre_del_servidor>.setup {}
```

### Configuración de copilot.lua

Fichero [~/.config/nvim/lua/mi_config/copilot.lua](config_nvim/lua/mi_config/copilot.lua): Configuración para la integración con [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
Añadido Copilot en [cmp.lua](config_nvim/lua/mi_config/cmp.lua), apartados `formatting` y `sources`.

### Configuración de Telescope

Fichero [~/.config/nvim/lua/mi_config/telescope.lua](config_nvim/lua/mi_config/telescope.lua): Define algunos keymaps y configuraciones personalizadas.

### Configuración de nvim-treesitter

Fichero [~/.config/nvim/lua/mi_config/treesitter.lua](config_nvim/lua/mi_config/treesitte.lua): Fuerza la instalación de todos los parsers, activa la indentación y configura [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow).

### Configuración de nvim-autopairs

Fichero [~/.config/nvim/lua/mi_config/autopairs.lua](config_nvim/lua/mi_config/autopairs.lua): Configura el plugin para que funcione con [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) y [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).

### Configuración de Comments.nvim

Fichero [~/.config/nvim/lua/mi_config/comments.lua](config_nvim/lua/mi_config/comments.lua): Habilita la integración con [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) y [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring).

### Configuración de gitsigns.nvim

Fichero [~/.config/nvim/lua/mi_config/gitsigns.lua](config_nvim/lua/mi_config/gitsigns.lua): Configuración de la visualización y atajos de teclado.

### Configuración de nvim-tree.lua

Fichero [~/.config/nvim/lua/mi_config/nerd-tree.lua](config_nvim/lua/mi_config/nerd-tree.lua): Configuración de la visualización y atajos de teclado. Deshabilita `netrw` de Neovim (`:Explore`).

</details>

## Tipos de letra

<details>
<summary>Ver Tipos de letra</summary>

- [FiraCode](https://github.com/tonsky/FiraCode)
- [Nerd fonts](https://github.com/ryanoasis/nerd-fonts): Solo necesaria para los símbolos del autocompletado de código y [Nvim-web-devincos](https://github.com/nvim-tree/nvim-web-devicons).
</details>

## Referencias

- [Neovim IDE from Scratch](https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ), de [chris@machine](https://github.com/LunarVim/Neovim-from-scratch).
- [0 to LSP : Neovim RC From Scratch](https://www.youtube.com/watch?v=w7i4amO_zaE), de [ThePrimeagen](https://github.com/ThePrimeagen).
- [Effective Neovim: Instant IDE](https://www.youtube.com/watch?v=stqUbv-5u2s), de [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).
- [camador/neovim_IDE_from_scratch](https://github.com/camador/neovim_IDE_from_scratch).
- [camador/nvim_config_0_to_LSP](https://github.com/camador/nvim_config_0_to_LSP).
- [camador/vim_config](https://github.com/camador/vim_config).

## Licencia

MIT
