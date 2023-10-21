/*
 * Copyright (C) 2017-2022 Lains *
 * This program is free software; you can redistribute it or
 * modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA
 */
public class Notejot.StyleManager {
    public void set_css () {
        var css_provider=new Gtk.CssProvider ();
        string style = """
            .notejot-sidebar-box {
                background: mix(@surface_bg_color, @note_color, 0.5);
                border-radius: 99px;
            }
            .notejot-header {
                background: mix(@surface_bg_color, @note_color, 0.05);
            }
            .notejot-footer {
                background-color: mix(@surface_container_bg_color, @note_color, 0.05);
            }
            .scrim {
                background: alpha(mix(@scrim, @note_color, 0.08), 0.2);
            }
        """;
        css_provider.load_from_data (style.data);
        Gtk.StyleContext.add_provider_for_display (
            Gdk.Display.get_default (),
            css_provider,
            Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
        );
    }
}
