.version 52 0 
.class public super villagemarker/RenderShapes 
.super java/lang/Object 
.field static gl_lighting Z 
.field static gl_texture_2d Z 
.field static gl_point_smooth Z 
.field static gl_line_smooth Z 
.field static gl_depth_test Z 
.field static gl_blend Z 
.field static gl_point_size F 
.field static gl_line_width F 
.field static gl_blend_src I 
.field static gl_blend_dst I 
.field public static sphereBufDVec [[F 

.method public <init> : ()V 
    .code stack 1 locals 1 
L0:     aload_0 
L1:     invokespecial Method java/lang/Object <init> ()V 
L4:     return 
L5:     
        .linenumbertable 
            L0 7 
        .end linenumbertable 
    .end code 
.end method 

.method public static translate : (FFF)V 
    .code stack 3 locals 3 
L0:     fload_0 
L1:     fneg 
L2:     fload_1 
L3:     fneg 
L4:     fload_2 
L5:     fneg 
L6:     invokestatic Method org/lwjgl/opengl/GL11 glTranslatef (FFF)V 
L9:     return 
L10:    
        .linenumbertable 
            L0 23 
            L9 24 
        .end linenumbertable 
    .end code 
.end method 

.method private static setGLConst : (IZ)V 
    .code stack 1 locals 2 
L0:     iload_1 
L1:     ifeq L11 
L4:     iload_0 
L5:     invokestatic Method org/lwjgl/opengl/GL11 glEnable (I)V 
L8:     goto L15 

        .stack same 
L11:    iload_0 
L12:    invokestatic Method org/lwjgl/opengl/GL11 glDisable (I)V 

        .stack same 
L15:    return 
L16:    
        .linenumbertable 
            L0 28 
            L4 29 
            L11 31 
            L15 32 
        .end linenumbertable 
    .end code 
.end method 

.method public static setup : (Z)V 
    .code stack 2 locals 1 
L0:     invokestatic Method org/lwjgl/opengl/GL11 glPushMatrix ()V 
L3:     sipush 2833 
L6:     invokestatic Method org/lwjgl/opengl/GL11 glGetFloat (I)F 
L9:     putstatic Field villagemarker/RenderShapes gl_point_size F 
L12:    sipush 2849 
L15:    invokestatic Method org/lwjgl/opengl/GL11 glGetFloat (I)F 
L18:    putstatic Field villagemarker/RenderShapes gl_line_width F 
L21:    sipush 2896 
L24:    invokestatic Method org/lwjgl/opengl/GL11 glGetBoolean (I)Z 
L27:    putstatic Field villagemarker/RenderShapes gl_lighting Z 
L30:    sipush 3553 
L33:    invokestatic Method org/lwjgl/opengl/GL11 glGetBoolean (I)Z 
L36:    putstatic Field villagemarker/RenderShapes gl_texture_2d Z 
L39:    sipush 2832 
L42:    invokestatic Method org/lwjgl/opengl/GL11 glGetBoolean (I)Z 
L45:    putstatic Field villagemarker/RenderShapes gl_point_smooth Z 
L48:    sipush 2848 
L51:    invokestatic Method org/lwjgl/opengl/GL11 glGetBoolean (I)Z 
L54:    putstatic Field villagemarker/RenderShapes gl_line_smooth Z 
L57:    sipush 3042 
L60:    invokestatic Method org/lwjgl/opengl/GL11 glGetBoolean (I)Z 
L63:    putstatic Field villagemarker/RenderShapes gl_blend Z 
L66:    sipush 2929 
L69:    invokestatic Method org/lwjgl/opengl/GL11 glGetBoolean (I)Z 
L72:    putstatic Field villagemarker/RenderShapes gl_depth_test Z 
L75:    sipush 3041 
L78:    invokestatic Method org/lwjgl/opengl/GL11 glGetInteger (I)I 
L81:    putstatic Field villagemarker/RenderShapes gl_blend_src I 
L84:    sipush 3040 
L87:    invokestatic Method org/lwjgl/opengl/GL11 glGetInteger (I)I 
L90:    putstatic Field villagemarker/RenderShapes gl_blend_dst I 
L93:    sipush 2896 
L96:    invokestatic Method org/lwjgl/opengl/GL11 glDisable (I)V 
L99:    sipush 3553 
L102:   invokestatic Method org/lwjgl/opengl/GL11 glDisable (I)V 
L105:   sipush 2832 
L108:   invokestatic Method org/lwjgl/opengl/GL11 glEnable (I)V 
L111:   sipush 2848 
L114:   invokestatic Method org/lwjgl/opengl/GL11 glEnable (I)V 
L117:   sipush 3153 
L120:   sipush 4354 
L123:   invokestatic Method org/lwjgl/opengl/GL11 glHint (II)V 
L126:   sipush 3154 
L129:   sipush 4354 
L132:   invokestatic Method org/lwjgl/opengl/GL11 glHint (II)V 
L135:   sipush 3042 
L138:   invokestatic Method org/lwjgl/opengl/GL11 glDisable (I)V 
L141:   sipush 2929 
L144:   iload_0 
L145:   invokestatic Method villagemarker/RenderShapes setGLConst (IZ)V 
L148:   return 
L149:   
        .linenumbertable 
            L0 36 
            L3 38 
            L12 39 
            L21 40 
            L30 41 
            L39 42 
            L48 43 
            L57 44 
            L66 45 
            L75 47 
            L84 48 
            L93 50 
            L99 51 
            L105 52 
            L111 53 
            L117 54 
            L126 55 
            L135 56 
            L141 57 
            L148 58 
        .end linenumbertable 
    .end code 
.end method 

.method public static restore : ()V 
    .code stack 2 locals 0 
L0:     sipush 2896 
L3:     getstatic Field villagemarker/RenderShapes gl_lighting Z 
L6:     invokestatic Method villagemarker/RenderShapes setGLConst (IZ)V 
L9:     sipush 3553 
L12:    getstatic Field villagemarker/RenderShapes gl_texture_2d Z 
L15:    invokestatic Method villagemarker/RenderShapes setGLConst (IZ)V 
L18:    sipush 2832 
L21:    getstatic Field villagemarker/RenderShapes gl_point_smooth Z 
L24:    invokestatic Method villagemarker/RenderShapes setGLConst (IZ)V 
L27:    sipush 2848 
L30:    getstatic Field villagemarker/RenderShapes gl_line_smooth Z 
L33:    invokestatic Method villagemarker/RenderShapes setGLConst (IZ)V 
L36:    sipush 2929 
L39:    getstatic Field villagemarker/RenderShapes gl_depth_test Z 
L42:    invokestatic Method villagemarker/RenderShapes setGLConst (IZ)V 
L45:    sipush 3042 
L48:    getstatic Field villagemarker/RenderShapes gl_blend Z 
L51:    invokestatic Method villagemarker/RenderShapes setGLConst (IZ)V 
L54:    getstatic Field villagemarker/RenderShapes gl_blend_src I 
L57:    getstatic Field villagemarker/RenderShapes gl_blend_dst I 
L60:    invokestatic Method org/lwjgl/opengl/GL11 glBlendFunc (II)V 
L63:    getstatic Field villagemarker/RenderShapes gl_line_width F 
L66:    invokestatic Method org/lwjgl/opengl/GL11 glLineWidth (F)V 
L69:    getstatic Field villagemarker/RenderShapes gl_point_size F 
L72:    invokestatic Method org/lwjgl/opengl/GL11 glPointSize (F)V 
L75:    invokestatic Method org/lwjgl/opengl/GL11 glPopMatrix ()V 
L78:    return 
L79:    
        .linenumbertable 
            L0 62 
            L9 63 
            L18 64 
            L27 65 
            L36 66 
            L45 67 
            L54 69 
            L63 71 
            L69 72 
            L75 73 
            L78 74 
        .end linenumbertable 
    .end code 
.end method 

.method public static drawLine : (FFFFFFLjava/awt/Color;F)V 
    .code stack 4 locals 8 
L0:     aload 6 
L2:     invokevirtual Method java/awt/Color getRed ()I 
L5:     i2f 
L6:     ldc +255.0f 
L8:     fdiv 
L9:     aload 6 
L11:    invokevirtual Method java/awt/Color getGreen ()I 
L14:    i2f 
L15:    ldc +255.0f 
L17:    fdiv 
L18:    aload 6 
L20:    invokevirtual Method java/awt/Color getBlue ()I 
L23:    i2f 
L24:    ldc +255.0f 
L26:    fdiv 
L27:    invokestatic Method org/lwjgl/opengl/GL11 glColor3f (FFF)V 
L30:    fload 7 
L32:    invokestatic Method org/lwjgl/opengl/GL11 glLineWidth (F)V 
L35:    iconst_3 
L36:    invokestatic Method org/lwjgl/opengl/GL11 glBegin (I)V 
L39:    fload_0 
L40:    fload_1 
L41:    fload_2 
L42:    invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L45:    fload_3 
L46:    fload 4 
L48:    fload 5 
L50:    invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L53:    invokestatic Method org/lwjgl/opengl/GL11 glEnd ()V 
L56:    return 
L57:    
        .linenumbertable 
            L0 78 
            L30 79 
            L35 80 
            L39 81 
            L45 82 
            L53 83 
            L56 84 
        .end linenumbertable 
    .end code 
.end method 

.method public static drawBox : (FFFFFFLjava/awt/Color;F)V 
    .code stack 4 locals 8 
L0:     aload 6 
L2:     invokevirtual Method java/awt/Color getRed ()I 
L5:     i2f 
L6:     ldc +255.0f 
L8:     fdiv 
L9:     aload 6 
L11:    invokevirtual Method java/awt/Color getGreen ()I 
L14:    i2f 
L15:    ldc +255.0f 
L17:    fdiv 
L18:    aload 6 
L20:    invokevirtual Method java/awt/Color getBlue ()I 
L23:    i2f 
L24:    ldc +255.0f 
L26:    fdiv 
L27:    invokestatic Method org/lwjgl/opengl/GL11 glColor3f (FFF)V 
L30:    fload 7 
L32:    invokestatic Method org/lwjgl/opengl/GL11 glLineWidth (F)V 
L35:    iconst_3 
L36:    invokestatic Method org/lwjgl/opengl/GL11 glBegin (I)V 
L39:    fload_0 
L40:    fload_1 
L41:    fload 5 
L43:    invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L46:    fload_3 
L47:    fload_1 
L48:    fload 5 
L50:    invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L53:    fload_3 
L54:    fload_1 
L55:    fload_2 
L56:    invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L59:    fload_0 
L60:    fload_1 
L61:    fload_2 
L62:    invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L65:    fload_0 
L66:    fload_1 
L67:    fload 5 
L69:    invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L72:    invokestatic Method org/lwjgl/opengl/GL11 glEnd ()V 
L75:    iconst_3 
L76:    invokestatic Method org/lwjgl/opengl/GL11 glBegin (I)V 
L79:    fload_0 
L80:    fload 4 
L82:    fload 5 
L84:    invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L87:    fload_3 
L88:    fload 4 
L90:    fload 5 
L92:    invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L95:    fload_3 
L96:    fload 4 
L98:    fload_2 
L99:    invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L102:   fload_0 
L103:   fload 4 
L105:   fload_2 
L106:   invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L109:   fload_0 
L110:   fload 4 
L112:   fload 5 
L114:   invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L117:   invokestatic Method org/lwjgl/opengl/GL11 glEnd ()V 
L120:   iconst_1 
L121:   invokestatic Method org/lwjgl/opengl/GL11 glBegin (I)V 
L124:   fload_0 
L125:   fload_1 
L126:   fload 5 
L128:   invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L131:   fload_0 
L132:   fload 4 
L134:   fload 5 
L136:   invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L139:   invokestatic Method org/lwjgl/opengl/GL11 glEnd ()V 
L142:   iconst_1 
L143:   invokestatic Method org/lwjgl/opengl/GL11 glBegin (I)V 
L146:   fload_3 
L147:   fload_1 
L148:   fload 5 
L150:   invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L153:   fload_3 
L154:   fload 4 
L156:   fload 5 
L158:   invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L161:   invokestatic Method org/lwjgl/opengl/GL11 glEnd ()V 
L164:   iconst_1 
L165:   invokestatic Method org/lwjgl/opengl/GL11 glBegin (I)V 
L168:   fload_3 
L169:   fload_1 
L170:   fload_2 
L171:   invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L174:   fload_3 
L175:   fload 4 
L177:   fload_2 
L178:   invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L181:   invokestatic Method org/lwjgl/opengl/GL11 glEnd ()V 
L184:   iconst_1 
L185:   invokestatic Method org/lwjgl/opengl/GL11 glBegin (I)V 
L188:   fload_0 
L189:   fload_1 
L190:   fload_2 
L191:   invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L194:   fload_0 
L195:   fload 4 
L197:   fload_2 
L198:   invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L201:   invokestatic Method org/lwjgl/opengl/GL11 glEnd ()V 
L204:   return 
L205:   
        .linenumbertable 
            L0 88 
            L30 89 
            L35 91 
            L39 92 
            L46 93 
            L53 94 
            L59 95 
            L65 96 
            L72 97 
            L75 98 
            L79 99 
            L87 100 
            L95 101 
            L102 102 
            L109 103 
            L117 104 
            L120 105 
            L124 106 
            L131 107 
            L139 108 
            L142 109 
            L146 110 
            L153 111 
            L161 112 
            L164 113 
            L168 114 
            L174 115 
            L181 116 
            L184 117 
            L188 118 
            L194 119 
            L201 120 
            L204 121 
        .end linenumbertable 
    .end code 
.end method 

.method private static drawBoxPart : ([[F[[I)V 
    .code stack 5 locals 3 
L0:     bipush 7 
L2:     invokestatic Method org/lwjgl/opengl/GL11 glBegin (I)V 
L5:     iconst_0 
L6:     istore_2 

        .stack append Integer 
L7:     iload_2 
L8:     aload_1 
L9:     arraylength 
L10:    if_icmpge L49 
L13:    aload_0 
L14:    aload_1 
L15:    iload_2 
L16:    aaload 
L17:    iconst_0 
L18:    iaload 
L19:    aaload 
L20:    iconst_0 
L21:    faload 
L22:    aload_0 
L23:    aload_1 
L24:    iload_2 
L25:    aaload 
L26:    iconst_1 
L27:    iaload 
L28:    aaload 
L29:    iconst_1 
L30:    faload 
L31:    aload_0 
L32:    aload_1 
L33:    iload_2 
L34:    aaload 
L35:    iconst_2 
L36:    iaload 
L37:    aaload 
L38:    iconst_2 
L39:    faload 
L40:    invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L43:    iinc 2 1 
L46:    goto L7 

        .stack chop 1 
L49:    invokestatic Method org/lwjgl/opengl/GL11 glEnd ()V 
L52:    return 
L53:    
        .linenumbertable 
            L0 125 
            L5 126 
            L13 127 
            L43 126 
            L49 128 
            L52 129 
        .end linenumbertable 
    .end code 
.end method 

.method public static drawBoxWalls : (FFFFFFLjava/awt/Color;F)V 
    .code stack 8 locals 9 
L0:     sipush 3042 
L3:     invokestatic Method org/lwjgl/opengl/GL11 glEnable (I)V 
L6:     sipush 770 
L9:     iconst_1 
L10:    invokestatic Method org/lwjgl/opengl/GL11 glBlendFunc (II)V 
L13:    iconst_0 
L14:    invokestatic Method org/lwjgl/opengl/GL11 glDepthMask (Z)V 
L17:    aload 6 
L19:    invokevirtual Method java/awt/Color getRed ()I 
L22:    i2f 
L23:    ldc +255.0f 
L25:    fdiv 
L26:    aload 6 
L28:    invokevirtual Method java/awt/Color getGreen ()I 
L31:    i2f 
L32:    ldc +255.0f 
L34:    fdiv 
L35:    aload 6 
L37:    invokevirtual Method java/awt/Color getBlue ()I 
L40:    i2f 
L41:    ldc +255.0f 
L43:    fdiv 
L44:    fload 7 
L46:    invokestatic Method org/lwjgl/opengl/GL11 glColor4f (FFFF)V 
L49:    iconst_2 
L50:    anewarray [F 
L53:    dup 
L54:    iconst_0 
L55:    iconst_3 
L56:    newarray float 
L58:    dup 
L59:    iconst_0 
L60:    fload_0 
L61:    fastore 
L62:    dup 
L63:    iconst_1 
L64:    fload_1 
L65:    fastore 
L66:    dup 
L67:    iconst_2 
L68:    fload_2 
L69:    fastore 
L70:    aastore 
L71:    dup 
L72:    iconst_1 
L73:    iconst_3 
L74:    newarray float 
L76:    dup 
L77:    iconst_0 
L78:    fload_3 
L79:    fastore 
L80:    dup 
L81:    iconst_1 
L82:    fload 4 
L84:    fastore 
L85:    dup 
L86:    iconst_2 
L87:    fload 5 
L89:    fastore 
L90:    aastore 
L91:    astore 8 
L93:    aload 8 
L95:    iconst_4 
L96:    anewarray [I 
L99:    dup 
L100:   iconst_0 
L101:   iconst_3 
L102:   newarray int 
L104:   dup 
L105:   iconst_0 
L106:   iconst_0 
L107:   iastore 
L108:   dup 
L109:   iconst_1 
L110:   iconst_0 
L111:   iastore 
L112:   dup 
L113:   iconst_2 
L114:   iconst_0 
L115:   iastore 
L116:   aastore 
L117:   dup 
L118:   iconst_1 
L119:   iconst_3 
L120:   newarray int 
L122:   dup 
L123:   iconst_0 
L124:   iconst_0 
L125:   iastore 
L126:   dup 
L127:   iconst_1 
L128:   iconst_0 
L129:   iastore 
L130:   dup 
L131:   iconst_2 
L132:   iconst_1 
L133:   iastore 
L134:   aastore 
L135:   dup 
L136:   iconst_2 
L137:   iconst_3 
L138:   newarray int 
L140:   dup 
L141:   iconst_0 
L142:   iconst_0 
L143:   iastore 
L144:   dup 
L145:   iconst_1 
L146:   iconst_1 
L147:   iastore 
L148:   dup 
L149:   iconst_2 
L150:   iconst_1 
L151:   iastore 
L152:   aastore 
L153:   dup 
L154:   iconst_3 
L155:   iconst_3 
L156:   newarray int 
L158:   dup 
L159:   iconst_0 
L160:   iconst_0 
L161:   iastore 
L162:   dup 
L163:   iconst_1 
L164:   iconst_1 
L165:   iastore 
L166:   dup 
L167:   iconst_2 
L168:   iconst_0 
L169:   iastore 
L170:   aastore 
L171:   invokestatic Method villagemarker/RenderShapes drawBoxPart ([[F[[I)V 
L174:   aload 8 
L176:   iconst_4 
L177:   anewarray [I 
L180:   dup 
L181:   iconst_0 
L182:   iconst_3 
L183:   newarray int 
L185:   dup 
L186:   iconst_0 
L187:   iconst_1 
L188:   iastore 
L189:   dup 
L190:   iconst_1 
L191:   iconst_0 
L192:   iastore 
L193:   dup 
L194:   iconst_2 
L195:   iconst_0 
L196:   iastore 
L197:   aastore 
L198:   dup 
L199:   iconst_1 
L200:   iconst_3 
L201:   newarray int 
L203:   dup 
L204:   iconst_0 
L205:   iconst_1 
L206:   iastore 
L207:   dup 
L208:   iconst_1 
L209:   iconst_1 
L210:   iastore 
L211:   dup 
L212:   iconst_2 
L213:   iconst_0 
L214:   iastore 
L215:   aastore 
L216:   dup 
L217:   iconst_2 
L218:   iconst_3 
L219:   newarray int 
L221:   dup 
L222:   iconst_0 
L223:   iconst_1 
L224:   iastore 
L225:   dup 
L226:   iconst_1 
L227:   iconst_1 
L228:   iastore 
L229:   dup 
L230:   iconst_2 
L231:   iconst_1 
L232:   iastore 
L233:   aastore 
L234:   dup 
L235:   iconst_3 
L236:   iconst_3 
L237:   newarray int 
L239:   dup 
L240:   iconst_0 
L241:   iconst_1 
L242:   iastore 
L243:   dup 
L244:   iconst_1 
L245:   iconst_0 
L246:   iastore 
L247:   dup 
L248:   iconst_2 
L249:   iconst_1 
L250:   iastore 
L251:   aastore 
L252:   invokestatic Method villagemarker/RenderShapes drawBoxPart ([[F[[I)V 
L255:   aload 8 
L257:   iconst_4 
L258:   anewarray [I 
L261:   dup 
L262:   iconst_0 
L263:   iconst_3 
L264:   newarray int 
L266:   dup 
L267:   iconst_0 
L268:   iconst_0 
L269:   iastore 
L270:   dup 
L271:   iconst_1 
L272:   iconst_0 
L273:   iastore 
L274:   dup 
L275:   iconst_2 
L276:   iconst_0 
L277:   iastore 
L278:   aastore 
L279:   dup 
L280:   iconst_1 
L281:   iconst_3 
L282:   newarray int 
L284:   dup 
L285:   iconst_0 
L286:   iconst_1 
L287:   iastore 
L288:   dup 
L289:   iconst_1 
L290:   iconst_0 
L291:   iastore 
L292:   dup 
L293:   iconst_2 
L294:   iconst_0 
L295:   iastore 
L296:   aastore 
L297:   dup 
L298:   iconst_2 
L299:   iconst_3 
L300:   newarray int 
L302:   dup 
L303:   iconst_0 
L304:   iconst_1 
L305:   iastore 
L306:   dup 
L307:   iconst_1 
L308:   iconst_0 
L309:   iastore 
L310:   dup 
L311:   iconst_2 
L312:   iconst_1 
L313:   iastore 
L314:   aastore 
L315:   dup 
L316:   iconst_3 
L317:   iconst_3 
L318:   newarray int 
L320:   dup 
L321:   iconst_0 
L322:   iconst_0 
L323:   iastore 
L324:   dup 
L325:   iconst_1 
L326:   iconst_0 
L327:   iastore 
L328:   dup 
L329:   iconst_2 
L330:   iconst_1 
L331:   iastore 
L332:   aastore 
L333:   invokestatic Method villagemarker/RenderShapes drawBoxPart ([[F[[I)V 
L336:   aload 8 
L338:   iconst_4 
L339:   anewarray [I 
L342:   dup 
L343:   iconst_0 
L344:   iconst_3 
L345:   newarray int 
L347:   dup 
L348:   iconst_0 
L349:   iconst_0 
L350:   iastore 
L351:   dup 
L352:   iconst_1 
L353:   iconst_1 
L354:   iastore 
L355:   dup 
L356:   iconst_2 
L357:   iconst_0 
L358:   iastore 
L359:   aastore 
L360:   dup 
L361:   iconst_1 
L362:   iconst_3 
L363:   newarray int 
L365:   dup 
L366:   iconst_0 
L367:   iconst_0 
L368:   iastore 
L369:   dup 
L370:   iconst_1 
L371:   iconst_1 
L372:   iastore 
L373:   dup 
L374:   iconst_2 
L375:   iconst_1 
L376:   iastore 
L377:   aastore 
L378:   dup 
L379:   iconst_2 
L380:   iconst_3 
L381:   newarray int 
L383:   dup 
L384:   iconst_0 
L385:   iconst_1 
L386:   iastore 
L387:   dup 
L388:   iconst_1 
L389:   iconst_1 
L390:   iastore 
L391:   dup 
L392:   iconst_2 
L393:   iconst_1 
L394:   iastore 
L395:   aastore 
L396:   dup 
L397:   iconst_3 
L398:   iconst_3 
L399:   newarray int 
L401:   dup 
L402:   iconst_0 
L403:   iconst_1 
L404:   iastore 
L405:   dup 
L406:   iconst_1 
L407:   iconst_1 
L408:   iastore 
L409:   dup 
L410:   iconst_2 
L411:   iconst_0 
L412:   iastore 
L413:   aastore 
L414:   invokestatic Method villagemarker/RenderShapes drawBoxPart ([[F[[I)V 
L417:   aload 8 
L419:   iconst_4 
L420:   anewarray [I 
L423:   dup 
L424:   iconst_0 
L425:   iconst_3 
L426:   newarray int 
L428:   dup 
L429:   iconst_0 
L430:   iconst_0 
L431:   iastore 
L432:   dup 
L433:   iconst_1 
L434:   iconst_0 
L435:   iastore 
L436:   dup 
L437:   iconst_2 
L438:   iconst_0 
L439:   iastore 
L440:   aastore 
L441:   dup 
L442:   iconst_1 
L443:   iconst_3 
L444:   newarray int 
L446:   dup 
L447:   iconst_0 
L448:   iconst_0 
L449:   iastore 
L450:   dup 
L451:   iconst_1 
L452:   iconst_1 
L453:   iastore 
L454:   dup 
L455:   iconst_2 
L456:   iconst_0 
L457:   iastore 
L458:   aastore 
L459:   dup 
L460:   iconst_2 
L461:   iconst_3 
L462:   newarray int 
L464:   dup 
L465:   iconst_0 
L466:   iconst_1 
L467:   iastore 
L468:   dup 
L469:   iconst_1 
L470:   iconst_1 
L471:   iastore 
L472:   dup 
L473:   iconst_2 
L474:   iconst_0 
L475:   iastore 
L476:   aastore 
L477:   dup 
L478:   iconst_3 
L479:   iconst_3 
L480:   newarray int 
L482:   dup 
L483:   iconst_0 
L484:   iconst_1 
L485:   iastore 
L486:   dup 
L487:   iconst_1 
L488:   iconst_0 
L489:   iastore 
L490:   dup 
L491:   iconst_2 
L492:   iconst_0 
L493:   iastore 
L494:   aastore 
L495:   invokestatic Method villagemarker/RenderShapes drawBoxPart ([[F[[I)V 
L498:   aload 8 
L500:   iconst_4 
L501:   anewarray [I 
L504:   dup 
L505:   iconst_0 
L506:   iconst_3 
L507:   newarray int 
L509:   dup 
L510:   iconst_0 
L511:   iconst_0 
L512:   iastore 
L513:   dup 
L514:   iconst_1 
L515:   iconst_0 
L516:   iastore 
L517:   dup 
L518:   iconst_2 
L519:   iconst_1 
L520:   iastore 
L521:   aastore 
L522:   dup 
L523:   iconst_1 
L524:   iconst_3 
L525:   newarray int 
L527:   dup 
L528:   iconst_0 
L529:   iconst_1 
L530:   iastore 
L531:   dup 
L532:   iconst_1 
L533:   iconst_0 
L534:   iastore 
L535:   dup 
L536:   iconst_2 
L537:   iconst_1 
L538:   iastore 
L539:   aastore 
L540:   dup 
L541:   iconst_2 
L542:   iconst_3 
L543:   newarray int 
L545:   dup 
L546:   iconst_0 
L547:   iconst_1 
L548:   iastore 
L549:   dup 
L550:   iconst_1 
L551:   iconst_1 
L552:   iastore 
L553:   dup 
L554:   iconst_2 
L555:   iconst_1 
L556:   iastore 
L557:   aastore 
L558:   dup 
L559:   iconst_3 
L560:   iconst_3 
L561:   newarray int 
L563:   dup 
L564:   iconst_0 
L565:   iconst_0 
L566:   iastore 
L567:   dup 
L568:   iconst_1 
L569:   iconst_1 
L570:   iastore 
L571:   dup 
L572:   iconst_2 
L573:   iconst_1 
L574:   iastore 
L575:   aastore 
L576:   invokestatic Method villagemarker/RenderShapes drawBoxPart ([[F[[I)V 
L579:   aload 8 
L581:   iconst_4 
L582:   anewarray [I 
L585:   dup 
L586:   iconst_0 
L587:   iconst_3 
L588:   newarray int 
L590:   dup 
L591:   iconst_0 
L592:   iconst_0 
L593:   iastore 
L594:   dup 
L595:   iconst_1 
L596:   iconst_0 
L597:   iastore 
L598:   dup 
L599:   iconst_2 
L600:   iconst_0 
L601:   iastore 
L602:   aastore 
L603:   dup 
L604:   iconst_1 
L605:   iconst_3 
L606:   newarray int 
L608:   dup 
L609:   iconst_0 
L610:   iconst_0 
L611:   iastore 
L612:   dup 
L613:   iconst_1 
L614:   iconst_1 
L615:   iastore 
L616:   dup 
L617:   iconst_2 
L618:   iconst_0 
L619:   iastore 
L620:   aastore 
L621:   dup 
L622:   iconst_2 
L623:   iconst_3 
L624:   newarray int 
L626:   dup 
L627:   iconst_0 
L628:   iconst_0 
L629:   iastore 
L630:   dup 
L631:   iconst_1 
L632:   iconst_1 
L633:   iastore 
L634:   dup 
L635:   iconst_2 
L636:   iconst_1 
L637:   iastore 
L638:   aastore 
L639:   dup 
L640:   iconst_3 
L641:   iconst_3 
L642:   newarray int 
L644:   dup 
L645:   iconst_0 
L646:   iconst_0 
L647:   iastore 
L648:   dup 
L649:   iconst_1 
L650:   iconst_0 
L651:   iastore 
L652:   dup 
L653:   iconst_2 
L654:   iconst_1 
L655:   iastore 
L656:   aastore 
L657:   invokestatic Method villagemarker/RenderShapes drawBoxPart ([[F[[I)V 
L660:   aload 8 
L662:   iconst_4 
L663:   anewarray [I 
L666:   dup 
L667:   iconst_0 
L668:   iconst_3 
L669:   newarray int 
L671:   dup 
L672:   iconst_0 
L673:   iconst_1 
L674:   iastore 
L675:   dup 
L676:   iconst_1 
L677:   iconst_0 
L678:   iastore 
L679:   dup 
L680:   iconst_2 
L681:   iconst_0 
L682:   iastore 
L683:   aastore 
L684:   dup 
L685:   iconst_1 
L686:   iconst_3 
L687:   newarray int 
L689:   dup 
L690:   iconst_0 
L691:   iconst_1 
L692:   iastore 
L693:   dup 
L694:   iconst_1 
L695:   iconst_0 
L696:   iastore 
L697:   dup 
L698:   iconst_2 
L699:   iconst_1 
L700:   iastore 
L701:   aastore 
L702:   dup 
L703:   iconst_2 
L704:   iconst_3 
L705:   newarray int 
L707:   dup 
L708:   iconst_0 
L709:   iconst_1 
L710:   iastore 
L711:   dup 
L712:   iconst_1 
L713:   iconst_1 
L714:   iastore 
L715:   dup 
L716:   iconst_2 
L717:   iconst_1 
L718:   iastore 
L719:   aastore 
L720:   dup 
L721:   iconst_3 
L722:   iconst_3 
L723:   newarray int 
L725:   dup 
L726:   iconst_0 
L727:   iconst_1 
L728:   iastore 
L729:   dup 
L730:   iconst_1 
L731:   iconst_1 
L732:   iastore 
L733:   dup 
L734:   iconst_2 
L735:   iconst_0 
L736:   iastore 
L737:   aastore 
L738:   invokestatic Method villagemarker/RenderShapes drawBoxPart ([[F[[I)V 
L741:   aload 8 
L743:   iconst_4 
L744:   anewarray [I 
L747:   dup 
L748:   iconst_0 
L749:   iconst_3 
L750:   newarray int 
L752:   dup 
L753:   iconst_0 
L754:   iconst_0 
L755:   iastore 
L756:   dup 
L757:   iconst_1 
L758:   iconst_0 
L759:   iastore 
L760:   dup 
L761:   iconst_2 
L762:   iconst_0 
L763:   iastore 
L764:   aastore 
L765:   dup 
L766:   iconst_1 
L767:   iconst_3 
L768:   newarray int 
L770:   dup 
L771:   iconst_0 
L772:   iconst_0 
L773:   iastore 
L774:   dup 
L775:   iconst_1 
L776:   iconst_0 
L777:   iastore 
L778:   dup 
L779:   iconst_2 
L780:   iconst_1 
L781:   iastore 
L782:   aastore 
L783:   dup 
L784:   iconst_2 
L785:   iconst_3 
L786:   newarray int 
L788:   dup 
L789:   iconst_0 
L790:   iconst_1 
L791:   iastore 
L792:   dup 
L793:   iconst_1 
L794:   iconst_0 
L795:   iastore 
L796:   dup 
L797:   iconst_2 
L798:   iconst_1 
L799:   iastore 
L800:   aastore 
L801:   dup 
L802:   iconst_3 
L803:   iconst_3 
L804:   newarray int 
L806:   dup 
L807:   iconst_0 
L808:   iconst_1 
L809:   iastore 
L810:   dup 
L811:   iconst_1 
L812:   iconst_0 
L813:   iastore 
L814:   dup 
L815:   iconst_2 
L816:   iconst_0 
L817:   iastore 
L818:   aastore 
L819:   invokestatic Method villagemarker/RenderShapes drawBoxPart ([[F[[I)V 
L822:   aload 8 
L824:   iconst_4 
L825:   anewarray [I 
L828:   dup 
L829:   iconst_0 
L830:   iconst_3 
L831:   newarray int 
L833:   dup 
L834:   iconst_0 
L835:   iconst_0 
L836:   iastore 
L837:   dup 
L838:   iconst_1 
L839:   iconst_1 
L840:   iastore 
L841:   dup 
L842:   iconst_2 
L843:   iconst_0 
L844:   iastore 
L845:   aastore 
L846:   dup 
L847:   iconst_1 
L848:   iconst_3 
L849:   newarray int 
L851:   dup 
L852:   iconst_0 
L853:   iconst_1 
L854:   iastore 
L855:   dup 
L856:   iconst_1 
L857:   iconst_1 
L858:   iastore 
L859:   dup 
L860:   iconst_2 
L861:   iconst_0 
L862:   iastore 
L863:   aastore 
L864:   dup 
L865:   iconst_2 
L866:   iconst_3 
L867:   newarray int 
L869:   dup 
L870:   iconst_0 
L871:   iconst_1 
L872:   iastore 
L873:   dup 
L874:   iconst_1 
L875:   iconst_1 
L876:   iastore 
L877:   dup 
L878:   iconst_2 
L879:   iconst_1 
L880:   iastore 
L881:   aastore 
L882:   dup 
L883:   iconst_3 
L884:   iconst_3 
L885:   newarray int 
L887:   dup 
L888:   iconst_0 
L889:   iconst_0 
L890:   iastore 
L891:   dup 
L892:   iconst_1 
L893:   iconst_1 
L894:   iastore 
L895:   dup 
L896:   iconst_2 
L897:   iconst_1 
L898:   iastore 
L899:   aastore 
L900:   invokestatic Method villagemarker/RenderShapes drawBoxPart ([[F[[I)V 
L903:   aload 8 
L905:   iconst_4 
L906:   anewarray [I 
L909:   dup 
L910:   iconst_0 
L911:   iconst_3 
L912:   newarray int 
L914:   dup 
L915:   iconst_0 
L916:   iconst_0 
L917:   iastore 
L918:   dup 
L919:   iconst_1 
L920:   iconst_0 
L921:   iastore 
L922:   dup 
L923:   iconst_2 
L924:   iconst_0 
L925:   iastore 
L926:   aastore 
L927:   dup 
L928:   iconst_1 
L929:   iconst_3 
L930:   newarray int 
L932:   dup 
L933:   iconst_0 
L934:   iconst_1 
L935:   iastore 
L936:   dup 
L937:   iconst_1 
L938:   iconst_0 
L939:   iastore 
L940:   dup 
L941:   iconst_2 
L942:   iconst_0 
L943:   iastore 
L944:   aastore 
L945:   dup 
L946:   iconst_2 
L947:   iconst_3 
L948:   newarray int 
L950:   dup 
L951:   iconst_0 
L952:   iconst_1 
L953:   iastore 
L954:   dup 
L955:   iconst_1 
L956:   iconst_1 
L957:   iastore 
L958:   dup 
L959:   iconst_2 
L960:   iconst_0 
L961:   iastore 
L962:   aastore 
L963:   dup 
L964:   iconst_3 
L965:   iconst_3 
L966:   newarray int 
L968:   dup 
L969:   iconst_0 
L970:   iconst_0 
L971:   iastore 
L972:   dup 
L973:   iconst_1 
L974:   iconst_1 
L975:   iastore 
L976:   dup 
L977:   iconst_2 
L978:   iconst_0 
L979:   iastore 
L980:   aastore 
L981:   invokestatic Method villagemarker/RenderShapes drawBoxPart ([[F[[I)V 
L984:   aload 8 
L986:   iconst_4 
L987:   anewarray [I 
L990:   dup 
L991:   iconst_0 
L992:   iconst_3 
L993:   newarray int 
L995:   dup 
L996:   iconst_0 
L997:   iconst_0 
L998:   iastore 
L999:   dup 
L1000:  iconst_1 
L1001:  iconst_0 
L1002:  iastore 
L1003:  dup 
L1004:  iconst_2 
L1005:  iconst_1 
L1006:  iastore 
L1007:  aastore 
L1008:  dup 
L1009:  iconst_1 
L1010:  iconst_3 
L1011:  newarray int 
L1013:  dup 
L1014:  iconst_0 
L1015:  iconst_0 
L1016:  iastore 
L1017:  dup 
L1018:  iconst_1 
L1019:  iconst_1 
L1020:  iastore 
L1021:  dup 
L1022:  iconst_2 
L1023:  iconst_1 
L1024:  iastore 
L1025:  aastore 
L1026:  dup 
L1027:  iconst_2 
L1028:  iconst_3 
L1029:  newarray int 
L1031:  dup 
L1032:  iconst_0 
L1033:  iconst_1 
L1034:  iastore 
L1035:  dup 
L1036:  iconst_1 
L1037:  iconst_1 
L1038:  iastore 
L1039:  dup 
L1040:  iconst_2 
L1041:  iconst_1 
L1042:  iastore 
L1043:  aastore 
L1044:  dup 
L1045:  iconst_3 
L1046:  iconst_3 
L1047:  newarray int 
L1049:  dup 
L1050:  iconst_0 
L1051:  iconst_1 
L1052:  iastore 
L1053:  dup 
L1054:  iconst_1 
L1055:  iconst_0 
L1056:  iastore 
L1057:  dup 
L1058:  iconst_2 
L1059:  iconst_1 
L1060:  iastore 
L1061:  aastore 
L1062:  invokestatic Method villagemarker/RenderShapes drawBoxPart ([[F[[I)V 
L1065:  iconst_1 
L1066:  invokestatic Method org/lwjgl/opengl/GL11 glDepthMask (Z)V 
L1069:  iconst_1 
L1070:  iconst_0 
L1071:  invokestatic Method org/lwjgl/opengl/GL11 glBlendFunc (II)V 
L1074:  sipush 3042 
L1077:  invokestatic Method org/lwjgl/opengl/GL11 glDisable (I)V 
L1080:  return 
L1081:  
        .linenumbertable 
            L0 133 
            L6 134 
            L13 135 
            L17 136 
            L49 138 
            L93 141 
            L174 142 
            L255 144 
            L336 145 
            L417 147 
            L498 148 
            L579 151 
            L660 152 
            L741 154 
            L822 155 
            L903 157 
            L984 158 
            L1065 160 
            L1069 161 
            L1074 162 
            L1080 163 
        .end linenumbertable 
    .end code 
.end method 

.method public static drawSphere : (FFFDILjava/awt/Color;F)V 
    .code stack 9 locals 21 
L0:     aload 6 
L2:     invokevirtual Method java/awt/Color getRed ()I 
L5:     i2f 
L6:     ldc +255.0f 
L8:     fdiv 
L9:     aload 6 
L11:    invokevirtual Method java/awt/Color getGreen ()I 
L14:    i2f 
L15:    ldc +255.0f 
L17:    fdiv 
L18:    aload 6 
L20:    invokevirtual Method java/awt/Color getBlue ()I 
L23:    i2f 
L24:    ldc +255.0f 
L26:    fdiv 
L27:    invokestatic Method org/lwjgl/opengl/GL11 glColor3f (FFF)V 
L30:    fload 7 
L32:    invokestatic Method org/lwjgl/opengl/GL11 glPointSize (F)V 
L35:    ldc2_w +6.283185307179586 
L38:    iload 5 
L40:    i2d 
L41:    ddiv 
L42:    dstore 8 
L44:    dconst_0 
L45:    dstore 10 

        .stack append Double Double 
L47:    dload 10 
L49:    ldc2_w +6.283185307179586 
L52:    dcmpg 
L53:    ifge L176 
L56:    dload 10 
L58:    invokestatic Method java/lang/Math sin (D)D 
L61:    dstore 12 
L63:    ldc2_w +3.141592653589793 
L66:    iconst_1 
L67:    iload 5 
L69:    i2d 
L70:    dload 12 
L72:    ldc2_w +2.0 
L75:    ddiv 
L76:    invokestatic Method java/lang/Math abs (D)D 
L79:    dmul 
L80:    d2i 
L81:    iadd 
L82:    i2d 
L83:    ddiv 
L84:    dstore 14 
L86:    iconst_0 
L87:    invokestatic Method org/lwjgl/opengl/GL11 glBegin (I)V 
L90:    dconst_0 
L91:    dstore 16 

        .stack append Double Double Double 
L93:    dload 16 
L95:    ldc2_w +3.141592653589793 
L98:    dcmpg 
L99:    ifge L163 
L102:   dload_3 
L103:   dload 12 
L105:   dmul 
L106:   dload 16 
L108:   invokestatic Method java/lang/Math cos (D)D 
L111:   dmul 
L112:   d2f 
L113:   fstore 18 
L115:   dload_3 
L116:   dload 12 
L118:   dmul 
L119:   dload 16 
L121:   invokestatic Method java/lang/Math sin (D)D 
L124:   dmul 
L125:   d2f 
L126:   fstore 19 
L128:   dload_3 
L129:   dload 10 
L131:   invokestatic Method java/lang/Math cos (D)D 
L134:   dmul 
L135:   d2f 
L136:   fstore 20 
L138:   fload_0 
L139:   fload 18 
L141:   fadd 
L142:   fload_1 
L143:   fload 20 
L145:   fadd 
L146:   fload_2 
L147:   fload 19 
L149:   fadd 
L150:   invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L153:   dload 16 
L155:   dload 14 
L157:   dadd 
L158:   dstore 16 
L160:   goto L93 

        .stack chop 1 
L163:   invokestatic Method org/lwjgl/opengl/GL11 glEnd ()V 
L166:   dload 10 
L168:   dload 8 
L170:   dadd 
L171:   dstore 10 
L173:   goto L47 

        .stack chop 3 
L176:   return 
L177:   
        .linenumbertable 
            L0 167 
            L30 168 
            L35 170 
            L44 172 
            L56 174 
            L63 175 
            L86 176 
            L90 177 
            L102 179 
            L115 180 
            L128 181 
            L138 182 
            L153 177 
            L163 184 
            L166 172 
            L176 186 
        .end linenumbertable 
    .end code 
.end method 

.method public static updateSphereBuf : (I)V 
    .code stack 9 locals 16 
L0:     iconst_1 
L1:     iload_0 
L2:     iload_0 
L3:     imul 
L4:     i2d 
L5:     ldc2_w +3.141592653589793 
L8:     dmul 
L9:     ldc2_w +4.0 
L12:    ddiv 
L13:    d2i 
L14:    iadd 
L15:    anewarray [F 
L18:    astore_1 
L19:    iconst_0 
L20:    istore_2 
L21:    ldc2_w +6.283185307179586 
L24:    iload_0 
L25:    i2d 
L26:    ddiv 
L27:    dstore_3 
L28:    dconst_0 
L29:    dstore 5 

        .stack full 
            locals Integer Object [[F Integer Double Double 
            stack 
        .end stack 
L31:    dload 5 
L33:    ldc2_w +6.283185307179586 
L36:    dcmpg 
L37:    ifge L154 
L40:    dload 5 
L42:    invokestatic Method java/lang/Math sin (D)D 
L45:    dstore 7 
L47:    ldc2_w +3.141592653589793 
L50:    iconst_1 
L51:    iload_0 
L52:    i2d 
L53:    dload 7 
L55:    ldc2_w +2.0 
L58:    ddiv 
L59:    invokestatic Method java/lang/Math abs (D)D 
L62:    dmul 
L63:    d2i 
L64:    iadd 
L65:    i2d 
L66:    ddiv 
L67:    dstore 9 
L69:    dconst_0 
L70:    dstore 11 

        .stack append Double Double Double 
L72:    dload 11 
L74:    ldc2_w +3.141592653589793 
L77:    dcmpg 
L78:    ifge L145 
L81:    dload 7 
L83:    dload 11 
L85:    invokestatic Method java/lang/Math cos (D)D 
L88:    dmul 
L89:    d2f 
L90:    fstore 13 
L92:    dload 7 
L94:    dload 11 
L96:    invokestatic Method java/lang/Math sin (D)D 
L99:    dmul 
L100:   d2f 
L101:   fstore 14 
L103:   dload 5 
L105:   invokestatic Method java/lang/Math cos (D)D 
L108:   d2f 
L109:   fstore 15 
L111:   aload_1 
L112:   iload_2 
L113:   iinc 2 1 
L116:   iconst_3 
L117:   newarray float 
L119:   dup 
L120:   iconst_0 
L121:   fload 13 
L123:   fastore 
L124:   dup 
L125:   iconst_1 
L126:   fload 15 
L128:   fastore 
L129:   dup 
L130:   iconst_2 
L131:   fload 14 
L133:   fastore 
L134:   aastore 
L135:   dload 11 
L137:   dload 9 
L139:   dadd 
L140:   dstore 11 
L142:   goto L72 

        .stack chop 3 
L145:   dload 5 
L147:   dload_3 
L148:   dadd 
L149:   dstore 5 
L151:   goto L31 

        .stack chop 1 
L154:   iload_2 
L155:   anewarray [F 
L158:   putstatic Field villagemarker/RenderShapes sphereBufDVec [[F 
L161:   iconst_0 
L162:   istore 5 

        .stack append Integer 
L164:   iload 5 
L166:   iload_2 
L167:   if_icmpge L186 
L170:   getstatic Field villagemarker/RenderShapes sphereBufDVec [[F 
L173:   iload 5 
L175:   aload_1 
L176:   iload 5 
L178:   aaload 
L179:   aastore 
L180:   iinc 5 1 
L183:   goto L164 

        .stack chop 1 
L186:   return 
L187:   
        .linenumbertable 
            L0 192 
            L19 193 
            L21 195 
            L28 197 
            L40 199 
            L47 200 
            L69 201 
            L81 203 
            L92 204 
            L103 205 
            L111 206 
            L135 201 
            L145 197 
            L154 210 
            L161 211 
            L170 212 
            L180 211 
            L186 213 
        .end linenumbertable 
    .end code 
.end method 

.method public static drawBufferedSphere : (FFFFLjava/awt/Color;F)V 
    .code stack 5 locals 11 
L0:     aload 4 
L2:     invokevirtual Method java/awt/Color getRed ()I 
L5:     i2f 
L6:     ldc +255.0f 
L8:     fdiv 
L9:     aload 4 
L11:    invokevirtual Method java/awt/Color getGreen ()I 
L14:    i2f 
L15:    ldc +255.0f 
L17:    fdiv 
L18:    aload 4 
L20:    invokevirtual Method java/awt/Color getBlue ()I 
L23:    i2f 
L24:    ldc +255.0f 
L26:    fdiv 
L27:    invokestatic Method org/lwjgl/opengl/GL11 glColor3f (FFF)V 
L30:    fload 5 
L32:    invokestatic Method org/lwjgl/opengl/GL11 glPointSize (F)V 
L35:    iconst_0 
L36:    istore 6 
L38:    iconst_0 
L39:    invokestatic Method org/lwjgl/opengl/GL11 glBegin (I)V 
L42:    getstatic Field villagemarker/RenderShapes sphereBufDVec [[F 
L45:    astore 7 
L47:    aload 7 
L49:    arraylength 
L50:    istore 8 
L52:    iconst_0 
L53:    istore 9 

        .stack full 
            locals Float Float Float Float Object java/awt/Color Float Integer Object [[F Integer Integer 
            stack 
        .end stack 
L55:    iload 9 
L57:    iload 8 
L59:    if_icmpge L102 
L62:    aload 7 
L64:    iload 9 
L66:    aaload 
L67:    astore 10 
L69:    fload_0 
L70:    aload 10 
L72:    iconst_0 
L73:    faload 
L74:    fload_3 
L75:    fmul 
L76:    fadd 
L77:    fload_1 
L78:    aload 10 
L80:    iconst_1 
L81:    faload 
L82:    fload_3 
L83:    fmul 
L84:    fadd 
L85:    fload_2 
L86:    aload 10 
L88:    iconst_2 
L89:    faload 
L90:    fload_3 
L91:    fmul 
L92:    fadd 
L93:    invokestatic Method org/lwjgl/opengl/GL11 glVertex3f (FFF)V 
L96:    iinc 9 1 
L99:    goto L55 

        .stack chop 3 
L102:   invokestatic Method org/lwjgl/opengl/GL11 glEnd ()V 
L105:   return 
L106:   
        .linenumbertable 
            L0 217 
            L30 218 
            L35 220 
            L38 221 
            L42 222 
            L69 224 
            L96 222 
            L102 226 
            L105 227 
        .end linenumbertable 
    .end code 
.end method 
.sourcefile 'RenderShapes.java' 
.end class 
