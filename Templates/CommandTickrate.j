.version 52 0 
.class public super CommandTickrate 
.super net/minecraft/command/CommandBase 

.method public <init> : ()V 
    .code stack 1 locals 1 
L0:     aload_0 
L1:     invokespecial Method net/minecraft/command/CommandBase <init> ()V 
L4:     return 
L5:     
        .linenumbertable 
            L0 8 
        .end linenumbertable 
    .end code 
.end method 

.method public getCommandName : ()Ljava/lang/String; 
    .code stack 1 locals 1 
L0:     ldc 'tickrate' 
L2:     areturn 
L3:     
        .linenumbertable 
            L0 12 
        .end linenumbertable 
    .end code 
.end method 

.method public getRequiredPermissionLevel : ()I 
    .code stack 1 locals 1 
L0:     iconst_2 
L1:     ireturn 
L2:     
        .linenumbertable 
            L0 17 
        .end linenumbertable 
    .end code 
.end method 

.method public getCommandUsage : (Lnet/minecraft/command/ICommandSender;)Ljava/lang/String; 
    .code stack 1 locals 2 
L0:     ldc '/tickrate [rate] [client|server]' 
L2:     areturn 
L3:     
        .linenumbertable 
            L0 22 
        .end linenumbertable 
    .end code 
.end method 

