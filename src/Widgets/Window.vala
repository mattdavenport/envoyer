/*
 * Copyright 2011-2016 Andrei-Costin Zisu
 *
 * This software is licensed under the GNU Lesser General Public License
 * (version 2.1 or later).  See the COPYING file in this distribution.
 */

public class Envoyer.Widgets.Window : Gtk.ApplicationWindow {
    public signal void session_up ();

    private Envoyer.Widgets.Headerbar headerbar;
    private Gtk.Paned pane;

    public Window (Gtk.Application app) {
		Object (application: app);

	    build_ui ();
        connect_signals (app);
        load_settings ();
    }
    
	private void load_settings () {
        resize (settings.window_width, settings.window_height);
		/*pane.position = settings.panel_size; #@ TODO*/
	}
    
    private void build_ui () {
        headerbar = new Envoyer.Widgets.Headerbar ();
        headerbar.set_title (Constants.APP_NAME);
        set_titlebar (headerbar);

        pane = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
        folder_threads_list = new Envoyer.Widgets.FolderThreadsList ();
        sidebar = new Envoyer.Widgets.Sidebar ();

        pane.pack1 (sidebar, false, false);
        pane.pack2 (folder_threads_list, true, false);
		pane.position = (50);

		//this.move (settings.pos_x, settings.pos_y); @TODO
        this.add (pane);
		this.show_all ();
    }

    private void connect_signals (Gtk.Application app) {
        var close_action = new SimpleAction ("close-action", null);
        close_action.activate.connect (request_close);
        add_action (close_action);
        app.set_accels_for_action ("win.close-action", {"<Ctrl>Q"});

        var new_action = new SimpleAction ("new-action", null);
        /*new_action.activate.connect (new_page);*/
        add_action (new_action);
        app.set_accels_for_action ("win.new-action", {"<Ctrl>N"});
        
        session_up.connect(() => { sidebar.session_up (); });
    }

    private void request_close () {
        close ();
    }

    public void show_app () {
		show ();
    	present ();

    	folder_threads_list.grab_focus ();
	}
}
