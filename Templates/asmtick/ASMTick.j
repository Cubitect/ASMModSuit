.version 52 0 
.class public super asmtick/ASMTick 
.super java/lang/Object 
.field private static final author Ljava/lang/String; = 'Cubitect' 
.field private static final name Ljava/lang/String; = 'ASMTick' 
.field private static final build Ljava/lang/String; = '001' 
.field private static final versionName Ljava/lang/String; = '0.1' 
.field private static final versionType Ljava/lang/String; = 'main' 
.field private static final mcVersion Ljava/lang/String; = '1.7+' 
.field private static final mcType Ljava/lang/String; = 'Dynamic' 
.field public static isRemoteServer Z 
.field public static final maxTickTime J = 9223372036854775807L 
.field public static sleepLock Z 
.field public static maxSleep J 
.field public static tickrateClient F 
.field public static tickrateServer F 
.field public static ms2Tick J 
.field public static serverOverloadWarnTicks J 
.field public static interruptTick Z 
.field public static doOnlyQueue Z 

.method public <init> : ()V 
    .code stack 1 locals 1 
L0:     aload_0 
L1:     invokespecial Method java/lang/Object <init> ()V 
L4:     return 
L5:     
        .linenumbertable 
            L0 11 
        .end linenumbertable 
    .end code 
.end method 

.method public static setTickServer : (F)V 
    .code stack 2 locals 1 
L0:     fload_0 
L1:     putstatic Field asmtick/ASMTick tickrateServer F 
L4:     getstatic Field asmtick/ASMTick tickrateServer F 
L7:     ldc +200.0f 
L9:     fmul 
L10:    f2l 
L11:    putstatic Field asmtick/ASMTick serverOverloadWarnTicks J 
L14:    getstatic Field asmtick/ASMTick tickrateServer F 
L17:    fconst_0 
L18:    fcmpg 
L19:    ifgt L31 
L22:    ldc2_w 9223372036854775807L 
L25:    putstatic Field asmtick/ASMTick ms2Tick J 
L28:    goto L41 

        .stack same 
L31:    ldc +1000.0f 
L33:    getstatic Field asmtick/ASMTick tickrateServer F 
L36:    fdiv 
L37:    f2l 
L38:    putstatic Field asmtick/ASMTick ms2Tick J 

        .stack same 
L41:    return 
L42:    
        .linenumbertable 
            L0 39 
            L4 40 
            L14 41 
            L22 42 
            L31 44 
            L41 46 
        .end linenumbertable 
    .end code 
.end method 

.method public static setTickClient : (F)V 
    .code stack 4 locals 5 
L0:     fload_0 
L1:     putstatic Field asmtick/ASMTick tickrateClient F 
L4:     invokestatic Method net/minecraft/client/Minecraft getMinecraft ()Lnet/minecraft/client/Minecraft; 
L7:     astore_1 
L8:     aload_1 
L9:     getfield Field net/minecraft/client/Minecraft timer Lnet/minecraft/util/Timer; 
L12:    getfield Field net/minecraft/util/Timer elapsedPartialTicks F 
L15:    fstore_2 
L16:    aload_1 
L17:    getfield Field net/minecraft/client/Minecraft timer Lnet/minecraft/util/Timer; 
L20:    getfield Field net/minecraft/util/Timer elapsedTicks I 
L23:    istore_3 
L24:    aload_1 
L25:    getfield Field net/minecraft/client/Minecraft timer Lnet/minecraft/util/Timer; 
L28:    getfield Field net/minecraft/util/Timer renderPartialTicks F 
L31:    fstore 4 
L33:    aload_1 
L34:    new net/minecraft/util/Timer 
L37:    dup 
L38:    fload_0 
L39:    invokespecial Method net/minecraft/util/Timer <init> (F)V 
L42:    putfield Field net/minecraft/client/Minecraft timer Lnet/minecraft/util/Timer; 
L45:    aload_1 
L46:    getfield Field net/minecraft/client/Minecraft timer Lnet/minecraft/util/Timer; 
L49:    fload_2 
L50:    putfield Field net/minecraft/util/Timer elapsedPartialTicks F 
L53:    aload_1 
L54:    getfield Field net/minecraft/client/Minecraft timer Lnet/minecraft/util/Timer; 
L57:    iload_3 
L58:    putfield Field net/minecraft/util/Timer elapsedTicks I 
L61:    aload_1 
L62:    getfield Field net/minecraft/client/Minecraft timer Lnet/minecraft/util/Timer; 
L65:    fload 4 
L67:    putfield Field net/minecraft/util/Timer renderPartialTicks F 
L70:    return 
L71:    
        .linenumbertable 
            L0 51 
            L4 52 
            L8 54 
            L16 55 
            L24 56 
            L33 58 
            L45 60 
            L53 61 
            L61 62 
            L70 63 
        .end linenumbertable 
    .end code 
