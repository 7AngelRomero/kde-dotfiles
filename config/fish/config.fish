source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

function clean_sync_conflicts
    # Ruta corregida: quitamos 'Documents' porque tu vault está en la raíz del Home
    set target_dir ~/"Obsidian Vault"

    if test -d "$target_dir"
        echo "Directorio detectado en: $target_dir"
        # Buscamos solo archivos (-type f) para no borrar carpetas por error
        set files (find "$target_dir" -name "*.sync-conflict-*" -type f)

        if test -n "$files"
            echo "Eliminando archivos de conflicto..."
            find "$target_dir" -name "*.sync-conflict-*" -type f -delete
            echo "¡Limpieza terminada!"
        else
            echo "No hay conflictos que limpiar. Todo en orden."
        end
    else
        echo "Error: La ruta sigue mal. Intenta arrastrar la carpeta del Vault a la terminal para ver su ruta real."
    end
end
