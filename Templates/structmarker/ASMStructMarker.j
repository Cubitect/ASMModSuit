.version 52 0 
.class public super structmarker/ASMStructMarker 
.super asmrender/ASMRender 
.field public static structDir Ljava/io/File; 
.field public static levelFile Ljava/io/File; 
.field public static structMap Ljava/util/HashMap; .fieldattributes 
    .signature Ljava/util/HashMap<Ljava/lang/String;Lstructmarker/ASMStructMarker$StructFType;>; 
.end fieldattributes 
.field public static levelModify J 
.field public static playerDim I 
.field public static maxRenderSqDist D 

.method public <init> : ()V 
    .code stack 1 locals 1 
L0:     aload_0 
L1:     invokespecial Method asmrender/ASMRender <init> ()V 
L4:     return 
L5:     
        .linenumbertable 
            L0 16 
        .end linenumbertable 
    .end code 
.end method 

.method public static init : (Ljava/io/File;)V 
    .code stack 4 locals 3 
L0:     new java/io/File 
L3:     dup 
L4:     new java/lang/StringBuilder 
L7:     dup 
L8:     invokespecial Method java/lang/StringBuilder <init> ()V 
L11:    aload_0 
L12:    invokevirtual Method java/io/File getAbsolutePath ()Ljava/lang/String; 
L15:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L18:    ldc '/data/' 
L20:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L23:    invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L26:    invokespecial Method java/io/File <init> (Ljava/lang/String;)V 
L29:    putstatic Field structmarker/ASMStructMarker structDir Ljava/io/File; 
L32:    new java/io/File 
L35:    dup 
L36:    new java/lang/StringBuilder 
L39:    dup 
L40:    invokespecial Method java/lang/StringBuilder <init> ()V 
L43:    aload_0 
L44:    invokevirtual Method java/io/File getAbsolutePath ()Ljava/lang/String; 
L47:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L50:    ldc '/level.dat' 
L52:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L55:    invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L58:    invokespecial Method java/io/File <init> (Ljava/lang/String;)V 
L61:    putstatic Field structmarker/ASMStructMarker levelFile Ljava/io/File; 
L64:    lconst_0 
L65:    putstatic Field structmarker/ASMStructMarker levelModify J 
L68:    iconst_0 
L69:    putstatic Field structmarker/ASMStructMarker playerDim I 
L72:    getstatic Field structmarker/ASMStructMarker structMap Ljava/util/HashMap; 
L75:    invokevirtual Method java/util/HashMap values ()Ljava/util/Collection; 
L78:    invokeinterface InterfaceMethod java/util/Collection iterator ()Ljava/util/Iterator; 1 
L83:    astore_1 

        .stack append Object java/util/Iterator 
L84:    aload_1 
L85:    invokeinterface InterfaceMethod java/util/Iterator hasNext ()Z 1 
L90:    ifeq L120 
L93:    aload_1 
L94:    invokeinterface InterfaceMethod java/util/Iterator next ()Ljava/lang/Object; 1 
L99:    checkcast structmarker/ASMStructMarker$StructFType 
L102:   astore_2 
L103:   aload_2 
L104:   getfield Field structmarker/ASMStructMarker$StructFType bbs Ljava/util/List; 
L107:   invokeinterface InterfaceMethod java/util/List clear ()V 1 
L112:   aload_2 
L113:   lconst_0 
L114:   putfield Field structmarker/ASMStructMarker$StructFType lastModify J 
L117:   goto L84 

        .stack chop 1 
L120:   return 
L121:   
        .linenumbertable 
            L0 39 
            L32 40 
            L64 42 
            L68 43 
            L72 45 
            L103 47 
            L112 48 
            L117 49 
            L120 50 
        .end linenumbertable 
    .end code 
.end method 

