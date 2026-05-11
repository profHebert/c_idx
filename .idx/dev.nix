{ pkgs, ... }: { 
  # Canal estável do NixOS
  channel = "stable-24.11";

  # Pacotes essenciais para desenvolvimento C
  packages = [
    pkgs.gcc             # Compilador GNU (inclui gcc, g++, etc)
    pkgs.gnumake         # Ferramenta para automatizar compilações (Makefiles)
    pkgs.gdb             # Debugger para encontrar erros no código
    pkgs.valgrind        # Para análise de memória e detecção de leaks
    pkgs.cmake           # Gerador de sistemas de compilação moderno
  ];

  # Extensões do VS Code (essenciais para IntelliSense e Debug)
  idx.extensions = [
    "ms-vscode.cpptools"          # Suporte oficial da Microsoft para C/C++
    "ms-vscode.cpptools-themes"   # Temas e ícones
    "twxs.cmake"                  # Suporte para arquivos CMake
  ];

  # Configuração inicial do Workspace
  idx.workspace.onCreate = {
    # Verifica as versões instaladas e dá as boas-vindas
    setup = "gcc --version && make --version && echo 'Ambiente C pronto para uso!'";
  };

  # (Opcional) Configuração de visualização se você criar um servidor web em C
  idx.previews = {
    enable = false; # Desativado por padrão para aplicações CLI
  };
}