.end method 

.method public static serverSleep : (J)J 
    .code stack 6 locals 5 
L0:     lconst_0 
L1:     lstore_2 
L2:     getstatic Field asmtick/ASMTick sleepLock Z 
L5:     ifeq L26 
        .catch java/lang/InterruptedException from L8 to L14 using L17 
L8:     getstatic Field asmtick/ASMTick ms2Tick J 
L11:    invokestatic Method java/lang/Thread sleep (J)V 
L14:    goto L24 

        .stack full 
            locals Long Long 
            stack Object java/lang/InterruptedException 
        .end stack 
L17:    astore 4 
L19:    aload 4 
L21:    invokevirtual Method java/lang/InterruptedException printStackTrace ()V 

        .stack same 
L24:    lconst_0 
L25:    lreturn 
        .catch java/lang/InterruptedException from L26 to L30 using L33 

        .stack same 
L26:    lconst_1 
L27:    invokestatic Method java/lang/Thread sleep (J)V 
L30:    goto L40 

        .stack stack_1 Object java/lang/InterruptedException 
L33:    astore 4 
L35:    aload 4 
L37:    invokevirtual Method java/lang/InterruptedException printStackTrace ()V 

        .stack same 
L40:    lload_2 
L41:    lconst_1 
L42:    ladd 
L43:    lstore_2 
L44:    lload_2 
L45:    getstatic Field asmtick/ASMTick ms2Tick J 
L48:    lload_0 
L49:    lsub 
L50:    lcmp 
L51:    ifge L68 
L54:    lload_2 
L55:    getstatic Field asmtick/ASMTick maxSleep J 
L58:    lcmp 
L59:    ifgt L68 
L62:    getstatic Field asmtick/ASMTick interruptTick Z 
L65:    ifeq L26 

        .stack same 
L68:    getstatic Field asmtick/ASMTick interruptTick Z 
L71:    ifeq L82 
L74:    ldc 'Server sleep interrupted.' 
L76:    invokestatic Method asmtick/ASMTick log (Ljava/lang/String;)V 
L79:    goto L100 

        .stack same 
L82:    lload_2 
L83:    getstatic Field asmtick/ASMTick maxSleep J 
L86:    lcmp 
L87:    iflt L100 
L90:    getstatic Field asmtick/ASMTick sleepLock Z 
L93:    ifne L100 
L96:    iconst_1 
L97:    putstatic Field asmtick/ASMTick interruptTick Z 

        .stack same 
L100:   lload_2 
L101:   lreturn 
L102:   
        .linenumbertable 
            L0 67 
            L2 69 
            L8 72 
            L14 75 
            L17 73 
            L19 74 
            L24 76 
            L26 81 
            L30 84 
            L33 82 
            L35 83 
            L40 85 
            L44 86 
            L68 88 
            L74 89 
            L82 91 
            L96 92 
            L100 94 
        .end linenumbertable 
    .end code 
.end method 

.method public static chatTrigger : (Ljava/lang/String;)V 
    .code stack 1 locals 1 
L0:     iconst_1 
L1:     putstatic Field asmtick/ASMTick interruptTick Z 
L4:     return 
L5:     
        .linenumbertable 
            L0 99 
            L4 100 
        .end linenumbertable 
    .end code 
.end method 

.method public static chatPacketRecieved : (Ljava/lang/String;)V 
    .code stack 2 locals 5 
