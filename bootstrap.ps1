# --- Configuration ---
# On Windows, we use 'vimfiles' instead of '.vim'
$VimDir = "$env:USERPROFILE\vimfiles"
$BundleDir = Join-Path $VimDir "bundle"

# Define the list of plugins (Name and URL)
$Plugins = @(
    @{ Name = "tlib_vim";             Url = "https://github.com/tomtom/tlib_vim.git" }
    @{ Name = "vim-addon-mw-utils";   Url = "https://github.com/MarcWeber/vim-addon-mw-utils.git" }
    @{ Name = "ultisnips";            Url = "https://github.com/SirVer/ultisnips.git" }
    @{ Name = "vim-snippets";         Url = "https://github.com/honza/vim-snippets.git" }
    @{ Name = "vim-puppet";           Url = "https://github.com/rodjek/vim-puppet.git" }
    @{ Name = "nerdtree";             Url = "https://github.com/scrooloose/nerdtree.git" }
    @{ Name = "vim-mads";             Url = "https://github.com/skrzyp/vim-mads" }
    @{ Name = "vim-surround";         Url = "https://github.com/tpope/vim-surround.git" }
    @{ Name = "vim-pencil";           Url = "https://github.com/reedes/vim-pencil" }
    @{ Name = "vim-autoread";         Url = "https://github.com/djoshea/vim-autoread.git" }
    @{ Name = "goyo.vim";             Url = "https://github.com/junegunn/goyo.vim.git" }
    # @{ Name = "vim-markdown";         Url = "https://github.com/plasticboy/vim-markdown.git" }
    @{ Name = "vim-move";             Url = "https://github.com/matze/vim-move.git" }
    @{ Name = "vim-bracketed-paste";  Url = "https://github.com/ConradIrwin/vim-bracketed-paste" }
    @{ Name = "context.vim";          Url = "https://github.com/wellle/context.vim.git" }
    @{ Name = "spaceduck";            Url = "https://github.com/pineapplegiant/spaceduck.git" }
    @{ Name = "vim-polyglot";         Url = "https://github.com/sheerun/vim-polyglot.git" }
    @{ Name = "vim-colorschemes";     Url = "https://github.com/flazz/vim-colorschemes.git" }
)

# --- Logic ---

# 1. Check/Create bundle directory
if (-not (Test-Path $BundleDir)) {
    Write-Host "Creating directory: $BundleDir" -ForegroundColor Cyan
    New-Item -ItemType Directory -Path $BundleDir -Force | Out-Null
} else {
    Write-Host "Directory '$BundleDir' found. Checking plugins..." -ForegroundColor Cyan
}

# 2. Navigate to bundle directory
Set-Location $BundleDir

# 3. Loop through plugins: Clone if missing, Pull if exists
foreach ($Plugin in $Plugins) {
    $Name = $Plugin.Name
    $Url = $Plugin.Url

    if (-not (Test-Path $Name)) {
        # --- CLONE ---
        Write-Host "Cloning $Name..." -NoNewline
        git clone --quiet $Url
        Write-Host " [Done]" -ForegroundColor Green
    } else {
        # --- UPDATE ---
        Write-Host "Updating $Name..." -NoNewline
        Push-Location $Name  # Enter directory
        try {
            git pull --quiet
            Write-Host " [Done]" -ForegroundColor Green
        } catch {
            Write-Host " [Error pulling]" -ForegroundColor Red
        }
        Pop-Location         # Return to bundle directory
    }
}

Write-Host "`nAll plugins processed." -ForegroundColor Cyan
