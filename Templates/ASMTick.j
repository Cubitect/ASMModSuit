.version 52 0 
.class public super ASMTick 
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
            L0 6 
        .end linenumbertable 
    .end code 
.end method 

.method public static setTickServer : (F)V 
    .code stack 2 locals 1 
L0:     fload_0 
L1:     putstatic Field ASMTick tickrateServer F 
L4:     getstatic Field ASMTick tickrateServer F 
L7:     ldc +200.0f 
L9:     fmul 
L10:    f2l 
L11:    putstatic Field ASMTick serverOverloadWarnTicks J 
L14:    getstatic Field ASMTick tickrateServer F 
L17:    fconst_0 
L18:    fcmpg 
L19:    ifgt L31 
L22:    ldc2_w 9223372036854775807L 
L25:    putstatic Field ASMTick ms2Tick J 
L28:    goto L41 

        .stack same 
L31:    ldc +1000.0f 
L33:    getstatic Field ASMTick tickrateServer F 
L36:    fdiv 
L37:    f2l 
L38:    putstatic Field ASMTick ms2Tick J 

        .stack same 
L41:    return 
L42:    
        .linenumbertable 
            L0 34 
            L4 35 
            L14 36 
            L22 37 
            L31 39 
            L41 41 
        .end linenumbertable 
    .end code 
.end method 

.method public static setTickClient : (F)V 
    .code stack 1 locals 2 
L0:     fconst_0 
L1:     fstore_1 
L2:     fload_0 
L3:     putstatic Field ASMTick tickrateClient F 
L6:     return 
L7:     
        .linenumbertable 
            L0 46 
            L2 47 
            L6 49 
        .end linenumbertable 
    .end code 
.end method 

.method public static serverSleep : (J)J 
    .code stack 6 locals 5 
L0:     lconst_0 
L1:     lstore_2 
        .catch java/lang/InterruptedException from L2 to L6 using L9 

        .stack append Long 
L2:     lconst_1 
L3:     invokestatic Method java/lang/Thread sleep (J)V 
L6:     goto L16 

        .stack stack_1 Object java/lang/InterruptedException 
L9:     astore 4 
L11:    aload 4 
L13:    invokevirtual Method java/lang/InterruptedException printStackTrace ()V 

        .stack same 
L16:    lload_2 
L17:    lconst_1 
L18:    ladd 
L19:    lstore_2 
L20:    lload_2 
L21:    getstatic Field ASMTick ms2Tick J 
L24:    lload_0 
L25:    lsub 
L26:    lcmp 
L27:    ifge L44 
L30:    lload_2 
L31:    getstatic Field ASMTick maxSleep J 
L34:    lcmp 
L35:    ifgt L44 
L38:    getstatic Field ASMTick interruptTick Z 
L41:    ifeq L2 

        .stack same 
L44:    getstatic Field ASMTick interruptTick Z 
L47:    ifeq L58 
L50:    ldc 'Server sleep interrupted.' 
L52:    invokestatic Method ASMTick log (Ljava/lang/String;)V 
L55:    goto L76 

        .stack same 
L58:    lload_2 
L59:    getstatic Field ASMTick maxSleep J 
L62:    lcmp 
L63:    iflt L76 
L66:    getstatic Field ASMTick sleepLock Z 
L69:    ifne L76 
L72:    iconst_1 
L73:    putstatic Field ASMTick interruptTick Z 

        .stack same 
L76:    lload_2 
L77:    lreturn 
L78:    
        .linenumbertable 
            L0 53 
            L2 57 
            L6 60 
            L9 58 
            L11 59 
            L16 61 
            L20 62 
            L44 64 
            L50 65 
            L58 67 
            L72 68 
            L76 70 
        .end linenumbertable 
    .end code 
.end method 

.method public static chatTrigger : (Ljava/lang/String;)V 
    .code stack 1 locals 1 
L0:     iconst_1 
L1:     putstatic Field ASMTick interruptTick Z 
L4:     return 
L5:     
        .linenumbertable 
            L0 75 
            L4 76 
        .end linenumbertable 
    .end code 
.end method 

.method public static chatPacketRecieved : (Ljava/lang/String;)V 
    .code stack 2 locals 5 
L0:     getstatic Field ASMTick isRemoteServer Z 
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
L37:    invokestatic Method CommandTickrate parseFloat (Ljava/lang/String;)F 
L40:    fstore_3 
L41:    fload_3 
L42:    fconst_0 
L43:    fcmpl 
L44:    iflt L51 
L47:    fload_3 
L48:    invokestatic Method ASMTick setTickServer (F)V 

        .stack append Object java/util/regex/Pattern Object java/util/regex/Matcher Float 
L51:    aload_2 
L52:    invokevirtual Method java/util/regex/Matcher find ()Z 
L55:    pop 
L56:    aload_2 
L57:    invokevirtual Method java/util/regex/Matcher group ()Ljava/lang/String; 
L60:    invokestatic Method CommandTickrate parseFloat (Ljava/lang/String;)F 
L63:    fstore 4 
L65:    fload 4 
L67:    fconst_0 
L68:    fcmpl 
L69:    ifle L77 
L72:    fload 4 
L74:    invokestatic Method ASMTick setTickClient (F)V 

        .stack chop 3 
L77:    return 
L78:    
        .linenumbertable 
            L0 80 
            L6 81 
            L7 82 
            L16 84 
            L22 85 
            L28 86 
            L33 87 
            L41 88 
            L51 89 
            L56 90 
            L65 91 
            L77 93 
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
            L0 98 
            L20 99 
            L64 100 
        .end linenumbertable 
    .end code 
.end method 

.method static <clinit> : ()V 
    .code stack 2 locals 0 
L0:     iconst_0 
L1:     putstatic Field ASMTick isRemoteServer Z 
L4:     iconst_0 
L5:     putstatic Field ASMTick sleepLock Z 
L8:     getstatic Field ASMTick isRemoteServer Z 
L11:    ifeq L20 
L14:    ldc2_w 50L 
L17:    goto L23 

        .stack same 
L20:    ldc2_w 9223372036854775807L 

        .stack stack_1 Long 
L23:    putstatic Field ASMTick maxSleep J 
L26:    ldc +20.0f 
L28:    putstatic Field ASMTick tickrateClient F 
L31:    ldc +20.0f 
L33:    putstatic Field ASMTick tickrateServer F 
L36:    ldc2_w 50L 
L39:    putstatic Field ASMTick ms2Tick J 
L42:    ldc2_w 2000L 
L45:    putstatic Field ASMTick serverOverloadWarnTicks J 
L48:    iconst_0 
L49:    putstatic Field ASMTick interruptTick Z 
L52:    iconst_0 
L53:    putstatic Field ASMTick doOnlyQueue Z 
L56:    return 
L57:    
        .linenumbertable 
            L0 17 
            L4 19 
            L8 20 
            L26 22 
            L31 23 
            L36 24 
            L42 25 
            L48 27 
            L52 30 
        .end linenumbertable 
    .end code 
.end method 
.sourcefile 'ASMTick.java' 
.end class 