.method private static readInt : ([BI)I 
    .code stack 4 locals 4 
L0:     iconst_0 
L1:     istore_2 
L2:     iconst_0 
L3:     istore_3 

        .stack append Integer Integer 
L4:     iload_3 
L5:     iconst_4 
L6:     if_icmpge L40 
L9:     iload_3 
L10:    iload_1 
L11:    iadd 
L12:    aload_0 
L13:    arraylength 
L14:    if_icmpge L40 
L17:    iload_2 
L18:    bipush 8 
L20:    ishl 
L21:    istore_2 
L22:    iload_2 
L23:    aload_0 
L24:    iload_3 
L25:    iload_1 
L26:    iadd 
L27:    baload 
L28:    sipush 255 
L31:    iand 
L32:    ior 
L33:    istore_2 
L34:    iinc 3 1 
L37:    goto L4 

        .stack chop 1 
L40:    iload_2 
L41:    ireturn 
L42:    
        .linenumbertable 
            L0 54 
            L2 55 
            L17 56 
            L22 57 
            L34 55 
            L40 59 
        .end linenumbertable 
    .end code 
.end method 

.method public static readFile : (Ljava/io/File;)[B 
    .code stack 5 locals 11 
        .catch java/io/FileNotFoundException from L0 to L174 using L175 
        .catch java/io/IOException from L0 to L174 using L183 
L0:     new java/io/RandomAccessFile 
L3:     dup 
L4:     aload_0 
L5:     ldc 'r' 
L7:     invokespecial Method java/io/RandomAccessFile <init> (Ljava/io/File;Ljava/lang/String;)V 
L10:    astore_1 
L11:    aload_1 
L12:    aload_1 
L13:    invokevirtual Method java/io/RandomAccessFile length ()J 
L16:    ldc2_w 4L 
L19:    lsub 
L20:    invokevirtual Method java/io/RandomAccessFile seek (J)V 
L23:    aload_1 
L24:    invokevirtual Method java/io/RandomAccessFile read ()I 
L27:    istore_2 
L28:    aload_1 
L29:    invokevirtual Method java/io/RandomAccessFile read ()I 
L32:    istore_3 
L33:    aload_1 
L34:    invokevirtual Method java/io/RandomAccessFile read ()I 
L37:    istore 4 
L39:    aload_1 
L40:    invokevirtual Method java/io/RandomAccessFile read ()I 
L43:    istore 5 
L45:    iload 5 
L47:    bipush 24 
L49:    ishl 
L50:    iload 4 
L52:    bipush 16 
L54:    ishl 
L55:    ior 
L56:    iload_3 
L57:    bipush 8 
L59:    ishl 
L60:    ior 
L61:    iload_2 
L62:    ior 
L63:    istore 6 
L65:    aload_1 
L66:    invokevirtual Method java/io/RandomAccessFile close ()V 
L69:    iload 6 
L71:    newarray byte 
L73:    astore 7 
L75:    new java/util/zip/GZIPInputStream 
L78:    dup 
L79:    new java/io/FileInputStream 
L82:    dup 
L83:    aload_0 
L84:    invokespecial Method java/io/FileInputStream <init> (Ljava/io/File;)V 
L87:    invokespecial Method java/util/zip/GZIPInputStream <init> (Ljava/io/InputStream;)V 
L90:    astore 8 
L92:    iconst_0 
L93:    istore 9 

        .stack full 
            locals Object java/io/File Object java/io/RandomAccessFile Integer Integer Integer Integer Integer Object [B Object java/util/zip/GZIPInputStream Integer 
            stack 
        .end stack 
L95:    aload 8 
L97:    aload 7 
L99:    iload 9 
L101:   aload 7 
L103:   arraylength 
L104:   iload 9 
L106:   isub 
L107:   invokevirtual Method java/util/zip/GZIPInputStream read ([BII)I 
L110:   dup 
L111:   istore 10 
L113:   ifle L126 
L116:   iload 9 
L118:   iload 10 
L120:   iadd 
L121:   istore 9 
L123:   goto L95 

        .stack append Integer 
L126:   iload 9 
L128:   aload 7 
L130:   arraylength 
L131:   if_icmpge L167 
L134:   getstatic Field java/lang/System out Ljava/io/PrintStream; 
L137:   new java/lang/StringBuilder 
L140:   dup 
L141:   invokespecial Method java/lang/StringBuilder <init> ()V 
L144:   ldc "File: '" 
L146:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L149:   aload_0 
L150:   invokevirtual Method java/io/File getName ()Ljava/lang/String; 
L153:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L156:   ldc "' was not fully read!" 
L158:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L161:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L164:   invokevirtual Method java/io/PrintStream println (Ljava/lang/String;)V 

        .stack same 
L167:   aload 8 
L169:   invokevirtual Method java/util/zip/GZIPInputStream close ()V 
L172:   aload 7 
L174:   areturn 

        .stack full 
            locals Object java/io/File 
            stack Object java/io/FileNotFoundException 
        .end stack 
L175:   astore_2 
L176:   aload_2 
L177:   invokevirtual Method java/io/FileNotFoundException printStackTrace ()V 
L180:   goto L188 

        .stack stack_1 Object java/io/IOException 
L183:   astore_2 
L184:   aload_2 
L185:   invokevirtual Method java/io/IOException printStackTrace ()V 

        .stack same 
L188:   aconst_null 
L189:   areturn 
L190:   
        .linenumbertable 
            L0 68 
            L11 69 
            L23 70 
            L28 71 
            L33 72 
            L39 73 
            L45 74 
            L65 75 
            L69 77 
            L75 79 
            L92 81 
            L95 82 
            L116 84 
            L126 87 
            L134 89 
            L167 92 
            L172 94 
            L175 96 
            L176 97 
            L180 101 
            L183 99 
            L184 100 
            L188 103 
        .end linenumbertable 
    .end code 
.end method 

.method public static updateAll : ()V 
    .code stack 4 locals 11 
L0:     getstatic Field structmarker/ASMStructMarker levelFile Ljava/io/File; 
L3:     invokevirtual Method java/io/File exists ()Z 
L6:     ifeq L127 
L9:     getstatic Field structmarker/ASMStructMarker levelFile Ljava/io/File; 
L12:    invokevirtual Method java/io/File lastModified ()J 
L15:    getstatic Field structmarker/ASMStructMarker levelModify J 
L18:    lcmp 
L19:    ifeq L127 
L22:    getstatic Field structmarker/ASMStructMarker levelFile Ljava/io/File; 
L25:    invokevirtual Method java/io/File lastModified ()J 
L28:    putstatic Field structmarker/ASMStructMarker levelModify J 
L31:    getstatic Field structmarker/ASMStructMarker levelFile Ljava/io/File; 
L34:    invokestatic Method structmarker/ASMStructMarker readFile (Ljava/io/File;)[B 
L37:    astore_0 
L38:    ldc 'Dimension' 
L40:    invokevirtual Method java/lang/String getBytes ()[B 
L43:    astore_1 
L44:    aload_0 
L45:    ifnull L127 
L48:    iconst_0 
L49:    istore_3 

        .stack full 
            locals Object [B Object [B Top Integer 
            stack 
        .end stack 
L50:    iload_3 
L51:    aload_0 
L52:    arraylength 
L53:    aload_1 
L54:    arraylength 
L55:    isub 
L56:    iconst_4 
L57:    isub 
L58:    if_icmpge L127 
L61:    aload_0 
L62:    iload_3 
L63:    baload 
L64:    bipush 9 
L66:    if_icmpeq L72 
L69:    goto L121 

        .stack same 
L72:    iconst_0 
L73:    istore_2 

        .stack full 
            locals Object [B Object [B Integer Integer 
            stack 
        .end stack 
L74:    iload_2 
L75:    aload_1 
L76:    arraylength 
L77:    if_icmpge L101 
L80:    aload_0 
L81:    iinc 3 1 
L84:    iload_3 
L85:    baload 
L86:    aload_1 
L87:    iload_2 
L88:    baload 
L89:    if_icmpeq L95 
L92:    goto L101 

        .stack same 
L95:    iinc 2 1 
L98:    goto L74 

        .stack same 
L101:   iload_2 
L102:   aload_1 
L103:   arraylength 
L104:   if_icmplt L121 
L107:   aload_0 
L108:   iinc 3 1 
L111:   iload_3 
L112:   invokestatic Method structmarker/ASMStructMarker readInt ([BI)I 
L115:   putstatic Field structmarker/ASMStructMarker playerDim I 
L118:   goto L127 

        .stack full 
            locals Object [B Object [B Top Integer 
            stack 
        .end stack 
L121:   iinc 3 1 
L124:   goto L50 

        .stack full 
            locals 
            stack 
        .end stack 
L127:   getstatic Field structmarker/ASMStructMarker structDir Ljava/io/File; 
L130:   invokevirtual Method java/io/File listFiles ()[Ljava/io/File; 
L133:   astore_0 
L134:   aload_0 
L135:   arraylength 
L136:   istore_1 
L137:   iconst_0 
L138:   istore_2 

        .stack append Object [Ljava/io/File; Integer Integer 
L139:   iload_2 
L140:   iload_1 
L141:   if_icmpge L455 
L144:   aload_0 
L145:   iload_2 
L146:   aaload 
L147:   astore_3 
L148:   aload_3 
L149:   invokevirtual Method java/io/File isFile ()Z 
L152:   ifne L158 
L155:   goto L449 

        .stack append Object java/io/File 
L158:   aload_3 
L159:   invokevirtual Method java/io/File getName ()Ljava/lang/String; 
L162:   astore 4 
L164:   getstatic Field structmarker/ASMStructMarker structMap Ljava/util/HashMap; 
L167:   aload 4 
L169:   invokevirtual Method java/util/HashMap get (Ljava/lang/Object;)Ljava/lang/Object; 
L172:   checkcast structmarker/ASMStructMarker$StructFType 
L175:   astore 5 
L177:   aload 5 
L179:   ifnonnull L206 
L182:   new structmarker/ASMStructMarker$StructFType 
L185:   dup 
L186:   iconst_0 
L187:   getstatic Field java/awt/Color LIGHT_GRAY Ljava/awt/Color; 
L190:   invokespecial Method structmarker/ASMStructMarker$StructFType <init> (ILjava/awt/Color;)V 
L193:   astore 5 
L195:   getstatic Field structmarker/ASMStructMarker structMap Ljava/util/HashMap; 
L198:   aload 4 
L200:   aload 5 
L202:   invokevirtual Method java/util/HashMap put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; 
L205:   pop 

        .stack append Object java/lang/String Object structmarker/ASMStructMarker$StructFType 
L206:   aload 5 
L208:   getfield Field structmarker/ASMStructMarker$StructFType lastModify J 
L211:   aload_3 
L212:   invokevirtual Method java/io/File lastModified ()J 
L215:   lcmp 
L216:   ifne L222 
L219:   goto L449 

        .stack same 
L222:   aload 5 
L224:   aload_3 
L225:   invokevirtual Method java/io/File lastModified ()J 
L228:   putfield Field structmarker/ASMStructMarker$StructFType lastModify J 
L231:   aload 5 
L233:   getfield Field structmarker/ASMStructMarker$StructFType bbs Ljava/util/List; 
L236:   invokeinterface InterfaceMethod java/util/List clear ()V 1 
L241:   aload_3 
L242:   invokestatic Method structmarker/ASMStructMarker readFile (Ljava/io/File;)[B 
L245:   astore 6 
L247:   ldc '\x02BB' 
L249:   invokevirtual Method java/lang/String getBytes ()[B 
L252:   astore 7 
L254:   aload 6 
L256:   ifnonnull L262 
L259:   goto L449 

        .stack append Object [B Object [B 
L262:   iconst_0 
L263:   istore 9 

        .stack append Top Integer 
L265:   iload 9 
L267:   aload 6 
L269:   arraylength 
L270:   bipush 28 
L272:   isub 
L273:   if_icmpge L449 
L276:   aload 6 
L278:   iload 9 
L280:   iinc 9 1 
L283:   baload 
L284:   ifeq L290 
L287:   goto L265 

        .stack same 
L290:   iconst_0 
L291:   istore 8 

        .stack full 
            locals Object [Ljava/io/File; Integer Integer Object java/io/File Object java/lang/String Object structmarker/ASMStructMarker$StructFType Object [B Object [B Integer Integer 
            stack 
        .end stack 
L293:   iload 8 
L295:   aload 7 
L297:   arraylength 
L298:   if_icmpge L326 
L301:   aload 6 
L303:   iload 9 
L305:   baload 
L306:   aload 7 
L308:   iload 8 
L310:   baload 
L311:   if_icmpeq L317 
L314:   goto L326 

        .stack same 
L317:   iinc 8 1 
L320:   iinc 9 1 
L323:   goto L293 

        .stack same 
L326:   iload 8 
L328:   aload 7 
L330:   arraylength 
L331:   if_icmplt L265 
L334:   new structmarker/ASMStructMarker$BB 
L337:   dup 
L338:   invokespecial Method structmarker/ASMStructMarker$BB <init> ()V 
L341:   astore 10 
L343:   aload 10 
L345:   aload 6 
L347:   iinc 9 4 
L350:   iload 9 
L352:   invokestatic Method structmarker/ASMStructMarker readInt ([BI)I 
L355:   putfield Field structmarker/ASMStructMarker$BB x1 I 
L358:   aload 10 
L360:   aload 6 
L362:   iinc 9 4 
L365:   iload 9 
L367:   invokestatic Method structmarker/ASMStructMarker readInt ([BI)I 
L370:   putfield Field structmarker/ASMStructMarker$BB y1 I 
L373:   aload 10 
L375:   aload 6 
L377:   iinc 9 4 
L380:   iload 9 
L382:   invokestatic Method structmarker/ASMStructMarker readInt ([BI)I 
L385:   putfield Field structmarker/ASMStructMarker$BB z1 I 
L388:   aload 10 
L390:   aload 6 
L392:   iinc 9 4 
L395:   iload 9 
L397:   invokestatic Method structmarker/ASMStructMarker readInt ([BI)I 
L400:   putfield Field structmarker/ASMStructMarker$BB x2 I 
L403:   aload 10 
L405:   aload 6 
L407:   iinc 9 4 
L410:   iload 9 
L412:   invokestatic Method structmarker/ASMStructMarker readInt ([BI)I 
L415:   putfield Field structmarker/ASMStructMarker$BB y2 I 
L418:   aload 10 
L420:   aload 6 
L422:   iinc 9 4 
L425:   iload 9 
L427:   invokestatic Method structmarker/ASMStructMarker readInt ([BI)I 
L430:   putfield Field structmarker/ASMStructMarker$BB z2 I 
L433:   aload 5 
L435:   getfield Field structmarker/ASMStructMarker$StructFType bbs Ljava/util/List; 
L438:   aload 10 
L440:   invokeinterface InterfaceMethod java/util/List add (Ljava/lang/Object;)Z 2 
L445:   pop 
L446:   goto L265 

        .stack full 
            locals Object [Ljava/io/File; Integer Integer 
            stack 
        .end stack 
L449:   iinc 2 1 
L452:   goto L139 

        .stack chop 3 
L455:   return 
L456:   
        .linenumbertable 
            L0 109 
            L22 111 
            L31 112 
            L38 113 
            L44 115 
            L48 116 
            L61 117 
            L69 118 
            L72 119 
            L80 120 
            L92 121 
            L95 119 
            L101 123 
            L107 124 
            L118 125 
            L121 116 
            L127 131 
            L148 133 
            L155 134 
            L158 136 
            L164 137 
            L177 139 
            L182 141 
            L195 142 
            L206 145 
            L219 146 
            L222 148 
            L231 149 
            L241 152 
            L247 153 
            L254 155 
            L259 156 
            L262 158 
            L276 159 
            L287 160 
            L290 161 
            L301 162 
            L314 163 
            L317 161 
            L326 165 
            L334 166 
            L343 167 
            L358 168 
            L373 169 
            L388 170 
            L403 171 
            L418 172 
            L433 174 
            L446 175 
            L449 131 
            L455 178 
        .end linenumbertable 
    .end code 
.end method 

.method public static render : (DDD)V 
    .code stack 8 locals 16 
        .catch java/lang/Exception from L0 to L248 using L251 
L0:     iconst_1 
L1:     invokestatic Method structmarker/ASMStructMarker setup (Z)V 
L4:     dload_0 
L5:     d2f 
L6:     dload_2 
L7:     d2f 
L8:     dload 4 
L10:    d2f 
L11:    invokestatic Method structmarker/ASMStructMarker translate (FFF)V 
L14:    getstatic Field structmarker/ASMStructMarker structMap Ljava/util/HashMap; 
L17:    invokevirtual Method java/util/HashMap values ()Ljava/util/Collection; 
L20:    invokeinterface InterfaceMethod java/util/Collection iterator ()Ljava/util/Iterator; 1 
L25:    astore 6 

        .stack append Object java/util/Iterator 
L27:    aload 6 
L29:    invokeinterface InterfaceMethod java/util/Iterator hasNext ()Z 1 
L34:    ifeq L245 
L37:    aload 6 
L39:    invokeinterface InterfaceMethod java/util/Iterator next ()Ljava/lang/Object; 1 
L44:    checkcast structmarker/ASMStructMarker$StructFType 
L47:    astore 7 
L49:    aload 7 
L51:    getfield Field structmarker/ASMStructMarker$StructFType dim I 
L54:    getstatic Field structmarker/ASMStructMarker playerDim I 
L57:    if_icmpeq L63 
L60:    goto L27 

        .stack append Object structmarker/ASMStructMarker$StructFType 
L63:    new java/util/ArrayList 
L66:    dup 
L67:    aload 7 
L69:    getfield Field structmarker/ASMStructMarker$StructFType bbs Ljava/util/List; 
L72:    invokespecial Method java/util/ArrayList <init> (Ljava/util/Collection;)V 
L75:    astore 8 
L77:    aload 8 
L79:    invokeinterface InterfaceMethod java/util/List iterator ()Ljava/util/Iterator; 1 
L84:    astore 9 

        .stack append Object java/util/List Object java/util/Iterator 
L86:    aload 9 
L88:    invokeinterface InterfaceMethod java/util/Iterator hasNext ()Z 1 
L93:    ifeq L242 
L96:    aload 9 
L98:    invokeinterface InterfaceMethod java/util/Iterator next ()Ljava/lang/Object; 1 
L103:   checkcast structmarker/ASMStructMarker$BB 
L106:   astore 10 
L108:   ldc2_w +0.5 
L111:   aload 10 
L113:   getfield Field structmarker/ASMStructMarker$BB x1 I 
L116:   aload 10 
L118:   getfield Field structmarker/ASMStructMarker$BB x2 I 
L121:   iadd 
L122:   i2d 
L123:   dmul 
L124:   dload_0 
L125:   dsub 
L126:   dstore 11 
L128:   ldc2_w +0.5 
L131:   aload 10 
L133:   getfield Field structmarker/ASMStructMarker$BB y1 I 
L136:   aload 10 
L138:   getfield Field structmarker/ASMStructMarker$BB y2 I 
L141:   iadd 
L142:   i2d 
L143:   dmul 
L144:   dload_2 
L145:   dsub 
L146:   dstore 13 
L148:   dload 11 
L150:   dload 11 
L152:   dmul 
L153:   dload 13 
L155:   dload 13 
L157:   dmul 
L158:   dadd 
L159:   getstatic Field structmarker/ASMStructMarker maxRenderSqDist D 
L162:   dcmpl 
L163:   ifle L169 
L166:   goto L86 

        .stack append Object structmarker/ASMStructMarker$BB Double Double 
L169:   aload 10 
L171:   getfield Field structmarker/ASMStructMarker$BB x1 I 
L174:   i2f 
L175:   ldc +0.004999999888241291f 
L177:   fsub 
L178:   aload 10 
L180:   getfield Field structmarker/ASMStructMarker$BB y1 I 
L183:   i2f 
L184:   ldc +0.004999999888241291f 
L186:   fsub 
L187:   aload 10 
L189:   getfield Field structmarker/ASMStructMarker$BB z1 I 
L192:   i2f 
L193:   ldc +0.004999999888241291f 
L195:   fsub 
L196:   aload 10 
L198:   getfield Field structmarker/ASMStructMarker$BB x2 I 
L201:   iconst_1 
L202:   iadd 
L203:   i2f 
L204:   ldc +0.004999999888241291f 
L206:   fadd 
L207:   aload 10 
L209:   getfield Field structmarker/ASMStructMarker$BB y2 I 
L212:   iconst_1 
L213:   iadd 
L214:   i2f 
L215:   ldc +0.004999999888241291f 
L217:   fadd 
L218:   aload 10 
L220:   getfield Field structmarker/ASMStructMarker$BB z2 I 
L223:   iconst_1 
L224:   iadd 
L225:   i2f 
L226:   ldc +0.004999999888241291f 
L228:   fadd 
L229:   aload 7 
L231:   getfield Field structmarker/ASMStructMarker$StructFType col Ljava/awt/Color; 
L234:   ldc +0.0024999999441206455f 
L236:   invokestatic Method structmarker/ASMStructMarker drawBox (FFFFFFLjava/awt/Color;F)V 
L239:   goto L86 

        .stack full 
            locals Double Double Double Object java/util/Iterator 
            stack 
        .end stack 
L242:   goto L27 

        .stack chop 1 
L245:   invokestatic Method asmrender/ASMRender restore ()V 
L248:   goto L258 

        .stack stack_1 Object java/lang/Exception 
L251:   astore 6 
L253:   aload 6 
L255:   invokevirtual Method java/lang/Exception printStackTrace ()V 

        .stack same 
L258:   return 
L259:   
        .linenumbertable 
            L0 187 
            L4 188 
            L14 190 
            L49 192 
            L60 193 
            L63 195 
            L77 197 
            L108 199 
            L128 200 
            L148 201 
            L166 202 
            L169 205 
            L239 206 
            L242 207 
            L245 209 
            L248 214 
            L251 211 
            L253 213 
            L258 215 
        .end linenumbertable 
    .end code 
.end method 

.method static <clinit> : ()V 
    .code stack 6 locals 0 
L0:     new java/util/HashMap 
L3:     dup 
L4:     invokespecial Method java/util/HashMap <init> ()V 
L7:     putstatic Field structmarker/ASMStructMarker structMap Ljava/util/HashMap; 
L10:    ldc2_w +262144.0 
L13:    putstatic Field structmarker/ASMStructMarker maxRenderSqDist D 
L16:    getstatic Field structmarker/ASMStructMarker structMap Ljava/util/HashMap; 
L19:    ldc 'EndCity.dat' 
L21:    new structmarker/ASMStructMarker$StructFType 
L24:    dup 
L25:    iconst_1 
L26:    getstatic Field java/awt/Color MAGENTA Ljava/awt/Color; 
L29:    invokespecial Method structmarker/ASMStructMarker$StructFType <init> (ILjava/awt/Color;)V 
L32:    invokevirtual Method java/util/HashMap put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; 
L35:    pop 
L36:    getstatic Field structmarker/ASMStructMarker structMap Ljava/util/HashMap; 
L39:    ldc 'Fortress.dat' 
L41:    new structmarker/ASMStructMarker$StructFType 
L44:    dup 
L45:    iconst_m1 
L46:    getstatic Field java/awt/Color RED Ljava/awt/Color; 
L49:    invokespecial Method structmarker/ASMStructMarker$StructFType <init> (ILjava/awt/Color;)V 
L52:    invokevirtual Method java/util/HashMap put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; 
L55:    pop 
L56:    getstatic Field structmarker/ASMStructMarker structMap Ljava/util/HashMap; 
L59:    ldc 'Mineshaft.dat' 
L61:    new structmarker/ASMStructMarker$StructFType 
L64:    dup 
L65:    iconst_0 
L66:    getstatic Field java/awt/Color GREEN Ljava/awt/Color; 
L69:    invokespecial Method structmarker/ASMStructMarker$StructFType <init> (ILjava/awt/Color;)V 
L72:    invokevirtual Method java/util/HashMap put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; 
L75:    pop 
L76:    getstatic Field structmarker/ASMStructMarker structMap Ljava/util/HashMap; 
L79:    ldc 'Monument.dat' 
L81:    new structmarker/ASMStructMarker$StructFType 
L84:    dup 
L85:    iconst_0 
L86:    getstatic Field java/awt/Color BLUE Ljava/awt/Color; 
L89:    invokespecial Method structmarker/ASMStructMarker$StructFType <init> (ILjava/awt/Color;)V 
L92:    invokevirtual Method java/util/HashMap put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; 
L95:    pop 
L96:    getstatic Field structmarker/ASMStructMarker structMap Ljava/util/HashMap; 
L99:    ldc 'Stronghold.dat' 
L101:   new structmarker/ASMStructMarker$StructFType 
L104:   dup 
L105:   iconst_0 
L106:   getstatic Field java/awt/Color GRAY Ljava/awt/Color; 
L109:   invokespecial Method structmarker/ASMStructMarker$StructFType <init> (ILjava/awt/Color;)V 
L112:   invokevirtual Method java/util/HashMap put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; 
L115:   pop 
L116:   getstatic Field structmarker/ASMStructMarker structMap Ljava/util/HashMap; 
L119:   ldc 'Temple.dat' 
L121:   new structmarker/ASMStructMarker$StructFType 
L124:   dup 
L125:   iconst_0 
L126:   getstatic Field java/awt/Color CYAN Ljava/awt/Color; 
L129:   invokespecial Method structmarker/ASMStructMarker$StructFType <init> (ILjava/awt/Color;)V 
L132:   invokevirtual Method java/util/HashMap put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; 
L135:   pop 
L136:   getstatic Field structmarker/ASMStructMarker structMap Ljava/util/HashMap; 
L139:   ldc 'Village.dat' 
L141:   new structmarker/ASMStructMarker$StructFType 
L144:   dup 
L145:   iconst_0 
L146:   getstatic Field java/awt/Color YELLOW Ljava/awt/Color; 
L149:   invokespecial Method structmarker/ASMStructMarker$StructFType <init> (ILjava/awt/Color;)V 
L152:   invokevirtual Method java/util/HashMap put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; 
L155:   pop 
L156:   return 
L157:   
        .linenumbertable 
            L0 20 
            L10 24 
            L16 28 
            L36 29 
            L56 30 
            L76 31 
            L96 32 
            L116 33 
            L136 34 
            L156 35 
        .end linenumbertable 
    .end code 
.end method 
.sourcefile 'ASMStructMarker.java' 
.innerclasses 
    structmarker/ASMStructMarker$BB structmarker/ASMStructMarker BB public static 
    structmarker/ASMStructMarker$StructFType structmarker/ASMStructMarker StructFType public static 
.end innerclasses 
.end class 