L0:     getstatic Field asmtick/ASMTick isRemoteServer Z 
L3:     ifeq L7 
L6:     return 

        .stack same 
L7:     aload_0 
L8:     ldc '\xa7eServer tickrate = [.0-9]+\n\xa7eClient tickrate = [.0-9]+' 
L10:    invokevirtual Method java/lang/String matches (Ljava/lang/String;)Z 
L13:    ifeq L77 
L16:    ldc '[.0-9]+' 
L18:    invokestatic Method java/util/regex/Pattern compile (Ljava/lang/String;)Ljava/util/regex/Pattern; 
L21:    astore_1 
L22:    aload_1 
L23:    aload_0 
L24:    invokevirtual Method java/util/regex/Pattern matcher (Ljava/lang/CharSequence;)Ljava/util/regex/Matcher; 
L27:    astore_2 
L28:    aload_2 
L29:    invokevirtual Method java/util/regex/Matcher find ()Z 
L32:    pop 
L33:    aload_2 
L34:    invokevirtual Method java/util/regex/Matcher group ()Ljava/lang/String; 
L37:    invokestatic Method asmtick/CommandTickrate parseFloat (Ljava/lang/String;)F 
L40:    fstore_3 
L41:    fload_3 
L42:    fconst_0 
L43:    fcmpl 
L44:    iflt L51 
L47:    fload_3 
L48:    invokestatic Method asmtick/ASMTick setTickServer (F)V 

        .stack append Object java/util/regex/Pattern Object java/util/regex/Matcher Float 
L51:    aload_2 
L52:    invokevirtual Method java/util/regex/Matcher find ()Z 
L55:    pop 
L56:    aload_2 
L57:    invokevirtual Method java/util/regex/Matcher group ()Ljava/lang/String; 
L60:    invokestatic Method asmtick/CommandTickrate parseFloat (Ljava/lang/String;)F 
L63:    fstore 4 
L65:    fload 4 
L67:    fconst_0 
L68:    fcmpl 
L69:    ifle L77 
L72:    fload 4 
L74:    invokestatic Method asmtick/ASMTick setTickClient (F)V 

        .stack chop 3 
L77:    return 
L78:    
        .linenumbertable 
            L0 104 
            L6 105 
            L7 106 
            L16 108 
            L22 109 
            L28 110 
            L33 111 
            L41 112 
            L51 113 
            L56 114 
            L65 115 
            L77 117 
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
L44:    ldc 'ASMTick' 
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
            L0 122 
            L20 123 
            L64 124 
        .end linenumbertable 
    .end code 
.end method 

.method static <clinit> : ()V 
    .code stack 2 locals 0 
L0:     iconst_0 
L1:     putstatic Field asmtick/ASMTick isRemoteServer Z 
L4:     iconst_0 
L5:     putstatic Field asmtick/ASMTick sleepLock Z 
L8:     getstatic Field asmtick/ASMTick isRemoteServer Z 
L11:    ifeq L20 
L14:    ldc2_w 50L 
L17:    goto L23 

        .stack same 
L20:    ldc2_w 9223372036854775807L 

        .stack stack_1 Long 
L23:    putstatic Field asmtick/ASMTick maxSleep J 
L26:    ldc +20.0f 
L28:    putstatic Field asmtick/ASMTick tickrateClient F 
L31:    ldc +20.0f 
L33:    putstatic Field asmtick/ASMTick tickrateServer F 
L36:    ldc2_w 50L 
L39:    putstatic Field asmtick/ASMTick ms2Tick J 
L42:    ldc2_w 2000L 
L45:    putstatic Field asmtick/ASMTick serverOverloadWarnTicks J 
L48:    iconst_0 
L49:    putstatic Field asmtick/ASMTick interruptTick Z 
L52:    iconst_0 
L53:    putstatic Field asmtick/ASMTick doOnlyQueue Z 
L56:    return 
L57:    
        .linenumbertable 
            L0 22 
            L4 24 
            L8 25 
            L26 27 
            L31 28 
            L36 29 
            L42 30 
            L48 32 
            L52 35 
        .end linenumbertable 
    .end code 
.end method 
.sourcefile 'ASMTick.java' 
.end class 
