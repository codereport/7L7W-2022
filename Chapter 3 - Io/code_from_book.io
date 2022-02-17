# Day 1

Io> 1 + 2
==> 3
Io> "Hi ho, Io"
==> Hi ho, Io
Io> "Hi ho, Io" print
Hi ho, Io==> Hi ho, Io
Io> Vehicle := Object clone
==>  Vehicle_0x557ad04aea90:
  type             = "Vehicle"

Io> Vehicle description := "Something to take you place"
==> Something to take you place
Io> Vehicle description = "Something to take you far away"
==> Something to take you far away
Io> Vehicle nonexistingSlot = "This won't work"

  Exception: Slot nonexistingSlot not found. Must define slot using := operator before updating.
  ---------
  message 'updateSlot' in 'Command Line' on line 1

Io> Vehicle description
==> Something to take you far away
Io> Vehicle slotNames
==> list(description, type)
Io> Vehicle type
==> Vehicle
Io> Object type
==> Object
Io> Car := Vehicle clone
==>  Car_0x557ad04f0860:
  type             = "Car"

Io> Car slotNames
==> list(type)
Io> Car type
==> Car
Io> Car description
==> Something to take you far away
Io> ferrari := Car clone
==>  Car_0x557ad0e90900:

Io> ferrari slotNames
==> list()
Io> ferrari type
==> Car
Io> Ferrari := Car clone
==>  Ferrari_0x557ad0fd4ce0:
  type             = "Ferrari"

Io> Ferrari type
==> Ferrari
Io> Ferrari slotNames
==> list(type)
Io> method("no argument" println)
==> method(
    "no argument" println
)
Io> method() type
==> Block
Io> Car drive := method("Vroom" println)
==> method(
    "Vroom" println
)
Io> ferrari drive
Vroom
==> Vroom
Io> ferrari proto
==>  Car_0x557ad04f0860:
  drive            = method(...)
  type             = "Car"

Io> Car proto
==>  Vehicle_0x557ad04aea90:
  description      = "Something to take you far away"
  type             = "Vehicle"

Io> Lobby
==>  Object_0x557ad0425ad0:
  Car              = Car_0x557ad04f0860
  Ferrari          = Ferrari_0x557ad0fd4ce0
  Lobby            = Object_0x557ad0425ad0
  Protos           = Object_0x557ad0425980
  Vehicle          = Vehicle_0x557ad04aea90
  _                = Object_0x557ad0425ad0
  exit             = method(...)
  ferrari          = Car_0x557ad0e90900
  forward          = method(...)
  set_             = method(...)

# Day 2

Io> i := 1
==> 1
Io> while (i <= 11, i println; i = i + 1) "This one goes up to 11"
1
2
3
4
5
6
7
8
9
10
11
==> This one goes up to 11
Io> OperatorTable
==> OperatorTable_0x55d6fd684c40:
Operators
  0   ? @ @@
  1   **
  2   % * /
  3   + -
  4   << >>
  5   < <= > >=
  6   != ==
  7   &
  8   ^
  9   |
  10  && and
  11  or ||
  12  ..
  13  %= &= *= += -= /= <<= >>= ^= |=
  14  return

Assign Operators
  ::= newSlot
  :=  setSlot
  =   updateSlot

To add a new operator: OperatorTable addOperator("+", 4) and implement the + message.
To add a new assign operator: OperatorTable addAssignOperator("=", "updateSlot") and implement the updateSlot message.

Io> OperatorTable addOperator("xor", 11)
==> OperatorTable_0x55d6fd684c40:
Operators
  0   ? @ @@
  1   **
  2   % * /
  3   + -
  4   << >>
  5   < <= > >=
  6   != ==
  7   &
  8   ^
  9   |
  10  && and
  11  or xor ||
  12  ..
  13  %= &= *= += -= /= <<= >>= ^= |=
  14  return

Assign Operators
  ::= newSlot
  :=  setSlot
  =   updateSlot

To add a new operator: OperatorTable addOperator("+", 4) and implement the + message.
To add a new assign operator: OperatorTable addAssignOperator("=", "updateSlot") and implement the updateSlot message.

Io> OperatorTable
==> OperatorTable_0x55d6fd684c40:
Operators
  0   ? @ @@
  1   **
  2   % * /
  3   + -
  4   << >>
  5   < <= > >=
  6   != ==
  7   &
  8   ^
  9   |
  10  && and
  11  or xor ||
  12  ..
  13  %= &= *= += -= /= <<= >>= ^= |=
  14  return

Assign Operators
  ::= newSlot
  :=  setSlot
  =   updateSlot

