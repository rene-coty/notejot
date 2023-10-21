/*
* Copyright (C) 2017-2022 Lains
*
* This program is free software; you can redistribute it &&/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 3 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*/
[GtkTemplate (ui = "/io/github/lainsce/Notejot/notebookmainlistview.ui")]
public class Notejot.NotebookMainListView : He.Bin {
    [GtkChild]
    public unowned Gtk.SingleSelection ss;

    public ObservableList<Notebook>? notebooks { get; set; }
    public NotebookViewModel? nbview_model { get; set; }
    public Notebook? selected_notebook { get; set; }
    public string? sntext { get; set; }

    construct {
        ss.bind_property ("selected", this, "selected-notebook", DEFAULT, (_, from, ref to) => {
            var pos = (uint) from;

            if (pos != Gtk.INVALID_LIST_POSITION) {
                to.set_object (ss.model.get_item (pos));
                sntext = ((Notebook)ss.model.get_item (pos)).title;
            }

            return true;
        });


        ss.selection_changed.connect (() => {
            if (sntext != "" && selected_notebook.title != "" && sntext == selected_notebook.title) {
                ss.unselect_all ();
            }
        });
    }

    public signal void new_notebook_requested (Notebook notebook);
}
