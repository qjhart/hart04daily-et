Print
  paper_mode 0
  paper a4
  paper_width 8.268000
  paper_height 11.693000
  paper_left 0.500000
  paper_right 0.500000
  paper_top 1.000000
  paper_bottom 1.000000
  do_scriptfile 0
  scriptfile 
  do_psfile 1
  psfile /home/quinn/projects/cimis/doc/hart06et/figs/errors-2005-08.ps
  do_pdffile 0
  pdffile 
  do_pngfile 0
  pngfile 
  pngresolution 100
  do_printer 0
  printer lpr
End
Group Radiation RMS Errors
  _check 0
  Raster shade
    _check 1
    map shade@hart06et
    overlay 0
    legend 0
  End
  Vector Big RMS
    _check 1
    map rms@hart06et
    display_shape 1
    display_cat 0
    display_topo 0
    display_dir 0
    display_attr 0
    type_point 1
    type_line 1
    type_boundary 1
    type_centroid 1
    type_area 1
    type_face 0
    color #000000
    _use_color 1
    fcolor #ffffff
    _use_fcolor 1
    lcolor #000000
    rdmcolor 0
    sqlcolor 0
    icon basic/circle
    size 14
    field 1
    lfield 1
    attribute 
    xref left
    yref center
    lsize 8
    cat 
    where rms>0.2
    _query_text 0
    _query_edit 0
    _use_where 1
    minreg 
    maxreg 
    _width 1
  End
  Vector mid RMS
    _check 1
    map rms@hart06et
    display_shape 1
    display_cat 0
    display_topo 0
    display_dir 0
    display_attr 0
    type_point 1
    type_line 1
    type_boundary 1
    type_centroid 1
    type_area 1
    type_face 0
    color #000000
    _use_color 1
    fcolor #ffffff
    _use_fcolor 1
    lcolor #000000
    rdmcolor 0
    sqlcolor 0
    icon basic/circle
    size 10
    field 1
    lfield 1
    attribute 
    xref left
    yref center
    lsize 8
    cat 
    where rms > 0.1
    _query_text 0
    _query_edit 0
    _use_where 1
    minreg 
    maxreg 
    _width 1
  End
  Vector vector 8
    _check 1
    map rms@hart06et
    display_shape 1
    display_cat 0
    display_topo 0
    display_dir 0
    display_attr 0
    type_point 1
    type_line 1
    type_boundary 1
    type_centroid 1
    type_area 1
    type_face 0
    color #000000
    _use_color 1
    fcolor #ffffff
    _use_fcolor 1
    lcolor #000000
    rdmcolor 0
    sqlcolor 0
    icon basic/circle
    size 6
    field 1
    lfield 1
    attribute 
    xref left
    yref center
    lsize 8
    cat 
    where 
    _query_text 0
    _query_edit 0
    _use_where 1
    minreg 
    maxreg 
    _width 1
  End
End
Group Test
  _check 0
  Raster raster 4
    _check 1
    map shade@hart06et
    overlay 0
    legend 0
  End
End
Group Errors
  _check 0
  Raster et0
    _check 1
    map et0
    overlay 0
    legend 0
  End
  Labels err labels
    _check 1
    map levels
    minreg 
    maxreg 
  End
  Vector errors
    _check 1
    map err
    display_shape 1
    display_cat 0
    display_topo 0
    display_dir 0
    display_attr 0
    type_point 0
    type_line 1
    type_boundary 0
    type_centroid 0
    type_area 0
    type_face 0
    color #000000
    _use_color 1
    fcolor #AAAAAA
    _use_fcolor 1
    lcolor #000000
    rdmcolor 0
    sqlcolor 0
    icon basic/x
    size 5
    field 1
    lfield 1
    attribute level
    xref left
    yref center
    lsize 8
    cat 
    where 
    _query_text 0
    _query_edit 0
    _use_where 1
    minreg 
    maxreg 
    _width 1
  End
End
Group classification
  _check 1
  Raster class
    _check 1
    map et0_m8_6@hart06et
    overlay 0
    legend 0
  End
  Cmd d.frame
    _check 1
    cmd d.frame -c frame=legend at=7,30,2,31
  End
  Cmd d.erase
    _check 1
    cmd d.erase color=white
  End
  Cmd d.legend
    _check 1
    cmd d.legend -c map=et0_m8_6@hart06et color=black
  End
End