To add a new operator: OperatorTable addOperator("+", 4) and implement the + message.
To add a new assign operator: OperatorTable addAssignOperator("=", "updateSlot") and implement the updateSlot message.

Io> postOffice := Object clone
==>  Object_0x55d6fd72c320:

Io> postOffice packageSender := method(call sender)
==> method(
    call sender
)
Io> mailer := Object clone
==>  Object_0x55d6fd72f940:

Io> mailer deliver := method(postOffice packageSender)
==> method(
    postOffice packageSender
)
Io> mailer deliver
==>  Object_0x55d6fd72f940:
  deliver          = method(...)

Io> postOffice messageTarget := method(call target)
==> method(
    call target
)
Io> postOffice messageTarget
==>  Object_0x55d6fd72c320:
  messageTarget    = method(...)
  packageSender    = method(...)

Io> Object ancestors
==> list( Object_0x55d6fd5d1cb0:
                   = Object_()
  !=               = Object_!=()
  -                = Object_-()
  ..               = method(arg, ...)
  <                = Object_<()
  <=               = Object_<=()
  ==               = Object_==()
  >                = Object_>()
  >=               = Object_>=()
  ?                = method(...)
  @                = method(...)
  @@               = method(...)
  actorProcessQueue = method(...)
  actorRun         = method(...)
  addTrait         = method(obj, ...)
  ancestorWithSlot = Object_ancestorWithSlot()
  ancestors        = method(a, ...)
  and              = method(v, ...)
  appendProto      = Object_appendProto()
  apropos          = method(keyword, ...)
  argIsActivationRecord = Object_argIsActivationRecord()
  argIsCall        = Object_argIsCall()
  asBoolean        = Object_asBoolean()
  asSimpleString   = method(...)
  asString         = method(keyword, ...)
  asyncSend        = method(...)
  become           = Object_become()
  block            = Object_block()
  break            = Object_break()
  clone            = Object_clone()
  cloneWithoutInit = Object_cloneWithoutInit()
  compare          = Object_compare()
  contextWithSlot  = Object_contextWithSlot()
  continue         = Object_continue()
  coroDo           = method(...)
  coroDoLater      = method(...)
  coroFor          = method(...)
  coroWith         = method(...)
  currentCoro      = method(...)
  deprecatedWarning = method(newName, ...)
  do               = Object_do()
  doFile           = Object_doFile()
  doMessage        = Object_doMessage()
  doRelativeFile   = method(path, ...)
  doString         = Object_doString()
  evalArg          = Object_evalArg()
  evalArgAndReturnNil = Object_evalArgAndReturnNil()
  evalArgAndReturnSelf = Object_evalArgAndReturnSelf()
  for              = Object_for()
  foreachSlot      = method(...)
  futureSend       = method(...)
  getLocalSlot     = Object_getLocalSlot()
  getSlot          = Object_getSlot()
  handleActorException = method(e, ...)
  hasDirtySlot     = Object_hasDirtySlot()
  hasLocalSlot     = Object_hasLocalSlot()
  hasProto         = Object_hasProto()
  hasSlot          = method(n, ...)
  if               = Object_if()
  ifError          = method(...)
  ifNil            = Object_thisContext()
  ifNilEval        = Object_thisContext()
  ifNonNil         = Object_evalArgAndReturnSelf()
  ifNonNilEval     = Object_evalArg()
  in               = method(aList, ...)
  init             = Object_init()
  inlineMethod     = method(...)
  isActivatable    = Object_isActivatable()
  isError          = false
  isIdenticalTo    = Object_isIdenticalTo()
  isKindOf         = method(anObject, ...)
  isLaunchScript   = method(...)
  isNil            = false
  isTrue           = true
  justSerialized   = method(stream, ...)
  launchFile       = method(path, args, ...)
  lazySlot         = method(...)
  lexicalDo        = Object_lexicalDo()
  list             = method(...)
  loop             = Object_loop()
  markClean        = Object_markClean()
  memorySize       = Object_memorySize()
  message          = Object_message()
  method           = Object_method()
  newSlot          = method(name, value, doc, ...)
  not              = nil
  or               = true
  ownsSlots        = Object_ownsSlots()
  pause            = method(...)
  perform          = Object_perform()
  performWithArgList = Object_performWithArgList()
  prependProto     = Object_prependProto()
  print            = method(...)
  println          = method(...)
  proto            = Object_proto()
  protos           = Object_protos()
  raiseIfError     = method(...)
  relativeDoFile   = method(path, ...)
  removeAllProtos  = Object_removeAllProtos()
  removeAllSlots   = Object_removeAllSlots()
  removeProto      = Object_removeProto()
  removeSlot       = Object_removeSlot()
  resend           = method(...)
  return           = Object_return()
  returnIfError    = method(...)
  returnIfNonNil   = Object_returnIfNonNil()
  serialized       = method(stream, ...)
  serializedSlots  = method(stream, ...)
  serializedSlotsWithNames = method(names, stream, ...)
  setIsActivatable = Object_setIsActivatable()
  setProto         = Object_setProto()
  setProtos        = Object_setProtos()
  setSlot          = Object_setSlot()
  setSlotWithType  = Object_setSlotWithType()
  shallowCopy      = Object_shallowCopy()
  slotDescriptionMap = method(...)
  slotNames        = Object_slotNames()
  slotSummary      = method(keyword, ...)
  slotValues       = Object_slotValues()
  stopStatus       = Object_stopStatus()
  super            = method(...)
  switch           = method(...)
  thisContext      = Object_thisContext()
  thisLocalContext = Object_thisLocalContext()
  thisMessage      = Object_thisMessage()
  try              = method(...)
  type             = Object_type()
  uniqueHexId      = method(...)
  uniqueId         = Object_uniqueId()
  updateSlot       = Object_updateSlot()
  wait             = method(s, ...)
  while            = Object_while()
  write            = Object_write()
  writeln          = Object_writeln()
  yield            = method(...)
,  Object_0x55d6fd5f7ad0:
  Lobby            = Object_0x55d6fd5f7ad0
  Protos           = Object_0x55d6fd5f7980
  _                = list(Object_0x55d6fd5d1cb0, Object_0x...
  exit             = method(...)
  forward          = method(...)
  i                = 12
  mailer           = Object_0x55d6fd72f940
  postOffice       = Object_0x55d6fd72c320
  set_             = method(...)
,  Object_0x55d6fd5f7980:
  Addons           = Object_0x55d6fd5f7e10
  Core             = Object_0x55d6fd5f7a40
,  Object_0x55d6fd5f7a40:
  Addon            = Addon_0x55d6fd7d4570
  AddonLoader      = AddonLoader_0x55d6fd6b3d30
  Block            = method(...)
  Break            = Break_0x55d6fd61d0a0
  CFunction        = Object_<unnamed>()
  CLI              = CLI_0x55d6fd984d30
  Call             = Call_0x55d6fd61b6e0
  Collector        = Collector_0x55d6fd5f8730
  Compiler         = Compiler_0x55d6fd5f7fc0
  Continue         = Continue_0x55d6fd61d250
  Coroutine        = Coroutine_0x55d6fd5d1ea0
  Date             = Date_0x55d6fd61ca00
  Debugger         = Debugger_0x55d6fd61ee10
  Directory        = Directory_0x55d6fd62b2a0
  DirectoryCollector = DirectoryCollector_0x55d6fd64f6a0
  DummyLine        = DummyLine_0x55d6fd6a5fc0
  Duration         = Duration_0x55d6fd5fe160
  DynLib           = DynLib_0x55d6fd600e10
  Eol              = Eol_0x55d6fd61d640
  Error            = Error_0x55d6fd624c90
  Exception        = Exception_0x55d6fd5fb320
  File             = File_0x55d6fd624eb0
  FileCollector    = FileCollector_0x55d6fd8e2a60
  Future           = Future_0x55d6fd6ae890
  FutureProxy      = FutureProxy_0x55d6fd6aeb90
  ImmutableSequence = ""
  Importer         = Importer_0x55d6fd5eb440
  List             = list()
  Locals           = nil
  Map              = Map_0x55d6fd623a90
  Message          = [unnamed]
  Normal           = Normal_0x55d6fd61cef0
  Notifier         = Notifier_0x55d6fd6989a0
  Number           = 0
  Object           = Object_0x55d6fd5d1cb0
  OperatorTable    = OperatorTable_0x55d6fd684c40
  Path             = Path_0x55d6fd931140
  Profiler         = Profiler_0x55d6fd601b20
  Return           = Return_0x55d6fd61d400
  RunnerMixIn      = RunnerMixIn_0x55d6fd8e1c90
  Sandbox          = Sandbox_0x55d6fd6002c0
  Scheduler        = Scheduler_0x55d6fd779880
  Sequence         = ""
  SerializationStream = SerializationStream_0x55d6fd8f79e0
  String           = ""
  System           = System_0x55d6fd60f2f0
  TestRunner       = TestRunner_0x55d6fd8f6e80
  TestSuite        = DirectoryCollector_0x55d6fd64f6a0
  UnitTest         = UnitTest_0x55d6fd8e1f60
  Vector           = ""
  WeakLink         = WeakLink_0x55d6fd5ffcf0
  false            = false
  nil              = nil
  tildeExpandsTo   = method(...)
  true             = true
  vector           = method(...)
)
