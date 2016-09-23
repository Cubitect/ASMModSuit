.version 52 0 
.class public super eventmarker/ASMEventMarker 
.super asmrender/ASMRender 
.field public static final tickCurrent Ljava/util/List; .fieldattributes 
    .signature Ljava/util/List<Leventmarker/ASMEventMarker$TickEntry;>; 
.end fieldattributes 
.field public static final tickPending Ljava/util/List; .fieldattributes 
    .signature Ljava/util/List<Leventmarker/ASMEventMarker$TickEntry;>; 
.end fieldattributes 
.field public static final tickBUD Ljava/util/List; .fieldattributes 
    .signature Ljava/util/List<Leventmarker/ASMEventMarker$TickEntry;>; 
.end fieldattributes 
.field public static final INSTANCE Leventmarker/ASMEventMarker; 
.field public static worldTime J 

.method public <init> : ()V 
    .code stack 1 locals 1 
L0:     aload_0 
L1:     invokespecial Method asmrender/ASMRender <init> ()V 
L4:     return 
L5:     
        .linenumbertable 
            L0 13 
        .end linenumbertable 
    .end code 
.end method 

.method public static update : (Ljava/util/TreeSet;Ljava/util/List;J)V 
    .code stack 4 locals 6 
L0:     lload_2 
L1:     getstatic Field eventmarker/ASMEventMarker worldTime J 
L4:     lcmp 
L5:     ifeq L36 
L8:     lload_2 
L9:     putstatic Field eventmarker/ASMEventMarker worldTime J 
L12:    getstatic Field eventmarker/ASMEventMarker tickCurrent Ljava/util/List; 
L15:    invokeinterface InterfaceMethod java/util/List clear ()V 1 
L20:    getstatic Field eventmarker/ASMEventMarker tickPending Ljava/util/List; 
L23:    invokeinterface InterfaceMethod java/util/List clear ()V 1 
L28:    getstatic Field eventmarker/ASMEventMarker tickBUD Ljava/util/List; 
L31:    invokeinterface InterfaceMethod java/util/List clear ()V 1 

        .stack same 
L36:    aload_0 
L37:    invokevirtual Method java/util/TreeSet iterator ()Ljava/util/Iterator; 
L40:    astore 4 

        .stack append Object java/util/Iterator 
L42:    aload 4 
L44:    invokeinterface InterfaceMethod java/util/Iterator hasNext ()Z 1 
L49:    ifeq L85 
L52:    aload 4 
L54:    invokeinterface InterfaceMethod java/util/Iterator next ()Ljava/lang/Object; 1 
L59:    checkcast net/minecraft/world/NextTickListEntry 
L62:    astore 5 
L64:    getstatic Field eventmarker/ASMEventMarker tickPending Ljava/util/List; 
L67:    new eventmarker/ASMEventMarker$TickEntry 
L70:    dup 
L71:    aload 5 
L73:    invokespecial Method eventmarker/ASMEventMarker$TickEntry <init> (Lnet/minecraft/world/NextTickListEntry;)V 
L76:    invokeinterface InterfaceMethod java/util/List add (Ljava/lang/Object;)Z 2 
L81:    pop 
L82:    goto L42 

        .stack chop 1 
L85:    aload_1 
L86:    invokeinterface InterfaceMethod java/util/List iterator ()Ljava/util/Iterator; 1 
L91:    astore 4 

        .stack append Object java/util/Iterator 
L93:    aload 4 
L95:    invokeinterface InterfaceMethod java/util/Iterator hasNext ()Z 1 
L100:   ifeq L136 
L103:   aload 4 
L105:   invokeinterface InterfaceMethod java/util/Iterator next ()Ljava/lang/Object; 1 
L110:   checkcast net/minecraft/world/NextTickListEntry 
L113:   astore 5 
L115:   getstatic Field eventmarker/ASMEventMarker tickCurrent Ljava/util/List; 
L118:   new eventmarker/ASMEventMarker$TickEntry 
L121:   dup 
L122:   aload 5 
L124:   invokespecial Method eventmarker/ASMEventMarker$TickEntry <init> (Lnet/minecraft/world/NextTickListEntry;)V 
L127:   invokeinterface InterfaceMethod java/util/List add (Ljava/lang/Object;)Z 2 
L132:   pop 
L133:   goto L93 

        .stack chop 1 
