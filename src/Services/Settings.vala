/* 
 * Copyright 2016 Andrei-Costin Zisu
 *
 * This software is licensed under the GNU Lesser General Public License
 * (version 2.1 or later).  See the COPYING file in this distribution.
 */
 
public class Envoyer.Services.Settings : Granite.Services.Settings {
    public int window_width { get; set; }
    public int window_height { get; set; }
    public int position_x { get; set; }
    public int position_y { get; set; }
    
    public Settings () {
        base (Constants.PROJECT_FQDN);
    }
}
