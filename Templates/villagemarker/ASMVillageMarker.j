.version 52 0 
.class public super villagemarker/ASMVillageMarker 
.super asmrender/ASMRender 
.field public static final author Ljava/lang/String; = 'Cubitect' 
.field public static final name Ljava/lang/String; = 'ASMVillageMarker' 
.field public static final configFile Ljava/io/File; 
.field public static doDepthCheck Z 
.field public static drawSphere Z 
.field public static drawDoorLines Z 
.field public static drawBoxEdge Z 
.field public static drawBoxWalls Z 
.field public static sphereSegments I 
.field public static doorLineWidth F 
.field public static sphereDotSize F 
.field public static boxEdgeWidth F 
.field public static boxEdgeExpansion F 
.field public static boxWallExpansion F 
.field public static wallAlpha F 
.field public static cols [Ljava/awt/Color; 
.field public static final INSTANCE Lvillagemarker/ASMVillageMarker; 

.method public static render : (DDD)V 
    .code stack 4 locals 6 
L0:     getstatic Field villagemarker/ASMVillageMarker minecraft Lnet/minecraft/client/Minecraft; 
L3:     invokevirtual Method net/minecraft/client/Minecraft isSingleplayer ()Z 
L6:     ifeq L31 
L9:     getstatic Field villagemarker/ASMVillageMarker doDepthCheck Z 
L12:    invokestatic Method villagemarker/ASMVillageMarker setup (Z)V 
L15:    dload_0 
L16:    d2f 
L17:    dload_2 
L18:    d2f 
L19:    dload 4 
L21:    d2f 
L22:    invokestatic Method villagemarker/ASMVillageMarker translate (FFF)V 
L25:    invokestatic Method villagemarker/ASMVillageMarker render ()V 
L28:    invokestatic Method asmrender/ASMRender restore ()V 

        .stack same 
L31:    return 
L32:    
        .linenumbertable 
            L0 41 
            L9 43 
            L15 44 
            L25 45 
            L28 46 
            L31 48 
        .end linenumbertable 
    .end code 
.end method 

.method public static render : ()V 
    .code stack 8 locals 14 
L0:     new java/util/ArrayList 
L3:     dup 
L4:     invokespecial Method java/util/ArrayList <init> ()V 
L7:     astore_0 
L8:     aload_0 
L9:     getstatic Field villagemarker/ASMVillageMarker minecraft Lnet/minecraft/client/Minecraft; 
L12:    invokevirtual Method net/minecraft/client/Minecraft getIntegratedServer ()Lnet/minecraft/server/integrated/IntegratedServer; 
L15:    getstatic Field villagemarker/ASMVillageMarker minecraft Lnet/minecraft/client/Minecraft; 
L18:    getfield Field net/minecraft/client/Minecraft thePlayer Lnet/minecraft/client/entity/EntityPlayerSP; 
L21:    getfield Field net/minecraft/client/entity/EntityPlayerSP dimension I 
L24:    invokevirtual Method net/minecraft/server/integrated/IntegratedServer worldServerForDimension (I)Lnet/minecraft/world/WorldServer; 
L27:    invokevirtual Method net/minecraft/world/WorldServer getVillageCollection ()Lnet/minecraft/village/VillageCollection; 
L30:    invokevirtual Method net/minecraft/village/VillageCollection getVillageList ()Ljava/util/List; 
L33:    invokevirtual Method java/util/ArrayList addAll (Ljava/util/Collection;)Z 
L36:    pop 
L37:    iconst_0 
L38:    istore_1 
L39:    aload_0 
L40:    invokevirtual Method java/util/ArrayList iterator ()Ljava/util/Iterator; 
L43:    astore_2 

        .stack append Object java/util/ArrayList Integer Object java/util/Iterator 
L44:    aload_2 
L45:    invokeinterface InterfaceMethod java/util/Iterator hasNext ()Z 1 
L50:    ifeq L372 
L53:    aload_2 
L54:    invokeinterface InterfaceMethod java/util/Iterator next ()Ljava/lang/Object; 1 
L59:    checkcast net/minecraft/village/Village 
L62:    astore_3 
L63:    aload_3 
L64:    invokevirtual Method net/minecraft/village/Village getCenter ()Lnet/minecraft/util/math/BlockPos; 
L67:    astore 4 
L69:    aload 4 
L71:    invokevirtual Method net/minecraft/util/math/BlockPos getX ()I 
L74:    i2f 
L75:    fstore 5 
L77:    aload 4 
L79:    invokevirtual Method net/minecraft/util/math/BlockPos getY ()I 
L82:    i2f 
L83:    fstore 6 
L85:    aload 4 
L87:    invokevirtual Method net/minecraft/util/math/BlockPos getZ ()I 
L90:    i2f 
L91:    fstore 7 
L93:    aload_3 
L94:    invokevirtual Method net/minecraft/village/Village getVillageRadius ()I 
L97:    i2f 
L98:    fstore 8 
L100:   new java/util/ArrayList 
L103:   dup 
L104:   invokespecial Method java/util/ArrayList <init> ()V 
L107:   astore 9 
L109:   aload 9 
L111:   aload_3 
L112:   invokevirtual Method net/minecraft/village/Village getVillageDoorInfoList ()Ljava/util/List; 
L115:   invokevirtual Method java/util/ArrayList addAll (Ljava/util/Collection;)Z 
L118:   pop 
L119:   getstatic Field villagemarker/ASMVillageMarker cols [Ljava/awt/Color; 
L122:   iload_1 
L123:   iinc 1 1 
L126:   getstatic Field villagemarker/ASMVillageMarker cols [Ljava/awt/Color; 
L129:   arraylength 
L130:   irem 
L131:   aaload 
L132:   astore 10 
L134:   getstatic Field villagemarker/ASMVillageMarker drawSphere Z 
L137:   ifeq L156 
L140:   fload 5 
L142:   fload 6 
L144:   fload 7 
L146:   fload 8 
L148:   aload 10 
L150:   getstatic Field villagemarker/ASMVillageMarker sphereDotSize F 
L153:   invokestatic Method asmrender/ASMRender drawBufferedSphere (FFFFLjava/awt/Color;F)V 

        .stack full 
            locals Object java/util/ArrayList Integer Object java/util/Iterator Object net/minecraft/village/Village Object net/minecraft/util/math/BlockPos Float Float Float Float Object java/util/ArrayList Object java/awt/Color 
            stack 
        .end stack 
L156:   getstatic Field villagemarker/ASMVillageMarker drawDoorLines Z 
L159:   ifeq L233 
L162:   aload 9 
L164:   invokevirtual Method java/util/ArrayList iterator ()Ljava/util/Iterator; 
L167:   astore 11 

        .stack append Object java/util/Iterator 
L169:   aload 11 
L171:   invokeinterface InterfaceMethod java/util/Iterator hasNext ()Z 1 
L176:   ifeq L233 
L179:   aload 11 
L181:   invokeinterface InterfaceMethod java/util/Iterator next ()Ljava/lang/Object; 1 
L186:   checkcast net/minecraft/village/VillageDoorInfo 
L189:   astore 12 
L191:   aload 12 
L193:   invokevirtual Method net/minecraft/village/VillageDoorInfo getDoorBlockPos ()Lnet/minecraft/util/math/BlockPos; 
L196:   astore 13 
L198:   fload 5 
L200:   fload 6 
L202:   fload 7 
L204:   aload 13 
L206:   invokevirtual Method net/minecraft/util/math/BlockPos getX ()I 
L209:   i2f 
L210:   aload 13 
L212:   invokevirtual Method net/minecraft/util/math/BlockPos getY ()I 
L215:   i2f 
L216:   aload 13 
L218:   invokevirtual Method net/minecraft/util/math/BlockPos getZ ()I 
L221:   i2f 
L222:   aload 10 
L224:   getstatic Field villagemarker/ASMVillageMarker doorLineWidth F 
L227:   invokestatic Method asmrender/ASMRender drawLine (FFFFFFLjava/awt/Color;F)V 
L230:   goto L169 

        .stack chop 1 
L233:   getstatic Field villagemarker/ASMVillageMarker drawBoxEdge Z 
L236:   ifeq L301 
L239:   fload 5 
L241:   ldc +8.0f 
L243:   getstatic Field villagemarker/ASMVillageMarker boxEdgeExpansion F 
L246:   fadd 
L247:   fsub 
L248:   fload 6 
L250:   ldc +3.0f 
L252:   getstatic Field villagemarker/ASMVillageMarker boxEdgeExpansion F 
L255:   fadd 
L256:   fsub 
L257:   fload 7 
L259:   ldc +8.0f 
L261:   getstatic Field villagemarker/ASMVillageMarker boxEdgeExpansion F 
L264:   fadd 
L265:   fsub 
L266:   fload 5 
L268:   ldc +8.0f 
L270:   getstatic Field villagemarker/ASMVillageMarker boxEdgeExpansion F 
L273:   fadd 
L274:   fadd 
L275:   fload 6 
L277:   ldc +3.0f 
L279:   getstatic Field villagemarker/ASMVillageMarker boxEdgeExpansion F 
L282:   fadd 
L283:   fadd 
L284:   fload 7 
L286:   ldc +8.0f 
L288:   getstatic Field villagemarker/ASMVillageMarker boxEdgeExpansion F 
L291:   fadd 
L292:   fadd 
L293:   aload 10 
L295:   getstatic Field villagemarker/ASMVillageMarker boxEdgeWidth F 
L298:   invokestatic Method asmrender/ASMRender drawBox (FFFFFFLjava/awt/Color;F)V 

        .stack same_extended 
L301:   getstatic Field villagemarker/ASMVillageMarker drawBoxWalls Z 
L304:   ifeq L369 
L307:   fload 5 
L309:   ldc +8.0f 
L311:   getstatic Field villagemarker/ASMVillageMarker boxWallExpansion F 
L314:   fadd 
L315:   fsub 
L316:   fload 6 
L318:   ldc +3.0f 
L320:   getstatic Field villagemarker/ASMVillageMarker boxWallExpansion F 
L323:   fadd 
L324:   fsub 
L325:   fload 7 
L327:   ldc +8.0f 
L329:   getstatic Field villagemarker/ASMVillageMarker boxWallExpansion F 
L332:   fadd 
L333:   fsub 
L334:   fload 5 
L336:   ldc +8.0f 
L338:   getstatic Field villagemarker/ASMVillageMarker boxWallExpansion F 
L341:   fadd 
L342:   fadd 
L343:   fload 6 
L345:   ldc +3.0f 
L347:   getstatic Field villagemarker/ASMVillageMarker boxWallExpansion F 
L350:   fadd 
L351:   fadd 
L352:   fload 7 
L354:   ldc +8.0f 
L356:   getstatic Field villagemarker/ASMVillageMarker boxWallExpansion F 
L359:   fadd 
L360:   fadd 
L361:   aload 10 
L363:   getstatic Field villagemarker/ASMVillageMarker wallAlpha F 
L366:   invokestatic Method asmrender/ASMRender drawBoxWalls (FFFFFFLjava/awt/Color;F)V 

        .stack full 
            locals Object java/util/ArrayList Integer Object java/util/Iterator 
            stack 
        .end stack 
L369:   goto L44 

        .stack chop 1 
L372:   return 
L373:   
        .linenumbertable 
            L0 52 
            L8 53 
            L12 55 
            L24 56 
            L27 57 
            L30 58 
            L33 53 
            L37 60 
            L39 61 
            L63 63 
            L69 64 
            L77 65 
            L85 66 
            L93 67 
            L100 68 
            L109 69 
            L119 71 
            L134 73 
            L140 74 
            L156 78 
            L162 79 
            L191 81 
            L198 82 
            L206 84 
            L227 82 
            L230 86 
            L233 88 
            L239 89 
            L301 94 
            L307 95 
            L369 99 
            L372 100 
        .end linenumbertable 
    .end code 
.end method 

.method public static log : (Ljava/lang/String;)V 
    .code stack 3 locals 2 
L0:     new java/text/SimpleDateFormat 
L3:     dup 
L4:     ldc 'HH:mm:ss' 
L6:     invokespecial Method java/text/SimpleDateFormat <init> (Ljava/lang/String;)V 
L9:     new java/util/Date 
L12:    dup 
L13:    invokespecial Method java/util/Date <init> ()V 
L16:    invokevirtual Method java/text/SimpleDateFormat format (Ljava/util/Date;)Ljava/lang/String; 
L19:    astore_1 
L20:    getstatic Field java/lang/System out Ljava/io/PrintStream; 
L23:    new java/lang/StringBuilder 
L26:    dup 
L27:    invokespecial Method java/lang/StringBuilder <init> ()V 
L30:    ldc '[' 
L32:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L35:    aload_1 
L36:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L39:    ldc '] [' 
L41:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L44:    ldc 'ASMVillageMarker' 
L46:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L49:    ldc '] ' 
L51:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L54:    aload_0 
L55:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L58:    invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L61:    invokevirtual Method java/io/PrintStream println (Ljava/lang/String;)V 
L64:    return 
L65:    
        .linenumbertable 
            L0 105 
            L20 106 
            L64 107 
        .end linenumbertable 
    .end code 
.end method 

.method public <init> : ()V 
    .code stack 1 locals 1 
L0:     aload_0 
L1:     invokespecial Method asmrender/ASMRender <init> ()V 
L4:     invokestatic Method villagemarker/ASMVillageMarker init ()V 
L7:     return 
L8:     
        .linenumbertable 
            L0 110 
            L4 111 
            L7 112 
        .end linenumbertable 
    .end code 
.end method 

.method public static init : ()V 
    .code stack 1 locals 0 
L0:     getstatic Field villagemarker/ASMVillageMarker configFile Ljava/io/File; 
L3:     invokevirtual Method java/io/File exists ()Z 
L6:     ifne L15 
L9:     invokestatic Method villagemarker/ASMVillageMarker writeOptions ()V 
L12:    goto L18 

        .stack same 
L15:    invokestatic Method villagemarker/ASMVillageMarker readOptions ()V 

        .stack same 
L18:    getstatic Field villagemarker/ASMVillageMarker sphereSegments I 
L21:    invokestatic Method asmrender/ASMRender updateSphereBuf (I)V 
L24:    return 
L25:    
        .linenumbertable 
            L0 116 
            L9 117 
            L15 119 
            L18 121 
            L24 122 
        .end linenumbertable 
    .end code 
.end method 

.method private static col2hex : (Ljava/awt/Color;)Ljava/lang/String; 
    .code stack 3 locals 1 
L0:     new java/lang/StringBuilder 
L3:     dup 
L4:     invokespecial Method java/lang/StringBuilder <init> ()V 
L7:     bipush 35 
L9:     invokevirtual Method java/lang/StringBuilder append (C)Ljava/lang/StringBuilder; 
L12:    aload_0 
L13:    invokevirtual Method java/awt/Color getRGB ()I 
L16:    ldc 16777215 
L18:    iand 
L19:    ldc 16777216 
L21:    ior 
L22:    invokestatic Method java/lang/Integer toHexString (I)Ljava/lang/String; 
L25:    iconst_1 
L26:    invokevirtual Method java/lang/String substring (I)Ljava/lang/String; 
L29:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L32:    invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L35:    areturn 
L36:    
        .linenumbertable 
            L0 126 
        .end linenumbertable 
    .end code 
.end method 

.method private static hex2col : (Ljava/lang/String;)Ljava/awt/Color; 
    .code stack 2 locals 1 
L0:     aload_0 
L1:     ldc '0x' 
L3:     invokevirtual Method java/lang/String startsWith (Ljava/lang/String;)Z 
L6:     ifeq L15 
L9:     aload_0 
L10:    iconst_2 
L11:    invokevirtual Method java/lang/String substring (I)Ljava/lang/String; 
L14:    astore_0 

        .stack same 
L15:    aload_0 
L16:    ldc '#' 
L18:    invokevirtual Method java/lang/String startsWith (Ljava/lang/String;)Z 
L21:    ifne L44 
L24:    new java/lang/StringBuilder 
L27:    dup 
L28:    invokespecial Method java/lang/StringBuilder <init> ()V 
L31:    ldc '#' 
L33:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L36:    aload_0 
L37:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L40:    invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L43:    astore_0 

        .stack same 
L44:    aload_0 
L45:    invokestatic Method java/awt/Color decode (Ljava/lang/String;)Ljava/awt/Color; 
L48:    areturn 
L49:    
        .linenumbertable 
            L0 131 
            L9 132 
            L15 133 
            L24 134 
            L44 135 
        .end linenumbertable 
    .end code 
.end method 

.method public static writeOptions : ()V 
    .code stack 5 locals 2 
        .catch java/lang/Exception from L0 to L404 using L407 
L0:     new java/io/PrintWriter 
L3:     dup 
L4:     new java/io/FileWriter 
L7:     dup 
L8:     getstatic Field villagemarker/ASMVillageMarker configFile Ljava/io/File; 
L11:    invokespecial Method java/io/FileWriter <init> (Ljava/io/File;)V 
L14:    invokespecial Method java/io/PrintWriter <init> (Ljava/io/Writer;)V 
L17:    astore_0 
L18:    aload_0 
L19:    new java/lang/StringBuilder 
L22:    dup 
L23:    invokespecial Method java/lang/StringBuilder <init> ()V 
L26:    ldc 'doDepthCheck=' 
L28:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L31:    getstatic Field villagemarker/ASMVillageMarker doDepthCheck Z 
L34:    invokevirtual Method java/lang/StringBuilder append (Z)Ljava/lang/StringBuilder; 
L37:    invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L40:    invokevirtual Method java/io/PrintWriter println (Ljava/lang/String;)V 
L43:    aload_0 
L44:    new java/lang/StringBuilder 
L47:    dup 
L48:    invokespecial Method java/lang/StringBuilder <init> ()V 
L51:    ldc 'drawSphere=' 
L53:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L56:    getstatic Field villagemarker/ASMVillageMarker drawSphere Z 
L59:    invokevirtual Method java/lang/StringBuilder append (Z)Ljava/lang/StringBuilder; 
L62:    invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L65:    invokevirtual Method java/io/PrintWriter println (Ljava/lang/String;)V 
L68:    aload_0 
L69:    new java/lang/StringBuilder 
L72:    dup 
L73:    invokespecial Method java/lang/StringBuilder <init> ()V 
L76:    ldc 'drawDoorLines=' 
L78:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L81:    getstatic Field villagemarker/ASMVillageMarker drawDoorLines Z 
L84:    invokevirtual Method java/lang/StringBuilder append (Z)Ljava/lang/StringBuilder; 
L87:    invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L90:    invokevirtual Method java/io/PrintWriter println (Ljava/lang/String;)V 
L93:    aload_0 
L94:    new java/lang/StringBuilder 
L97:    dup 
L98:    invokespecial Method java/lang/StringBuilder <init> ()V 
L101:   ldc 'drawBoxEdge=' 
L103:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L106:   getstatic Field villagemarker/ASMVillageMarker drawBoxEdge Z 
L109:   invokevirtual Method java/lang/StringBuilder append (Z)Ljava/lang/StringBuilder; 
L112:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L115:   invokevirtual Method java/io/PrintWriter println (Ljava/lang/String;)V 
L118:   aload_0 
L119:   new java/lang/StringBuilder 
L122:   dup 
L123:   invokespecial Method java/lang/StringBuilder <init> ()V 
L126:   ldc 'drawBoxWalls=' 
L128:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L131:   getstatic Field villagemarker/ASMVillageMarker drawBoxWalls Z 
L134:   invokevirtual Method java/lang/StringBuilder append (Z)Ljava/lang/StringBuilder; 
L137:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L140:   invokevirtual Method java/io/PrintWriter println (Ljava/lang/String;)V 
L143:   aload_0 
L144:   new java/lang/StringBuilder 
L147:   dup 
L148:   invokespecial Method java/lang/StringBuilder <init> ()V 
L151:   ldc 'sphereSegments=' 
L153:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L156:   getstatic Field villagemarker/ASMVillageMarker sphereSegments I 
L159:   invokevirtual Method java/lang/StringBuilder append (I)Ljava/lang/StringBuilder; 
L162:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L165:   invokevirtual Method java/io/PrintWriter println (Ljava/lang/String;)V 
L168:   aload_0 
L169:   new java/lang/StringBuilder 
L172:   dup 
L173:   invokespecial Method java/lang/StringBuilder <init> ()V 
L176:   ldc 'doorLineWidth=' 
L178:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L181:   getstatic Field villagemarker/ASMVillageMarker doorLineWidth F 
L184:   invokevirtual Method java/lang/StringBuilder append (F)Ljava/lang/StringBuilder; 
L187:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L190:   invokevirtual Method java/io/PrintWriter println (Ljava/lang/String;)V 
L193:   aload_0 
L194:   new java/lang/StringBuilder 
L197:   dup 
L198:   invokespecial Method java/lang/StringBuilder <init> ()V 
L201:   ldc 'sphereDotSize=' 
L203:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L206:   getstatic Field villagemarker/ASMVillageMarker sphereDotSize F 
L209:   invokevirtual Method java/lang/StringBuilder append (F)Ljava/lang/StringBuilder; 
L212:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L215:   invokevirtual Method java/io/PrintWriter println (Ljava/lang/String;)V 
L218:   aload_0 
L219:   new java/lang/StringBuilder 
L222:   dup 
L223:   invokespecial Method java/lang/StringBuilder <init> ()V 
L226:   ldc 'boxEdgeWidth=' 
L228:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L231:   getstatic Field villagemarker/ASMVillageMarker boxEdgeWidth F 
L234:   invokevirtual Method java/lang/StringBuilder append (F)Ljava/lang/StringBuilder; 
L237:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L240:   invokevirtual Method java/io/PrintWriter println (Ljava/lang/String;)V 
L243:   aload_0 
L244:   new java/lang/StringBuilder 
L247:   dup 
L248:   invokespecial Method java/lang/StringBuilder <init> ()V 
L251:   ldc 'boxEdgeExpansion=' 
L253:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L256:   getstatic Field villagemarker/ASMVillageMarker boxEdgeExpansion F 
L259:   invokevirtual Method java/lang/StringBuilder append (F)Ljava/lang/StringBuilder; 
L262:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L265:   invokevirtual Method java/io/PrintWriter println (Ljava/lang/String;)V 
L268:   aload_0 
L269:   new java/lang/StringBuilder 
L272:   dup 
L273:   invokespecial Method java/lang/StringBuilder <init> ()V 
L276:   ldc 'boxWallExpansion=' 
L278:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L281:   getstatic Field villagemarker/ASMVillageMarker boxWallExpansion F 
L284:   invokevirtual Method java/lang/StringBuilder append (F)Ljava/lang/StringBuilder; 
L287:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L290:   invokevirtual Method java/io/PrintWriter println (Ljava/lang/String;)V 
L293:   aload_0 
L294:   new java/lang/StringBuilder 
L297:   dup 
L298:   invokespecial Method java/lang/StringBuilder <init> ()V 
L301:   ldc 'wallAlpha=' 
L303:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L306:   getstatic Field villagemarker/ASMVillageMarker wallAlpha F 
L309:   invokevirtual Method java/lang/StringBuilder append (F)Ljava/lang/StringBuilder; 
L312:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L315:   invokevirtual Method java/io/PrintWriter println (Ljava/lang/String;)V 
L318:   aload_0 
L319:   new java/lang/StringBuilder 
L322:   dup 
L323:   invokespecial Method java/lang/StringBuilder <init> ()V 
L326:   ldc 'colors=[' 
L328:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L331:   getstatic Field villagemarker/ASMVillageMarker cols [Ljava/awt/Color; 
L334:   iconst_0 
L335:   aaload 
L336:   invokestatic Method villagemarker/ASMVillageMarker col2hex (Ljava/awt/Color;)Ljava/lang/String; 
L339:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L342:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L345:   invokevirtual Method java/io/PrintWriter print (Ljava/lang/String;)V 
L348:   iconst_1 
L349:   istore_1 

        .stack append Object java/io/PrintWriter Integer 
L350:   iload_1 
L351:   getstatic Field villagemarker/ASMVillageMarker cols [Ljava/awt/Color; 
L354:   arraylength 
L355:   if_icmpge L394 
L358:   aload_0 
L359:   new java/lang/StringBuilder 
L362:   dup 
L363:   invokespecial Method java/lang/StringBuilder <init> ()V 
L366:   ldc ',' 
L368:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L371:   getstatic Field villagemarker/ASMVillageMarker cols [Ljava/awt/Color; 
L374:   iload_1 
L375:   aaload 
L376:   invokestatic Method villagemarker/ASMVillageMarker col2hex (Ljava/awt/Color;)Ljava/lang/String; 
L379:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L382:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L385:   invokevirtual Method java/io/PrintWriter print (Ljava/lang/String;)V 
L388:   iinc 1 1 
L391:   goto L350 

        .stack chop 1 
L394:   aload_0 
L395:   ldc ']\n' 
L397:   invokevirtual Method java/io/PrintWriter print (Ljava/lang/String;)V 
L400:   aload_0 
L401:   invokevirtual Method java/io/PrintWriter close ()V 
L404:   goto L430 

        .stack full 
            locals 
            stack Object java/lang/Exception 
        .end stack 
L407:   astore_0 
L408:   new java/lang/StringBuilder 
L411:   dup 
L412:   invokespecial Method java/lang/StringBuilder <init> ()V 
L415:   ldc "Couldn't create options file: " 
L417:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L420:   aload_0 
L421:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/Object;)Ljava/lang/StringBuilder; 
L424:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L427:   invokestatic Method villagemarker/ASMVillageMarker log (Ljava/lang/String;)V 

        .stack same 
L430:   return 
L431:   
        .linenumbertable 
            L0 142 
            L18 143 
            L43 144 
            L68 145 
            L93 146 
            L118 147 
            L143 148 
            L168 149 
            L193 150 
            L218 151 
            L243 152 
            L268 153 
            L293 154 
            L318 156 
            L348 157 
            L358 158 
            L388 157 
            L394 159 
            L400 161 
            L404 166 
            L407 163 
            L408 165 
            L430 167 
        .end linenumbertable 
    .end code 
.end method 

.method public static readOptions : ()V 
    .code stack 5 locals 6 
L0:     new java/io/BufferedReader 
L3:     dup 
L4:     new java/io/FileReader 
L7:     dup 
L8:     getstatic Field villagemarker/ASMVillageMarker configFile Ljava/io/File; 
L11:    invokespecial Method java/io/FileReader <init> (Ljava/io/File;)V 
L14:    invokespecial Method java/io/BufferedReader <init> (Ljava/io/Reader;)V 
L17:    astore_0 
L18:    aconst_null 
L19:    astore_1 

        .stack append Object java/io/BufferedReader Object java/lang/String 
L20:    aload_0 
L21:    invokevirtual Method java/io/BufferedReader readLine ()Ljava/lang/String; 
L24:    dup 
L25:    astore_1 
L26:    ifnull L462 
        .catch java/lang/Exception from L29 to L53 using L436 
L29:    aload_1 
L30:    ldc '=' 
L32:    invokevirtual Method java/lang/String split (Ljava/lang/String;)[Ljava/lang/String; 
L35:    astore_2 
L36:    aload_2 
L37:    arraylength 
L38:    iconst_2 
L39:    if_icmplt L53 
L42:    aload_2 
L43:    iconst_0 
L44:    aaload 
L45:    ldc '' 
L47:    invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L50:    ifeq L56 

        .stack append Object [Ljava/lang/String; 
L53:    goto L20 
        .catch java/lang/Exception from L56 to L433 using L436 
        .catch java/lang/Exception from L0 to L466 using L469 

        .stack same 
L56:    aload_2 
L57:    iconst_0 
L58:    aaload 
L59:    ldc 'doDepthCheck' 
L61:    invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L64:    ifeq L79 
L67:    aload_2 
L68:    iconst_1 
L69:    aaload 
L70:    invokestatic Method java/lang/Boolean parseBoolean (Ljava/lang/String;)Z 
L73:    putstatic Field villagemarker/ASMVillageMarker doDepthCheck Z 
L76:    goto L433 

        .stack same 
L79:    aload_2 
L80:    iconst_0 
L81:    aaload 
L82:    ldc 'drawSphere' 
L84:    invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L87:    ifeq L102 
L90:    aload_2 
L91:    iconst_1 
L92:    aaload 
L93:    invokestatic Method java/lang/Boolean parseBoolean (Ljava/lang/String;)Z 
L96:    putstatic Field villagemarker/ASMVillageMarker drawSphere Z 
L99:    goto L433 

        .stack same 
L102:   aload_2 
L103:   iconst_0 
L104:   aaload 
L105:   ldc 'drawDoorLines' 
L107:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L110:   ifeq L125 
L113:   aload_2 
L114:   iconst_1 
L115:   aaload 
L116:   invokestatic Method java/lang/Boolean parseBoolean (Ljava/lang/String;)Z 
L119:   putstatic Field villagemarker/ASMVillageMarker drawDoorLines Z 
L122:   goto L433 

        .stack same 
L125:   aload_2 
L126:   iconst_0 
L127:   aaload 
L128:   ldc 'drawBoxEdge' 
L130:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L133:   ifeq L148 
L136:   aload_2 
L137:   iconst_1 
L138:   aaload 
L139:   invokestatic Method java/lang/Boolean parseBoolean (Ljava/lang/String;)Z 
L142:   putstatic Field villagemarker/ASMVillageMarker drawBoxEdge Z 
L145:   goto L433 

        .stack same 
L148:   aload_2 
L149:   iconst_0 
L150:   aaload 
L151:   ldc 'drawBoxWalls' 
L153:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L156:   ifeq L171 
L159:   aload_2 
L160:   iconst_1 
L161:   aaload 
L162:   invokestatic Method java/lang/Boolean parseBoolean (Ljava/lang/String;)Z 
L165:   putstatic Field villagemarker/ASMVillageMarker drawBoxWalls Z 
L168:   goto L433 

        .stack same 
L171:   aload_2 
L172:   iconst_0 
L173:   aaload 
L174:   ldc 'sphereSegments' 
L176:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L179:   ifeq L194 
L182:   aload_2 
L183:   iconst_1 
L184:   aaload 
L185:   invokestatic Method java/lang/Integer parseInt (Ljava/lang/String;)I 
L188:   putstatic Field villagemarker/ASMVillageMarker sphereSegments I 
L191:   goto L433 

        .stack same 
L194:   aload_2 
L195:   iconst_0 
L196:   aaload 
L197:   ldc 'doorLineWidth' 
L199:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L202:   ifeq L217 
L205:   aload_2 
L206:   iconst_1 
L207:   aaload 
L208:   invokestatic Method java/lang/Float parseFloat (Ljava/lang/String;)F 
L211:   putstatic Field villagemarker/ASMVillageMarker doorLineWidth F 
L214:   goto L433 

        .stack same 
L217:   aload_2 
L218:   iconst_0 
L219:   aaload 
L220:   ldc 'sphereDotSize' 
L222:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L225:   ifeq L240 
L228:   aload_2 
L229:   iconst_1 
L230:   aaload 
L231:   invokestatic Method java/lang/Float parseFloat (Ljava/lang/String;)F 
L234:   putstatic Field villagemarker/ASMVillageMarker sphereDotSize F 
L237:   goto L433 

        .stack same 
L240:   aload_2 
L241:   iconst_0 
L242:   aaload 
L243:   ldc 'boxEdgeWidth' 
L245:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L248:   ifeq L263 
L251:   aload_2 
L252:   iconst_1 
L253:   aaload 
L254:   invokestatic Method java/lang/Float parseFloat (Ljava/lang/String;)F 
L257:   putstatic Field villagemarker/ASMVillageMarker boxEdgeWidth F 
L260:   goto L433 

        .stack same 
L263:   aload_2 
L264:   iconst_0 
L265:   aaload 
L266:   ldc 'boxEdgeExpansion' 
L268:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L271:   ifeq L286 
L274:   aload_2 
L275:   iconst_1 
L276:   aaload 
L277:   invokestatic Method java/lang/Float parseFloat (Ljava/lang/String;)F 
L280:   putstatic Field villagemarker/ASMVillageMarker boxEdgeExpansion F 
L283:   goto L433 

        .stack same 
L286:   aload_2 
L287:   iconst_0 
L288:   aaload 
L289:   ldc 'boxWallExpansion' 
L291:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L294:   ifeq L309 
L297:   aload_2 
L298:   iconst_1 
L299:   aaload 
L300:   invokestatic Method java/lang/Float parseFloat (Ljava/lang/String;)F 
L303:   putstatic Field villagemarker/ASMVillageMarker boxWallExpansion F 
L306:   goto L433 

        .stack same 
L309:   aload_2 
L310:   iconst_0 
L311:   aaload 
L312:   ldc 'wallAlpha' 
L314:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L317:   ifeq L332 
L320:   aload_2 
L321:   iconst_1 
L322:   aaload 
L323:   invokestatic Method java/lang/Float parseFloat (Ljava/lang/String;)F 
L326:   putstatic Field villagemarker/ASMVillageMarker wallAlpha F 
L329:   goto L433 

        .stack same 
L332:   aload_2 
L333:   iconst_0 
L334:   aaload 
L335:   ldc 'colors' 
L337:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L340:   ifeq L409 
L343:   aload_2 
L344:   iconst_1 
L345:   aaload 
L346:   ldc '\\[' 
L348:   ldc '' 
L350:   invokevirtual Method java/lang/String replaceAll (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; 
L353:   ldc '\\]' 
L355:   ldc '' 
L357:   invokevirtual Method java/lang/String replaceAll (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; 
L360:   ldc ',' 
L362:   invokevirtual Method java/lang/String split (Ljava/lang/String;)[Ljava/lang/String; 
L365:   astore_3 
L366:   aload_3 
L367:   arraylength 
L368:   anewarray java/awt/Color 
L371:   astore 4 
L373:   iconst_0 
L374:   istore 5 

        .stack append Object [Ljava/lang/String; Object [Ljava/awt/Color; Integer 
L376:   iload 5 
L378:   aload_3 
L379:   arraylength 
L380:   if_icmpge L401 
L383:   aload 4 
L385:   iload 5 
L387:   aload_3 
L388:   iload 5 
L390:   aaload 
L391:   invokestatic Method villagemarker/ASMVillageMarker hex2col (Ljava/lang/String;)Ljava/awt/Color; 
L394:   aastore 
L395:   iinc 5 1 
L398:   goto L376 

        .stack chop 1 
L401:   aload 4 
L403:   putstatic Field villagemarker/ASMVillageMarker cols [Ljava/awt/Color; 
L406:   goto L433 

        .stack chop 2 
L409:   new java/lang/StringBuilder 
L412:   dup 
L413:   invokespecial Method java/lang/StringBuilder <init> ()V 
L416:   ldc 'Ignoring unrecognized option: ' 
L418:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L421:   aload_2 
L422:   iconst_0 
L423:   aaload 
L424:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L427:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L430:   invokestatic Method villagemarker/ASMVillageMarker log (Ljava/lang/String;)V 

        .stack chop 1 
L433:   goto L20 

        .stack stack_1 Object java/lang/Exception 
L436:   astore_2 
L437:   new java/lang/StringBuilder 
L440:   dup 
L441:   invokespecial Method java/lang/StringBuilder <init> ()V 
L444:   ldc 'Skipping bad option value: ' 
L446:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L449:   aload_1 
L450:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L453:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L456:   invokestatic Method villagemarker/ASMVillageMarker log (Ljava/lang/String;)V 
L459:   goto L20 

        .stack same 
L462:   aload_0 
L463:   invokevirtual Method java/io/BufferedReader close ()V 
L466:   goto L492 

        .stack full 
            locals 
            stack Object java/lang/Exception 
        .end stack 
L469:   astore_0 
L470:   new java/lang/StringBuilder 
L473:   dup 
L474:   invokespecial Method java/lang/StringBuilder <init> ()V 
L477:   ldc "Couldn't read options file: " 
L479:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L482:   aload_0 
L483:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/Object;)Ljava/lang/StringBuilder; 
L486:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L489:   invokestatic Method villagemarker/ASMVillageMarker log (Ljava/lang/String;)V 

        .stack same 
L492:   return 
L493:   
        .linenumbertable 
            L0 173 
            L18 174 
            L20 175 
            L29 179 
            L36 180 
            L53 181 
            L56 183 
            L67 184 
            L79 186 
            L90 187 
            L102 189 
            L113 190 
            L125 192 
            L136 193 
            L148 195 
            L159 196 
            L171 198 
            L182 199 
            L194 201 
            L205 202 
            L217 204 
            L228 205 
            L240 207 
            L251 208 
            L263 210 
            L274 211 
            L286 213 
            L297 214 
            L309 216 
            L320 217 
            L332 219 
            L343 221 
            L350 222 
            L357 223 
            L366 224 
            L373 225 
            L383 226 
            L395 225 
            L401 227 
            L406 228 
            L409 231 
            L433 237 
            L436 234 
            L437 236 
            L459 237 
            L462 239 
            L466 244 
            L469 241 
            L470 243 
            L492 245 
        .end linenumbertable 
    .end code 
.end method 

.method static <clinit> : ()V 
    .code stack 4 locals 0 
L0:     new java/io/File 
L3:     dup 
L4:     ldc 'ASMVillageMarker.conf' 
L6:     invokespecial Method java/io/File <init> (Ljava/lang/String;)V 
L9:     putstatic Field villagemarker/ASMVillageMarker configFile Ljava/io/File; 
L12:    iconst_1 
L13:    putstatic Field villagemarker/ASMVillageMarker doDepthCheck Z 
L16:    iconst_1 
L17:    putstatic Field villagemarker/ASMVillageMarker drawSphere Z 
L20:    iconst_1 
L21:    putstatic Field villagemarker/ASMVillageMarker drawDoorLines Z 
L24:    iconst_1 
L25:    putstatic Field villagemarker/ASMVillageMarker drawBoxEdge Z 
L28:    iconst_1 
L29:    putstatic Field villagemarker/ASMVillageMarker drawBoxWalls Z 
L32:    sipush 200 
L35:    putstatic Field villagemarker/ASMVillageMarker sphereSegments I 
L38:    fconst_2 
L39:    putstatic Field villagemarker/ASMVillageMarker doorLineWidth F 
L42:    ldc +3.0f 
L44:    putstatic Field villagemarker/ASMVillageMarker sphereDotSize F 
L47:    fconst_2 
L48:    putstatic Field villagemarker/ASMVillageMarker boxEdgeWidth F 
L51:    ldc +0.006000000052154064f 
L53:    putstatic Field villagemarker/ASMVillageMarker boxEdgeExpansion F 
L56:    ldc -0.006000000052154064f 
L58:    putstatic Field villagemarker/ASMVillageMarker boxWallExpansion F 
L61:    ldc +0.11999999731779099f 
L63:    putstatic Field villagemarker/ASMVillageMarker wallAlpha F 
L66:    bipush 6 
L68:    anewarray java/awt/Color 
L71:    dup 
L72:    iconst_0 
L73:    getstatic Field java/awt/Color CYAN Ljava/awt/Color; 
L76:    aastore 
L77:    dup 
L78:    iconst_1 
L79:    getstatic Field java/awt/Color MAGENTA Ljava/awt/Color; 
L82:    aastore 
L83:    dup 
L84:    iconst_2 
L85:    getstatic Field java/awt/Color YELLOW Ljava/awt/Color; 
L88:    aastore 
L89:    dup 
L90:    iconst_3 
L91:    getstatic Field java/awt/Color BLUE Ljava/awt/Color; 
L94:    aastore 
L95:    dup 
L96:    iconst_4 
L97:    getstatic Field java/awt/Color GREEN Ljava/awt/Color; 
L100:   aastore 
L101:   dup 
L102:   iconst_5 
L103:   getstatic Field java/awt/Color RED Ljava/awt/Color; 
L106:   aastore 
L107:   putstatic Field villagemarker/ASMVillageMarker cols [Ljava/awt/Color; 
L110:   new villagemarker/ASMVillageMarker 
L113:   dup 
L114:   invokespecial Method villagemarker/ASMVillageMarker <init> ()V 
L117:   putstatic Field villagemarker/ASMVillageMarker INSTANCE Lvillagemarker/ASMVillageMarker; 
L120:   return 
L121:   
        .linenumbertable 
            L0 21 
            L12 23 
            L16 24 
            L20 25 
            L24 26 
            L28 27 
            L32 28 
            L38 29 
            L42 30 
            L47 31 
            L51 32 
            L56 33 
            L61 34 
            L66 35 
            L110 37 
        .end linenumbertable 
    .end code 
.end method 
.sourcefile 'ASMVillageMarker.java' 
.end class 