L136:   return 
L137:   
        .linenumbertable 
            L0 24 
            L8 26 
            L12 27 
            L20 28 
            L28 29 
            L36 31 
            L64 32 
            L85 33 
            L115 34 
            L136 35 
        .end linenumbertable 
    .end code 
    .signature (Ljava/util/TreeSet<Lnet/minecraft/world/NextTickListEntry;>;Ljava/util/List<Lnet/minecraft/world/NextTickListEntry;>;J)V 
.end method 

.method public static render : (DDD)V 
    .code stack 4 locals 6 
L0:     getstatic Field eventmarker/ASMEventMarker minecraft Lnet/minecraft/client/Minecraft; 
L3:     invokevirtual Method net/minecraft/client/Minecraft isSingleplayer ()Z 
L6:     ifeq L59 
L9:     iconst_0 
L10:    invokestatic Method eventmarker/ASMEventMarker setup (Z)V 
L13:    dload_0 
L14:    d2f 
L15:    dload_2 
L16:    d2f 
L17:    dload 4 
L19:    d2f 
L20:    invokestatic Method eventmarker/ASMEventMarker translate (FFF)V 
L23:    getstatic Field eventmarker/ASMEventMarker tickCurrent Ljava/util/List; 
L26:    getstatic Field java/awt/Color BLUE Ljava/awt/Color; 
L29:    ldc '\xa74' 
L31:    invokestatic Method eventmarker/ASMEventMarker renderTicks (Ljava/util/List;Ljava/awt/Color;Ljava/lang/String;)V 
L34:    getstatic Field eventmarker/ASMEventMarker tickPending Ljava/util/List; 
L37:    getstatic Field java/awt/Color BLUE Ljava/awt/Color; 
L40:    ldc '\xa76' 
L42:    invokestatic Method eventmarker/ASMEventMarker renderTicks (Ljava/util/List;Ljava/awt/Color;Ljava/lang/String;)V 
L45:    getstatic Field eventmarker/ASMEventMarker tickBUD Ljava/util/List; 
L48:    getstatic Field java/awt/Color GREEN Ljava/awt/Color; 
L51:    ldc '\xa72' 
L53:    invokestatic Method eventmarker/ASMEventMarker renderTicks (Ljava/util/List;Ljava/awt/Color;Ljava/lang/String;)V 
L56:    invokestatic Method asmrender/ASMRender restore ()V 

        .stack same 
L59:    return 
L60:    
        .linenumbertable 
            L0 39 
            L9 41 
            L13 42 
            L23 43 
            L34 44 
            L45 45 
            L56 46 
            L59 48 
        .end linenumbertable 
    .end code 
.end method 

.method public static renderTicks : (Ljava/util/List;Ljava/awt/Color;Ljava/lang/String;)V 
    .code stack 8 locals 10 
L0:     new java/util/HashMap 
L3:     dup 
L4:     invokespecial Method java/util/HashMap <init> ()V 
L7:     astore_3 
L8:     iconst_0 
L9:     istore 4 

        .stack append Object java/util/HashMap Integer 