.method public execute : (Lnet/minecraft/server/MinecraftServer;Lnet/minecraft/command/ICommandSender;[Ljava/lang/String;)V 
    .code stack 3 locals 4 
L0:     aload_0 
L1:     aload_2 
L2:     aload_3 
L3:     invokevirtual Method CommandTickrate processCommand (Lnet/minecraft/command/ICommandSender;[Ljava/lang/String;)V 
L6:     return 
L7:     
        .linenumbertable 
            L0 27 
            L6 28 
        .end linenumbertable 
    .end code 
.end method 

.method public processCommand : (Lnet/minecraft/command/ICommandSender;[Ljava/lang/String;)V 
    .code stack 5 locals 5 
L0:     aload_2 
L1:     arraylength 
L2:     iconst_1 
L3:     if_icmpge L49 
L6:     aload_0 
L7:     aload_1 
L8:     new java/lang/StringBuilder 
L11:    dup 
L12:    invokespecial Method java/lang/StringBuilder <init> ()V 
L15:    ldc '\xa7eServer tickrate = ' 
L17:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L20:    getstatic Field ASMTick tickrateServer F 
L23:    invokevirtual Method java/lang/StringBuilder append (F)Ljava/lang/StringBuilder; 
L26:    ldc '\n' 
L28:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L31:    ldc '\xa7eClient tickrate = ' 
L33:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L36:    getstatic Field ASMTick tickrateClient F 
L39:    invokevirtual Method java/lang/StringBuilder append (F)Ljava/lang/StringBuilder; 
L42:    invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L45:    invokevirtual Method CommandTickrate notify (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 
L48:    return 

        .stack same 
L49:    aload_2 
L50:    iconst_0 
L51:    aaload 
L52:    ldc '--server-sleep-lock' 
L54:    invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L57:    ifne L71 
L60:    aload_2 
L61:    iconst_0 
L62:    aaload 
L63:    ldc '-l' 
L65:    invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L68:    ifeq L216 

        .stack same 
L71:    aload_2 
L72:    arraylength 
L73:    iconst_2 
L74:    if_icmplt L168 
L77:    aload_2 
L78:    iconst_1 
L79:    aaload 
L80:    ldc 'ON' 
L82:    invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L85:    ifne L99 
L88:    aload_2 
L89:    iconst_1 
L90:    aaload 
L91:    ldc 'on' 
L93:    invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L96:    ifeq L106 

        .stack same 
L99:    iconst_1 
L100:   putstatic Field ASMTick sleepLock Z 
L103:   goto L168 

        .stack same 
L106:   aload_2 
L107:   iconst_1 
L108:   aaload 
L109:   ldc 'OFF' 
L111:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L114:   ifne L128 
L117:   aload_2 
L118:   iconst_1 
L119:   aaload 
L120:   ldc 'off' 
L122:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L125:   ifeq L141 

        .stack same 
L128:   iconst_0 
L129:   putstatic Field ASMTick sleepLock Z 
L132:   ldc2_w 50L 
L135:   putstatic Field ASMTick maxSleep J 
L138:   goto L168 
        .catch java/lang/NumberFormatException from L141 to L156 using L159 

        .stack same 
L141:   aload_2 
L142:   iconst_1 
L143:   aaload 
L144:   invokestatic Method java/lang/Long parseLong (Ljava/lang/String;)J 
L147:   lstore_3 
L148:   lload_3 
L149:   putstatic Field ASMTick maxSleep J 
L152:   iconst_0 
L153:   putstatic Field ASMTick sleepLock Z 
L156:   goto L168 

        .stack stack_1 Object java/lang/NumberFormatException 
L159:   astore_3 
L160:   aload_0 
L161:   aload_1 
L162:   ldc '\xa7cSleep lock must be ON, OFF or an integer value' 
L164:   invokevirtual Method CommandTickrate notify (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 
L167:   return 

        .stack same 
L168:   getstatic Field ASMTick sleepLock Z 
L171:   ifeq L184 
L174:   aload_0 
L175:   aload_1 
L176:   ldc 'Sleep lock: \xa7aON\xa77 (Pocessing no packets between ticks)' 
L178:   invokevirtual Method CommandTickrate notify (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 
L181:   goto L215 

        .stack same 
L184:   aload_0 
L185:   aload_1 
L186:   new java/lang/StringBuilder 
L189:   dup 
L190:   invokespecial Method java/lang/StringBuilder <init> ()V 
L193:   ldc 'Sleep lock: \xa7cOFF\xa77 (Processing packets every ' 
L195:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L198:   getstatic Field ASMTick maxSleep J 
L201:   invokevirtual Method java/lang/StringBuilder append (J)Ljava/lang/StringBuilder; 
L204:   ldc ' ms)' 
L206:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L209:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L212:   invokevirtual Method CommandTickrate notify (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 

        .stack same 
L215:   return 

        .stack same 
L216:   aload_2 
L217:   iconst_0 
L218:   aaload 
L219:   invokestatic Method CommandTickrate parseFloat (Ljava/lang/String;)F 
L222:   fstore_3 
L223:   fload_3 
L224:   fconst_0 
L225:   fcmpg 
L226:   ifge L237 
L229:   aload_0 
L230:   aload_1 
L231:   ldc '\xa7cTickrate should be a non-negative floating point number' 
L233:   invokevirtual Method CommandTickrate notify (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 
L236:   return 

        .stack append Float 
L237:   aload_2 
L238:   arraylength 
L239:   iconst_2 
L240:   if_icmpge L278 
L243:   fload_3 
L244:   invokestatic Method ASMTick setTickServer (F)V 
L247:   fload_3 
L248:   invokestatic Method ASMTick setTickClient (F)V 
L251:   aload_0 
L252:   aload_1 
L253:   new java/lang/StringBuilder 
L256:   dup 
L257:   invokespecial Method java/lang/StringBuilder <init> ()V 
L260:   ldc 'Tickrate set to ' 
L262:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L265:   fload_3 
L266:   invokevirtual Method java/lang/StringBuilder append (F)Ljava/lang/StringBuilder; 
L269:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L272:   invokevirtual Method CommandTickrate notify (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 
L275:   goto L454 

        .stack same 
L278:   aload_2 
L279:   iconst_1 
L280:   aaload 
L281:   ldc 'client' 
L283:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L286:   ifne L322 
L289:   aload_2 
L290:   iconst_1 
L291:   aaload 
L292:   ldc 'CLIENT' 
L294:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L297:   ifne L322 
L300:   aload_2 
L301:   iconst_1 
L302:   aaload 
L303:   ldc 'c' 
L305:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L308:   ifne L322 
L311:   aload_2 
L312:   iconst_1 
L313:   aaload 
L314:   ldc 'C' 
L316:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L319:   ifeq L353 

        .stack same 
L322:   fload_3 
L323:   invokestatic Method ASMTick setTickClient (F)V 
L326:   aload_0 
L327:   aload_1 
L328:   new java/lang/StringBuilder 
L331:   dup 
L332:   invokespecial Method java/lang/StringBuilder <init> ()V 
L335:   ldc 'Client tickrate set to ' 
L337:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L340:   fload_3 
L341:   invokevirtual Method java/lang/StringBuilder append (F)Ljava/lang/StringBuilder; 
L344:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L347:   invokevirtual Method CommandTickrate notify (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 
L350:   goto L454 

        .stack same 
L353:   aload_2 
L354:   iconst_1 
L355:   aaload 
L356:   ldc 'server' 
L358:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L361:   ifne L397 
L364:   aload_2 
L365:   iconst_1 
L366:   aaload 
L367:   ldc 'SERVER' 
L369:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L372:   ifne L397 
L375:   aload_2 
L376:   iconst_1 
L377:   aaload 
L378:   ldc 's' 
L380:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L383:   ifne L397 
L386:   aload_2 
L387:   iconst_1 
L388:   aaload 
L389:   ldc 'S' 
L391:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L394:   ifeq L428 

        .stack same 
L397:   fload_3 
L398:   invokestatic Method ASMTick setTickServer (F)V 
L401:   aload_0 
L402:   aload_1 
L403:   new java/lang/StringBuilder 
L406:   dup 
L407:   invokespecial Method java/lang/StringBuilder <init> ()V 
L410:   ldc 'Server tickrate set to ' 
L412:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L415:   fload_3 
L416:   invokevirtual Method java/lang/StringBuilder append (F)Ljava/lang/StringBuilder; 
L419:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L422:   invokevirtual Method CommandTickrate notify (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 
L425:   goto L454 

        .stack same 
L428:   aload_0 
L429:   aload_1 
L430:   new java/lang/StringBuilder 
L433:   dup 
L434:   invokespecial Method java/lang/StringBuilder <init> ()V 
L437:   ldc 'Invalid argument: ' 
L439:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L442:   aload_2 
L443:   iconst_1 
L444:   aaload 
L445:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L448:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L451:   invokevirtual Method CommandTickrate notify (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 

        .stack same 
L454:   getstatic Field ASMTick isRemoteServer Z 
L457:   ifeq L502 
L460:   aload_0 
L461:   aload_1 
L462:   new java/lang/StringBuilder 
L465:   dup 
L466:   invokespecial Method java/lang/StringBuilder <init> ()V 
L469:   ldc '\xa7eServer tickrate = ' 
L471:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L474:   getstatic Field ASMTick tickrateServer F 
L477:   invokevirtual Method java/lang/StringBuilder append (F)Ljava/lang/StringBuilder; 
L480:   ldc '\n' 
L482:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L485:   ldc '\xa7eClient tickrate = ' 
L487:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L490:   getstatic Field ASMTick tickrateClient F 
L493:   invokevirtual Method java/lang/StringBuilder append (F)Ljava/lang/StringBuilder; 
L496:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L499:   invokevirtual Method CommandTickrate notify (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 

        .stack chop 1 
L502:   return 
L503:   
        .linenumbertable 
            L0 32 
            L6 33 
            L48 35 
            L49 37 
            L71 38 
            L77 39 
            L99 40 
            L106 41 
            L128 42 
            L132 43 
            L141 45 
            L148 46 
            L152 47 
            L156 51 
            L159 48 
            L160 49 
            L167 50 
            L168 54 
            L174 55 
            L184 57 
            L215 59 
            L216 62 
            L223 63 
            L229 64 
            L236 65 
            L237 68 
            L243 69 
            L247 70 
            L251 71 
            L278 72 
            L322 73 
            L326 74 
            L353 75 
            L397 76 
            L401 77 
            L428 79 
            L454 82 
            L460 83 
            L502 87 
        .end linenumbertable 
    .end code 
.end method 

.method public notify : [r74] 
    .code stack 4 locals 3 
L0:     aload_1 
L1:     ifnull L14 
L4:     aload_1 
L5:     aload_0 
L6:     aload_2 
L7:     iconst_0 
L8:     anewarray java/lang/Object 
L11:    invokestatic Method CommandTickrate notifyCommandListener (Lnet/minecraft/command/ICommandSender;Lnet/minecraft/command/ICommand;Ljava/lang/String;[Ljava/lang/Object;)V 

        .stack same 
L14:    return 
L15:    
        .linenumbertable 
            L0 91 
            L4 92 
            L14 93 
        .end linenumbertable 
    .end code 
.end method 

.method public static parseFloat : (Ljava/lang/String;)F 
    .code stack 2 locals 2 
        .catch java/lang/NumberFormatException from L0 to L5 using L6 
L0:     aload_0 
L1:     invokestatic Method java/lang/Double parseDouble (Ljava/lang/String;)D 
L4:     d2f 
L5:     freturn 

        .stack stack_1 Object java/lang/NumberFormatException 
L6:     astore_1 
L7:     ldc -1.0f 
L9:     freturn 
L10:    
        .linenumbertable 
            L0 98 
            L6 99 
            L7 100 
        .end linenumbertable 
    .end code 
.end method 
.sourcefile 'CommandTickrate.java' 
.const [r74] = Utf8 (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 
.end class 
