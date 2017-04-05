.version 52 0 
.class public super structmarker/ASMStructMarker$StructFType 
.super java/lang/Object 
.field bbs Ljava/util/List; .fieldattributes 
    .signature Ljava/util/List<Lstructmarker/ASMStructMarker$BB;>; 
.end fieldattributes 
.field col Ljava/awt/Color; 
.field lastModify J 
.field dim I 

.method public <init> : (ILjava/awt/Color;)V 
    .code stack 3 locals 3 
L0:     aload_0 
L1:     invokespecial Method java/lang/Object <init> ()V 
L4:     aload_0 
L5:     new java/util/ArrayList 
L8:     dup 
L9:     invokespecial Method java/util/ArrayList <init> ()V 
L12:    putfield Field structmarker/ASMStructMarker$StructFType bbs Ljava/util/List; 
L15:    aload_0 
L16:    aload_2 
L17:    putfield Field structmarker/ASMStructMarker$StructFType col Ljava/awt/Color; 
L20:    aload_0 
L21:    iload_1 
L22:    putfield Field structmarker/ASMStructMarker$StructFType dim I 
L25:    aload_0 
L26:    lconst_0 
L27:    putfield Field structmarker/ASMStructMarker$StructFType lastModify J 
L30:    return 
L31:    
        .linenumbertable 
            L0 226 
            L4 227 
            L15 228 
            L20 229 
            L25 230 
            L30 231 
        .end linenumbertable 
    .end code 
.end method 
.sourcefile 'ASMStructMarker.java' 
.innerclasses 
    structmarker/ASMStructMarker$BB structmarker/ASMStructMarker BB public static 
    structmarker/ASMStructMarker$StructFType structmarker/ASMStructMarker StructFType public static 
.end innerclasses 
.end class 