L11:    iload 4 
L13:    aload_0 
L14:    invokeinterface InterfaceMethod java/util/List size ()I 1 
L19:    if_icmpge L147 
L22:    aload_0 
L23:    iload 4 
L25:    invokeinterface InterfaceMethod java/util/List get (I)Ljava/lang/Object; 2 
L30:    checkcast eventmarker/ASMEventMarker$TickEntry 
L33:    astore 5 
L35:    aload 5 
L37:    iload 4 
L39:    putfield Field eventmarker/ASMEventMarker$TickEntry idx I 
L42:    aload 5 
L44:    invokevirtual Method eventmarker/ASMEventMarker$TickEntry getPosLong ()Ljava/lang/Long; 
L47:    astore 6 
L49:    aload_3 
L50:    aload 6 
L52:    invokevirtual Method java/util/HashMap get (Ljava/lang/Object;)Ljava/lang/Object; 
L55:    checkcast [Leventmarker/ASMEventMarker$TickEntry; 
L58:    astore 7 
L60:    aload 7 
L62:    ifnonnull L84 
L65:    aload_3 
L66:    aload 6 
L68:    iconst_1 
L69:    anewarray eventmarker/ASMEventMarker$TickEntry 
L72:    dup 
L73:    iconst_0 
L74:    aload 5 
L76:    aastore 
L77:    invokevirtual Method java/util/HashMap put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; 
L80:    pop 
L81:    goto L141 

        .stack append Object eventmarker/ASMEventMarker$TickEntry Object java/lang/Long Object [Leventmarker/ASMEventMarker$TickEntry; 
L84:    aload 7 
L86:    arraylength 
L87:    iconst_1 
L88:    iadd 
L89:    anewarray eventmarker/ASMEventMarker$TickEntry 
L92:    astore 8 
L94:    iconst_0 
L95:    istore 9 

        .stack append Object [Leventmarker/ASMEventMarker$TickEntry; Integer 
L97:    iload 9 
L99:    aload 7 
L101:   arraylength 
L102:   if_icmpge L121 
L105:   aload 8 
L107:   iload 9 
L109:   aload 7 
L111:   iload 9 
L113:   aaload 
L114:   aastore 
L115:   iinc 9 1 
L118:   goto L97 

        .stack chop 1 
L121:   aload 8 
L123:   aload 7 
L125:   arraylength 
L126:   aload 5 
L128:   aastore 
L129:   aload_3 
L130:   aload 5 
L132:   invokevirtual Method eventmarker/ASMEventMarker$TickEntry getPosLong ()Ljava/lang/Long; 
L135:   aload 8 
L137:   invokevirtual Method java/util/HashMap put (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; 
L140:   pop 

        .stack full 
            locals Object java/util/List Object java/awt/Color Object java/lang/String Object java/util/HashMap Integer 
            stack 
        .end stack 
L141:   iinc 4 1 
L144:   goto L11 

        .stack chop 1 
L147:   aload_3 
L148:   invokevirtual Method java/util/HashMap values ()Ljava/util/Collection; 
L151:   invokeinterface InterfaceMethod java/util/Collection iterator ()Ljava/util/Iterator; 1 
L156:   astore 4 

        .stack append Object java/util/Iterator 
L158:   aload 4 
L160:   invokeinterface InterfaceMethod java/util/Iterator hasNext ()Z 1 
L165:   ifeq L552 
L168:   aload 4 
L170:   invokeinterface InterfaceMethod java/util/Iterator next ()Ljava/lang/Object; 1 
L175:   checkcast [Leventmarker/ASMEventMarker$TickEntry; 
L178:   astore 5 
L180:   aload 5 
L182:   iconst_0 
L183:   aaload 
L184:   getfield Field eventmarker/ASMEventMarker$TickEntry block Ljava/lang/String; 
L187:   ifnonnull L324 
L190:   aload 5 
L192:   arraylength 
L193:   iconst_3 
L194:   imul 
L195:   anewarray java/lang/String 
L198:   astore 6 
L200:   iconst_0 
L201:   istore 7 
L203:   iconst_0 
L204:   istore 8 

        .stack full 
            locals Object java/util/List Object java/awt/Color Object java/lang/String Object java/util/HashMap Object java/util/Iterator Object [Leventmarker/ASMEventMarker$TickEntry; Object [Ljava/lang/String; Integer Integer 
            stack 
        .end stack 
L206:   iload 7 
L208:   aload 5 
L210:   arraylength 
L211:   if_icmpge L321 
L214:   aload 6 
L216:   iload 8 
L218:   iinc 8 1 
L221:   new java/lang/StringBuilder 
L224:   dup 
L225:   invokespecial Method java/lang/StringBuilder <init> ()V 
L228:   aload_2 
L229:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L232:   aload 5 
L234:   iload 7 
L236:   aaload 
L237:   getfield Field eventmarker/ASMEventMarker$TickEntry idx I 
L240:   invokevirtual Method java/lang/StringBuilder append (I)Ljava/lang/StringBuilder; 
L243:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L246:   aastore 
L247:   aload 6 
L249:   iload 8 
L251:   iinc 8 1 
L254:   new java/lang/StringBuilder 
L257:   dup 
L258:   invokespecial Method java/lang/StringBuilder <init> ()V 
L261:   ldc '\xa77' 
L263:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L266:   aload 5 
L268:   iload 7 
L270:   aaload 
L271:   getfield Field eventmarker/ASMEventMarker$TickEntry time J 
L274:   invokevirtual Method java/lang/StringBuilder append (J)Ljava/lang/StringBuilder; 
L277:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L280:   aastore 
L281:   aload 6 
L283:   iload 8 
L285:   iinc 8 1 
L288:   new java/lang/StringBuilder 
L291:   dup 
L292:   invokespecial Method java/lang/StringBuilder <init> ()V 
L295:   ldc '\xa77' 
L297:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L300:   aload 5 
L302:   iload 7 
L304:   aaload 
L305:   getfield Field eventmarker/ASMEventMarker$TickEntry p I 
L308:   invokevirtual Method java/lang/StringBuilder append (I)Ljava/lang/StringBuilder; 
L311:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L314:   aastore 
L315:   iinc 7 1 
L318:   goto L206 

        .stack chop 2 
L321:   goto L455 

        .stack chop 1 
L324:   aload 5 
L326:   arraylength 
L327:   iconst_3 
L328:   imul 
L329:   anewarray java/lang/String 
L332:   astore 6 
L334:   iconst_0 
L335:   istore 7 
L337:   iconst_0 
L338:   istore 8 

        .stack append Object [Ljava/lang/String; Integer Integer 
L340:   iload 7 
L342:   aload 5 
L344:   arraylength 
L345:   if_icmpge L455 
L348:   aload 6 
L350:   iload 8 
L352:   iinc 8 1 
L355:   new java/lang/StringBuilder 
L358:   dup 
L359:   invokespecial Method java/lang/StringBuilder <init> ()V 
L362:   aload_2 
L363:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L366:   aload 5 
L368:   iload 7 
L370:   aaload 
L371:   getfield Field eventmarker/ASMEventMarker$TickEntry idx I 
L374:   invokevirtual Method java/lang/StringBuilder append (I)Ljava/lang/StringBuilder; 
L377:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L380:   aastore 
L381:   aload 6 
L383:   iload 8 
L385:   iinc 8 1 
L388:   new java/lang/StringBuilder 
L391:   dup 
L392:   invokespecial Method java/lang/StringBuilder <init> ()V 
L395:   ldc '\xa77' 
L397:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L400:   aload 5 
L402:   iload 7 
L404:   aaload 
L405:   getfield Field eventmarker/ASMEventMarker$TickEntry action Ljava/lang/String; 
L408:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L411:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L414:   aastore 
L415:   aload 6 
L417:   iload 8 
L419:   iinc 8 1 
L422:   new java/lang/StringBuilder 
L425:   dup 
L426:   invokespecial Method java/lang/StringBuilder <init> ()V 
L429:   ldc '\xa77' 
L431:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L434:   aload 5 
L436:   iload 7 
L438:   aaload 
L439:   getfield Field eventmarker/ASMEventMarker$TickEntry param Ljava/lang/String; 
L442:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L445:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L448:   aastore 
L449:   iinc 7 1 
L452:   goto L340 

        .stack chop 2 
L455:   aload 5 
L457:   iconst_0 
L458:   aaload 
L459:   getfield Field eventmarker/ASMEventMarker$TickEntry x I 
L462:   i2f 
L463:   aload 5 
L465:   iconst_0 
L466:   aaload 
L467:   getfield Field eventmarker/ASMEventMarker$TickEntry y I 
L470:   i2f 
L471:   aload 5 
L473:   iconst_0 
L474:   aaload 
L475:   getfield Field eventmarker/ASMEventMarker$TickEntry z I 
L478:   i2f 
L479:   aload 5 
L481:   iconst_0 
L482:   aaload 
L483:   getfield Field eventmarker/ASMEventMarker$TickEntry x I 
L486:   i2f 
L487:   fconst_1 
L488:   fadd 
L489:   aload 5 
L491:   iconst_0 
L492:   aaload 
L493:   getfield Field eventmarker/ASMEventMarker$TickEntry y I 
L496:   i2f 
L497:   fconst_1 
L498:   fadd 
L499:   aload 5 
L501:   iconst_0 
L502:   aaload 
L503:   getfield Field eventmarker/ASMEventMarker$TickEntry z I 
L506:   i2f 
L507:   fconst_1 
L508:   fadd 
L509:   aload_1 
L510:   ldc +0.11999999731779099f 
L512:   invokestatic Method asmrender/ASMRender drawBoxWalls (FFFFFFLjava/awt/Color;F)V 
L515:   aload 6 
L517:   aload 5 
L519:   iconst_0 
L520:   aaload 
L521:   getfield Field eventmarker/ASMEventMarker$TickEntry x I 
L524:   i2f 
L525:   aload 5 
L527:   iconst_0 
L528:   aaload 
L529:   getfield Field eventmarker/ASMEventMarker$TickEntry y I 
L532:   i2f 
L533:   fconst_1 
L534:   fadd 
L535:   aload 5 
L537:   iconst_0 
L538:   aaload 
L539:   getfield Field eventmarker/ASMEventMarker$TickEntry z I 
L542:   i2f 
L543:   aload_1 
L544:   ldc +0.800000011920929f 
L546:   invokestatic Method asmrender/ASMRender markBlock ([Ljava/lang/String;FFFLjava/awt/Color;F)V 
L549:   goto L158 

        .stack chop 3 
L552:   return 
L553:   
        .linenumbertable 
            L0 52 
            L8 54 
            L22 56 
            L35 57 
            L42 58 
            L49 59 
            L60 61 
            L65 63 
            L84 67 
            L94 68 
            L105 69 
            L115 68 
            L121 70 
            L129 71 
            L141 54 
            L147 75 
            L180 78 
            L190 80 
            L200 81 
            L214 83 
            L247 84 
            L281 85 
            L315 81 
            L324 90 
            L334 91 
            L348 93 
            L381 94 
            L415 95 
            L449 91 
            L455 98 
            L515 103 
            L549 107 
            L552 108 
        .end linenumbertable 
    .end code 
    .signature (Ljava/util/List<Leventmarker/ASMEventMarker$TickEntry;>;Ljava/awt/Color;Ljava/lang/String;)V 
.end method 

.method static <clinit> : ()V 
    .code stack 2 locals 0 
L0:     new java/util/ArrayList 
L3:     dup 
L4:     invokespecial Method java/util/ArrayList <init> ()V 
L7:     putstatic Field eventmarker/ASMEventMarker tickCurrent Ljava/util/List; 
L10:    new java/util/ArrayList 
L13:    dup 
L14:    invokespecial Method java/util/ArrayList <init> ()V 
L17:    putstatic Field eventmarker/ASMEventMarker tickPending Ljava/util/List; 
L20:    new java/util/ArrayList 
L23:    dup 
L24:    invokespecial Method java/util/ArrayList <init> ()V 
L27:    putstatic Field eventmarker/ASMEventMarker tickBUD Ljava/util/List; 
L30:    new eventmarker/ASMEventMarker 
L33:    dup 
L34:    invokespecial Method eventmarker/ASMEventMarker <init> ()V 
L37:    putstatic Field eventmarker/ASMEventMarker INSTANCE Leventmarker/ASMEventMarker; 
L40:    return 
L41:    
        .linenumbertable 
            L0 15 
            L10 16 
            L20 17 
            L30 18 
        .end linenumbertable 
    .end code 
.end method 
.sourcefile 'ASMEventMarker.java' 
.innerclasses 
    eventmarker/ASMEventMarker$TickEntry eventmarker/ASMEventMarker TickEntry public static 
.end innerclasses 
.end class 
