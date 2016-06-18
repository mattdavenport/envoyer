public class Mail.FolderItem : Gtk.ListBoxRow {
    private Gtk.Grid grid;
    private Gtk.Image icon;
    private Mail.FolderLabel folder_label;
    private Mail.Models.IFolder _folder;

    public Mail.Models.IFolder folder { get { return _folder; } }

    public FolderItem (Mail.Models.IFolder folder) {
        _folder = folder;

        build_ui ();
    }

    private void build_ui () {
        grid = new Gtk.Grid ();
        grid.orientation = Gtk.Orientation.HORIZONTAL;
        grid.margin_top = 4;
        grid.margin_bottom = 4;
        grid.margin_left = 8;
        grid.margin_right = 8;
        
        icon = new Gtk.Image.from_icon_name (get_icon_name (), Gtk.IconSize.BUTTON);
        icon.margin_right = 3;

        folder_label = new Mail.FolderLabel(folder);

        add (grid);
        grid.add (icon);
        grid.add (folder_label);

        show_all ();
    }


    public string get_icon_name () {
        if(folder.is_inbox) {
            return "mail-inbox";
        } else if(folder.is_trash) {
            //@TODO listen to total_count_changed signal and change the icon accordingly
            if(folder.total_count == 0) {
                return "user-trash";
            } else {
                return "user-trash-full";
            }
        } else if(folder.is_outbox) {
            return "mail-outbox";
        } else if(folder.is_sent) {
            return "mail-sent";
        } else if(folder.is_junk) {
            return "edit-flag";
        } else if(folder.is_starred) {
            return "starred";
        } else if(folder.is_drafts) {
            return "folder-documents";
        } else if(folder.is_important) {
            return "mail-mark-important";
        } else if(folder.is_all_mail || folder.is_archive) {
            return "mail-archive";
        } else {
            return "folder-tag";
        }        
    }
}

