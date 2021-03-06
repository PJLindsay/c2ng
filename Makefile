#
# Makefile
#

OBJECTS_c2check = tools/c2check.o
CXX = $(CONFIG_C2NG_CXX)
LDFLAGS = $(CONFIG_AFL_LDFLAGS) $(CONFIG_C2NG_LDFLAGS)
LIBS = $(CONFIG_C2NG_LIBS)
OBJECTS_c2configtool = tools/c2configtool.o
OBJECTS_c2console = server/tools/c2console.o
OBJECTS_c2dbexport = server/tools/c2dbexport.o
OBJECTS_c2export = tools/c2export.o
OBJECTS_c2file-server = server/c2file.o
OBJECTS_c2fileclient = server/tools/c2fileclient.o
OBJECTS_c2format-server = server/c2format.o
OBJECTS_c2gfxgen = tools/c2gfxgen.o
OBJECTS_c2host-server = server/c2host.o
OBJECTS_c2mailin = server/tools/c2mailin.o
OBJECTS_c2mailout-server = server/c2mailout.o
OBJECTS_c2mgrep = tools/c2mgrep.o
OBJECTS_c2mkturn = tools/c2mkturn.o
OBJECTS_c2monitor-server = server/c2monitor.o
OBJECTS_c2ng = main/c2ng.o
OBJECTS_c2nntp-server = server/c2nntp.o
OBJECTS_c2plugin = tools/c2plugin.o
OBJECTS_c2pluginw = tools/c2pluginw.o
OBJECTS_c2rater = tools/c2rater.o
OBJECTS_c2script = tools/c2script.o
OBJECTS_c2sweep = tools/c2sweep.o
OBJECTS_c2talk-server = server/c2talk.o
OBJECTS_c2unpack = tools/c2unpack.o
OBJECTS_c2untrn = tools/c2untrn.o
OBJECTS_gamelib = game/actions/remotecontrolaction.o \
    game/ref/sortbynewlocation.o game/ref/sortbylocation.o \
    game/ref/sortbydamage.o game/ref/sortbybattleorder.o \
    game/ref/sortbyhullmass.o game/ref/sortbytowgroup.o \
    game/ref/sortbyfleet.o game/ref/sortbymass.o game/ref/configuration3.o \
    game/ref/sortbyhulltype.o game/ref/sortbyname.o game/ref/sortbyowner.o \
    game/ref/sortpredicate.o game/ref/nullpredicate.o game/ref/sortbyid.o \
    game/ref/listobserver.o game/ref/userlist.o game/ref/list.o \
    game/battleorderrule.o game/v3/fizzfile.o game/v3/directoryloader.o \
    game/v3/writer.o game/map/minefieldmission.o game/v3/udata/parser.o \
    game/v3/udata/reader.o game/alliance/hosthandler.o \
    game/alliance/phosthandler.o game/alliance/container.o \
    game/alliance/offer.o game/alliance/level.o game/v3/messagewriter.o \
    game/v3/utils.o game/v3/maketurnapplication.o game/v3/maketurn.o \
    game/v3/trn/fileset.o game/db/packer.o game/v3/unpackapplication.o \
    game/v3/unpacker.o game/v3/genfile.o util/helpindex.o \
    util/plugin/dialogapplication.o util/plugin/consoleapplication1.o \
    game/map/movementpredictor.o game/actions/changeshipfriendlycode.o \
    game/map/planetpredictor.o game/map/planeteffectors.o game/v3/registry.o \
    game/map/chunnelmission.o game/parser/format.o game/reference.o \
    game/msg/configuration2.o game/shipquery.o util/syntax/lisphighlighter.o \
    game/vcr/classic/mirroringeventlistener.o \
    util/syntax/pascalhighlighter.o game/vcr/classic/utils1.o \
    game/vcr/classic/eventrecorder.o game/vcr/classic/eventvisualizer.o \
    util/stringinstructionlist.o util/instructionlist.o game/vcr/overview.o \
    game/vcr/battle.o game/interface/completionlist.o \
    util/directorybrowser.o game/v3/check/configuration5.o \
    game/v3/check/application.o game/v3/check/checker.o \
    game/v3/trn/turnprocessor.o util/digest.o game/map/shippredictor.o \
    util/configurationfile.o game/v3/hconfig.o game/map/markings.o \
    game/map/markingvector.o game/db/fleetloader.o \
    game/interface/cargomethod.o game/actions/cargotransfersetup.o \
    game/map/shiptransporter.o game/actions/buildammo.o \
    game/test/interpreterinterface.o game/actions/buildship.o \
    game/map/basedata.o game/test/cargocontainer1.o \
    game/test/specificationloader1.o game/test/stringverifier2.o \
    game/test/registrationkey1.o game/actions/buildparts.o \
    game/actions/techupgrade.o game/actions/basebuildaction.o \
    game/map/shipstorage.o interpreter/exporter/format1.o \
    interpreter/exporter/configuration6.o util/charsetfactory.o \
    game/v3/packer1.o game/v3/undoinformation.o \
    game/actions/buildstructures.o game/v3/reverter.o \
    game/actions/buildstarbase.o game/actions/cargocostaction.o \
    game/map/planetstorage.o game/actions/cargotransfer.o \
    game/cargocontainer.o game/v3/outboxreader.o game/msg/outbox.o \
    util/processrunner.o interpreter/structurevaluedata.o \
    interpreter/structuretypedata.o interpreter/arraydata.o \
    game/maint/difficultyrater.o util/syntax/factory1.o \
    util/syntax/inihighlighter.o util/syntax/chighlighter.o \
    util/syntax/scripthighlighter.o util/syntax/keywordtable.o \
    util/syntax/segment.o util/syntax/nullhighlighter.o game/v3/trn/dumper.o \
    util/application4.o game/v3/trn/filter.o game/v3/trn/indexfilter.o \
    game/v3/trn/negatefilter.o game/v3/trn/orfilter.o \
    game/v3/trn/andfilter.o game/v3/trn/idfilter.o \
    game/v3/trn/stringfilter.o game/v3/trn/namefilter.o \
    game/v3/trn/constantfilter.o interpreter/vmio/assemblersavecontext.o \
    game/interface/commandinterface.o game/v3/commandextra.o \
    game/v3/commandcontainer.o game/v3/command.o util/prefixargument1.o \
    game/v3/controlfile.o util/stringlist.o util/messagenotifier.o \
    util/messagecollector.o util/messagematcher.o util/filenamepattern.o \
    game/maint/directorywrapper.o game/maint/sweeper.o \
    game/interface/minefieldmethod.o util/rich/alignmentattribute.o \
    interpreter/processobservercontext.o game/sim/loader2.o game/sim/setup.o \
    game/sim/planet1.o game/sim/ship1.o game/sim/configuration4.o \
    game/sim/object1.o game/interface/planetmethod.o \
    game/actions/preconditions.o game/actions/basefixrecycle.o \
    util/runlengthexpandtransform.o game/score/loader1.o util/stringparser.o \
    game/interface/explosionfunction.o game/interface/explosioncontext.o \
    game/interface/explosionproperty.o game/map/explosiontype.o \
    game/map/explosion.o interpreter/simpleprocedurevalue.o \
    interpreter/simpleindexablevalue.o interpreter/filefunctions.o \
    interpreter/filetable.o game/map/fleettype.o \
    interpreter/procedurevalue.o game/interface/shipmethod.o \
    game/map/shiputils.o game/map/fleet.o game/map/fleetmember.o \
    game/interface/vcrfunction.o game/interface/vcrcontext.o \
    game/interface/vcrsidefunction.o game/interface/vcrsidecontext.o \
    game/interface/vcrproperty.o game/interface/vcrsideproperty.o \
    game/interface/pluginfunction.o game/interface/plugincontext.o \
    game/interface/pluginproperty.o util/plugin/installer1.o \
    util/plugin/manager1.o util/plugin/plugin.o \
    game/interface/drawingmethod.o game/interface/drawingfunction.o \
    game/interface/drawingcontext.o game/interface/drawingproperty.o \
    util/io.o game/db/drawingatommap.o game/db/loader.o \
    game/map/drawingcontainer.o game/map/drawing.o \
    interpreter/vmio/nullloadcontext.o interpreter/vmio/nullsavecontext.o \
    interpreter/vmio/worldloadcontext.o interpreter/vmio/structures.o \
    interpreter/vmio/processloadcontext.o game/interface/loadcontext.o \
    interpreter/vmio/objectloader.o interpreter/blobvalue.o \
    interpreter/vmio/valueloader.o interpreter/mutexfunctions.o \
    interpreter/vmio/processsavecontext.o interpreter/mutexcontext.o \
    interpreter/mutexlist.o interpreter/vmio/filesavecontext.o \
    game/interface/ufofunction.o game/interface/ufocontext.o \
    game/interface/ufoproperty.o game/map/ufotype.o game/map/ufo.o \
    game/interface/missionfunction.o game/interface/missioncontext.o \
    game/interface/missionproperty.o game/interface/cargofunctions.o \
    game/interface/friendlycodefunction.o \
    game/interface/friendlycodecontext.o \
    game/interface/friendlycodeproperty.o game/pcc/accountfolder1.o \
    game/pcc/gamefolder1.o game/pcc/serverdirectory.o \
    game/pcc/browserhandler1.o game/interface/globalcommands.o \
    game/interface/simpleprocedure.o game/historyturnlist.o \
    game/historyturn.o util/backupfile.o game/nu/turnloader.o \
    game/nu/specificationloader.o game/nu/gamestate.o \
    game/nu/registrationkey.o game/nu/stringverifier.o game/nu/gamefolder.o \
    game/nu/accountfolder.o game/interface/minefieldfunction.o \
    game/interface/minefieldcontext.o game/interface/minefieldproperty.o \
    game/map/minefieldtype.o game/map/minefield.o \
    game/interface/playerfunction.o game/interface/playercontext.o \
    game/interface/torpedofunction.o game/interface/torpedocontext.o \
    game/spec/torpedo.o game/interface/hullfunction.o \
    game/interface/hullcontext.o game/interface/hullproperty.o \
    game/interface/beamfunction.o game/interface/beamcontext.o \
    game/interface/enginefunction.o game/interface/enginecontext.o \
    game/interface/engineproperty.o game/interface/weaponproperty.o \
    game/interface/componentproperty.o interpreter/exporter/htmlexporter.o \
    game/interface/userinterfacepropertystack.o game/extracontainer.o \
    game/map/renderer2.o game/map/viewport.o game/map/renderoptions.o \
    game/map/renderlist.o game/teamsettings.o \
    game/interface/ionstormfunction.o game/interface/ionstormcontext.o \
    game/interface/ionstormproperty.o game/tables/ionstormclassname.o \
    game/tables/wormholestabilityname.o \
    game/tables/mineraldensityclassname.o game/tables/headingname.o \
    game/map/ionstormtype.o game/map/ionstorm.o \
    game/interface/globalfunctions.o game/interface/objectcommand.o \
    game/interface/iteratorcontext.o game/map/objectobserver.o \
    game/interface/richtextfunctions.o game/interface/richtextvalue.o \
    game/interface/simplefunction.o game/stringverifier1.o \
    game/v3/stringverifier3.o game/map/cursors.o \
    game/map/simpleobjectcursor.o game/map/objectcursor.o util/keystring.o \
    game/spec/basecomponentvector.o game/interface/shipfunction.o \
    game/interface/shipcontext.o game/interface/shipproperty.o \
    game/browser/handlerlist.o game/msg/inbox.o game/exception.o \
    game/browser/session1.o game/browser/usercallbackproxy.o \
    util/rich/parser3.o game/nu/browserhandler.o \
    game/browser/unsupportedaccountfolder.o util/rich/linkattribute.o \
    util/rich/styleattribute.o util/skincolor.o util/rich/colorattribute.o \
    util/rich/visitor.o util/rich/text.o util/profiledirectory.o \
    game/browser/accountmanager.o game/browser/account.o \
    util/requestthread.o game/browser/directoryhandler.o \
    game/browser/filesystemrootfolder.o game/browser/rootfolder.o \
    game/browser/filesystemfolder.o game/browser/browser.o \
    game/score/compoundscore.o game/score/turnscorelist.o \
    game/score/turnscore.o game/interface/playerproperty.o \
    interpreter/exporter/jsonexporter.o interpreter/exporter/textexporter.o \
    interpreter/exporter/dbfexporter.o util/constantanswerprovider.o \
    interpreter/exporter/separatedtextexporter.o \
    interpreter/exporter/exporter.o interpreter/exporter/fieldlist.o \
    interpreter/processlist.o game/interface/globalcontext.o \
    game/interface/globalproperty.o game/interface/planetfunction.o \
    game/interface/planetcontext.o interpreter/objectpropertyvector.o \
    game/tables/basemissionname.o game/interface/baseproperty.o \
    game/map/historyshiptype.o game/map/playedshiptype.o \
    game/map/anyshiptype.o game/tables/happinesschangename.o \
    game/map/planetformula.o game/map/shiphistorydata.o game/map/shipdata.o \
    game/map/ship.o game/spec/missionlist.o game/spec/mission.o \
    game/shipbuildorder.o game/tables/mineralmassclassname.o \
    game/tables/happinessname.o game/tables/temperaturename.o \
    game/tables/industrylevel.o game/tables/nativegovernmentname.o \
    game/tables/nativeracename.o interpreter/closure.o \
    interpreter/hashvalue.o game/interface/planetproperty.o \
    interpreter/savevisitor.o game/session2.o game/game.o \
    game/unitscoredefinitionlist.o game/unitscorelist.o \
    interpreter/selectionexpression.o interpreter/filecommandsource.o \
    interpreter/filevalue.o interpreter/subroutinevalue.o \
    interpreter/memorycommandsource.o interpreter/binaryexecution.o \
    interpreter/indexablevalue.o interpreter/arguments.o \
    interpreter/arrayvalue.o interpreter/process.o \
    interpreter/structurevalue.o interpreter/structuretype.o \
    interpreter/basevalue.o interpreter/ternaryexecution.o \
    interpreter/keymapvalue.o interpreter/unaryexecution.o \
    util/keymaptable.o util/keymap.o util/atomtable.o util/key.o \
    interpreter/singlecontext.o interpreter/propertyacceptor.o \
    interpreter/nametable.o interpreter/simplespecialcommand.o \
    interpreter/defaultstatementcompilationcontext.o interpreter/keywords.o \
    interpreter/statementcompiler.o interpreter/commandsource.o \
    interpreter/statementcompilationcontext.o interpreter/context.o \
    game/parser/messageparser.o game/parser/messagetemplate.o \
    game/map/rangeset.o game/v3/inboxfile.o game/parser/messageinformation.o \
    game/parser/messagevalue.o game/turnloader1.o game/v3/loader3.o \
    game/playerbitmatrix.o game/v3/resultloader.o game/turn.o \
    interpreter/optimizer.o interpreter/fusion.o interpreter/world.o \
    interpreter/values1.o interpreter/expr/parser1.o \
    interpreter/expr/builtinfunction.o interpreter/ternaryoperation.o \
    interpreter/unaryoperation.o interpreter/binaryoperation.o \
    interpreter/expr/indirectcallnode.o interpreter/expr/functioncallnode.o \
    interpreter/expr/identifiernode.o interpreter/expr/membernode.o \
    interpreter/expr/logicalnode.o interpreter/expr/sequencenode.o \
    interpreter/expr/assignmentnode.o interpreter/expr/casenode.o \
    interpreter/expr/simplenode.o interpreter/expr/simplervaluenode.o \
    interpreter/expr/literalnode.o interpreter/expr/rvaluenode.o \
    interpreter/expr/node.o interpreter/bytecodeobject.o \
    interpreter/opcode.o util/math.o interpreter/error.o \
    interpreter/tokenizer.o game/config/userconfiguration.o \
    game/map/anyplanettype.o game/map/playedbasetype.o \
    game/map/playedplanettype.o game/map/objecttype.o game/map/universe.o \
    game/map/configuration1.o game/map/basestorage.o game/map/planet.o \
    game/map/circularobject.o game/map/mapobject.o game/map/point.o \
    game/map/object.o game/spec/friendlycodelist.o game/spec/friendlycode.o \
    game/vcr/classic/database.o game/vcr/statistic.o game/vcr/score.o \
    game/vcr/classic/pvcralgorithm.o game/vcr/classic/statustoken.o \
    game/vcr/classic/hostalgorithm.o game/vcr/classic/nullvisualizer.o \
    game/vcr/classic/algorithm.o game/vcr/classic/battle1.o \
    game/spec/standardcomponentnameprovider.o game/vcr/object2.o \
    util/consolelogger.o game/v3/rootloader.o game/v3/directoryscanner.o \
    util/randomnumbergenerator.o game/v3/turnfile.o game/timestamp.o \
    game/spec/nullcomponentnameprovider.o game/config/configurationparser.o \
    util/configurationfileparser.o game/playerlist1.o game/player1.o \
    game/root.o game/spec/hullassignmentlist.o game/v3/registrationkey2.o \
    game/hostversion.o game/spec/hullfunctionassignmentlist.o \
    game/spec/hull.o game/config/aliasoption.o game/config/costarrayoption.o \
    game/config/hostconfiguration.o game/config/enumvalueparser.o \
    game/config/bitsetvalueparser.o game/config/genericintegerarrayoption.o \
    game/config/stringoption.o game/config/integeroption.o \
    game/config/configuration.o game/config/booleanvalueparser.o \
    game/config/integervalueparser.o game/config/valueparser.o \
    game/config/configurationoption.o game/spec/modifiedhullfunctionlist.o \
    game/spec/hullfunctionlist.o util/string.o game/spec/hullfunction1.o \
    game/playerset.o game/experiencelevelset.o \
    game/spec/basichullfunctionlist.o game/spec/basichullfunction.o \
    util/fileparser.o game/v3/resultfile.o game/cargospec.o \
    game/v3/specificationloader2.o game/spec/shiplist.o game/spec/engine.o \
    game/spec/torpedolauncher.o game/spec/beam.o game/spec/weapon.o \
    game/spec/component.o game/spec/cost.o game/element.o
AR = $(CONFIG_C2NG_AR)
OBJECTS_guilib = client/proxy/hullspecificationproxy.o \
    client/proxy/playerproxy.o client/widgets/hullspecificationsheet.o \
    client/widgets/playerlist.o client/tiles/visualscanshipinfotile.o \
    client/tiles/visualscanhullinfotile.o client/dialogs/visualscandialog.o \
    client/tiles/visualscanheadertile.o client/proxy/referencelistproxy.o \
    client/proxy/cursorobserverproxy.o client/proxy/referenceobserverproxy.o \
    gfx/dimbackgroundcolorscheme.o gfx/dimcolorscheme.o \
    client/dialogs/referencesortorder.o client/widgets/referencelistbox.o \
    client/si/requestlink2.o client/widgets/alliancelevelgrid.o \
    client/dialogs/alliancedialog.o client/widgets/alliancestatuslist.o \
    client/help.o client/tiles/shipmovementtile.o ui/widgets/textbutton.o \
    client/tiles/shipcargotile.o ui/widgets/simpletable.o \
    client/widgets/simplegauge.o client/dialogs/inboxdialog.o \
    client/widgets/messageactionpanel.o client/vcr/classic/event.o \
    client/vcr/classic/interleavedscheduler.o gfx/scan.o \
    client/vcr/classic/playbackscreen.o \
    client/vcr/classic/standardscheduler.o \
    client/vcr/classic/traditionalscheduler.o client/vcr/classic/renderer1.o \
    client/vcr/classic/player.o gfx/gen/texture.o gfx/gen/colorrange.o \
    client/vcr/playbackcontrolwidget.o client/vcr/unitstatuswidget.o \
    ui/res/winplanvcrprovider.o gfx/gen/shieldrenderer.o \
    gfx/gen/explosionrenderer.o gfx/gen/particlerenderer.o \
    client/vcr/torpedosprite.o client/vcr/beamsprite.o gfx/anim/textsprite.o \
    gfx/anim/pixmapsprite.o ui/widgets/spritewidget.o gfx/anim/controller.o \
    gfx/anim/sprite.o client/dialogs/classicvcrdialog.o \
    client/widgets/classicvcrinfo.o ui/widgets/panel.o \
    ui/pixmapcolorscheme.o gfx/application1.o gfx/sdl2/streaminterface1.o \
    gfx/sdl2/surface1.o gfx/sdl2/engine2.o gfx/gen/orbitconfig.o \
    client/imageloader.o client/dialogs/directoryselectiondialog.o \
    ui/widgets/standarddialogbuttons.o client/dialogs/folderconfigdialog.o \
    client/downlink.o ui/widgets/menuframe.o ui/widgets/optiongrid.o \
    ui/res/generatedplanetprovider.o gfx/gen/planet2.o \
    gfx/gen/planetconfig.o gfx/gen/application2.o gfx/basecontext.o \
    client/widgets/commanddataview.o ui/rich/draw1.o ui/rich/splitter.o \
    client/widgets/standarddataview.o client/widgets/collapsibledataview.o \
    ui/layout/grid.o client/widgets/comment.o ui/layout/flow.o \
    ui/widgets/quit.o ui/widgets/radiobutton.o ui/widgets/checkbox.o \
    ui/screenshotlistener.o gfx/save.o ui/widgets/abstractcheckbox.o \
    gfx/nullresourceprovider.o ui/prefixargument.o \
    client/si/stringlistdialogwidget.o client/si/listboxfunction.o \
    ui/widgets/stringlistbox.o gfx/defaultfont.o \
    client/widgets/consoleview.o client/si/widgetindexedproperty.o \
    client/si/widgetextraproperty.o client/si/widgetreference.o \
    client/si/widgetwrapper.o client/tiles/basescreenheadertile.o \
    client/tiles/planetscreenheadertile.o ui/widgets/transparentwindow.o \
    gfx/gen/perlinnoise.o gfx/gen/spaceviewconfig.o gfx/gen/spaceview.o \
    client/si/values.o client/si/widgetproperty.o \
    client/si/genericwidgetvalue.o client/si/dialogfunction.o \
    client/si/widgetcommandvalue.o client/si/widgetfunctionvalue.o \
    client/si/widgetvalue.o client/si/widgetfunction.o \
    client/si/widgetcommand.o client/si/widgetholder.o \
    ui/res/winplanbitmapprovider.o ui/res/factory.o \
    ui/res/resourcefileprovider.o ui/res/resourcefile.o ui/res/resid.o \
    client/plugins.o client/widgets/controlscreenheader.o \
    client/tiles/shipscreenheadertile.o ui/widgets/imagebutton.o \
    ui/widgets/framegroup.o client/dialogs/turnlistdialog.o \
    client/widgets/turnlistbox.o client/tiles/errortile.o \
    client/tiles/tilefactory.o ui/widgets/focusiterator.o \
    client/screens/playerscreen.o client/screens/controlscreen.o \
    client/map/widget.o client/map/proxy.o client/map/renderer.o \
    client/dialogs/consoledialog.o client/si/outputstate.o \
    client/si/inputstate.o client/dialogs/objectselectiondialog.o \
    gfx/nullengine.o client/tiles/selectionheadertile.o client/session.o \
    client/marker.o client/si/commands.o client/widgets/keymapwidget.o \
    client/si/control.o client/si/userside.o client/si/scriptside.o \
    client/si/scriptprocedure.o ui/dialogs/messagebox.o ui/rich/statictext.o \
    client/widgets/busyindicator.o ui/widgets/tiledpanel.o \
    ui/widgets/keydispatcher.o ui/invisiblewidget.o client/usercallback.o \
    client/screens/browserscreen.o ui/widgets/richlistbox.o \
    ui/rich/imageobject.o ui/rich/documentview.o ui/rich/document.o \
    ui/widgets/statictext1.o ui/widgets/inputline.o \
    ui/widgets/simpleiconbox.o ui/widgets/iconbox.o ui/group1.o \
    client/widgets/folderlistbox.o ui/eventloop.o ui/skincolorscheme.o \
    gfx/clipfilter.o ui/scrollablewidget.o ui/widgets/abstractlistbox.o \
    ui/res/provider.o ui/res/directoryprovider.o ui/res/manager.o gfx/blit.o \
    ui/res/ccimageloader.o ui/res/engineimageloader.o gfx/timerqueue.o \
    gfx/rgbapixmap.o gfx/palettizedpixmap.o gfx/types.o gfx/canvas.o \
    gfx/point1.o ui/widgets/button.o ui/widgets/abstractbutton.o ui/window.o \
    ui/draw.o ui/defaultresourceprovider.o gfx/fontlist.o gfx/fontrequest.o \
    ui/spacer.o ui/layoutablegroup.o ui/layout/vbox.o ui/layout/axislayout.o \
    ui/layout/hbox.o ui/colorscheme.o gfx/complex.o \
    gfx/sdl/streaminterface.o gfx/multiclipfilter.o gfx/filter1.o ui/root8.o \
    ui/simplewidget.o ui/layout/info.o ui/cardgroup.o ui/widget1.o \
    gfx/bitmapfont.o gfx/bitmapglyph.o gfx/font.o gfx/nullcolorscheme.o \
    gfx/graphicsexception.o gfx/sdl/engine1.o gfx/sdl/surface.o \
    gfx/nullcanvas.o gfx/rectangleset.o gfx/rectangle.o gfx/fillpattern.o
OBJECTS_serverlib = server/host/file/historyslotitem.o \
    server/host/file/historyturnitem.o server/host/file/historyitem.o \
    server/host/file/gameslotitem.o server/host/file/gameitem.o \
    server/host/file/gamerootitem.o server/host/file/fileitem1.o \
    server/host/file/toolitem.o server/host/file/toolrootitem.o \
    server/host/file/rootitem.o server/host/file/item1.o \
    server/host/hostfile.o server/interface/hostfileclient.o \
    server/interface/hostfile1.o server/interface/hostfileserver.o \
    server/host/actions.o server/file/directorypage.o \
    server/monitor/timeserieswriter.o server/monitor/timeseriesloader.o \
    server/monitor/timeseries.o server/monitor/loadaverageobserver.o \
    server/monitor/statusobserver.o server/monitor/badnessfileobserver.o \
    server/monitor/statuspage.o server/monitor/status.o \
    server/monitor/networkobserver.o server/monitor/serverapplication4.o \
    server/mailout/transmitterimpl.o server/mailout/root5.o \
    server/mailout/template.o server/mailout/message.o \
    server/mailout/mailqueue.o server/mailout/commandhandler2.o \
    server/mailout/configuration8.o server/mailout/serverapplication3.o \
    server/dbexport/dbexporter.o server/dbexport/exportapplication.o \
    server/nntp/root6.o server/nntp/linehandler.o \
    server/nntp/serverapplication5.o server/console/routercontextfactory.o \
    server/interface/sessionrouter.o server/interface/sessionrouterclient.o \
    server/console/nullterminal.o server/console/connectioncontextfactory.o \
    server/console/pipeterminal.o server/console/dumbterminal.o \
    server/console/colorterminal.o server/console/terminal.o \
    server/console/filecommandhandler.o \
    server/console/stringcommandhandler.o \
    server/console/integercommandhandler.o \
    server/console/arcanecommandhandler.o \
    server/console/fundamentalcommandhandler.o \
    server/console/macrocommandhandler.o server/console/parser2.o \
    server/console/environment.o server/console/consoleapplication.o \
    server/mailin/mailinapplication.o server/file/clientdirectory.o \
    server/format/serverapplication1.o server/file/clientapplication.o \
    server/file/serverapplication.o server/talk/serverapplication6.o \
    server/host/user1.o server/common/user.o \
    server/host/serverapplication2.o server/common/root1.o \
    server/mailin/mailprocessor.o server/file/internalfileserver.o \
    server/host/resultsender.o server/host/gamerating.o \
    server/host/rank/victory.o server/host/rank/levelhandler.o \
    server/host/rank/scorefilereader.o server/host/exec.o \
    server/host/rank/refereefilereader.o server/host/rank/rank.o \
    server/host/cronimpl.o server/host/hostcron.o server/host/hostschedule.o \
    server/host/hostturn.o server/host/configurationbuilder.o \
    server/host/exporter1.o server/host/installer.o \
    server/common/racenames.o server/host/hostplayer.o \
    server/host/session4.o server/host/hostgame.o server/host/gamearbiter.o \
    server/interface/hostplayerserver.o server/interface/hostplayerclient.o \
    server/interface/hostturnserver.o server/interface/hostturnclient.o \
    server/interface/hostturn1.o server/interface/hostgameserver.o \
    server/interface/hostscheduleserver.o \
    server/interface/hostscheduleclient.o server/interface/hostgameclient.o \
    server/host/talkadapter.o server/host/gamecreator.o \
    server/interface/hostplayer1.o server/interface/hostschedule1.o \
    server/interface/hostgame1.o server/host/schedule.o \
    server/host/configuration7.o server/host/game1.o server/host/hosttool.o \
    server/host/root4.o server/host/commandhandler1.o \
    server/interface/hostcronserver.o server/interface/hosttool1.o \
    server/interface/hosttoolserver.o server/interface/hosttoolclient.o \
    server/interface/composablecommandhandler.o \
    server/configurationhandler.o server/common/session3.o \
    server/interface/hostcronclient.o server/file/directorywrapper1.o \
    server/file/clientdirectoryhandler.o \
    server/file/ca/internalobjectcache.o \
    server/file/ca/internalreferencecounter.o \
    server/file/directoryhandlerfactory.o server/file/directoryhandler2.o \
    server/file/utils2.o server/file/ca/commit.o server/file/ca/root2.o \
    server/file/ca/directoryhandler1.o server/file/ca/directoryentry.o \
    server/file/ca/objectid.o server/file/ca/objectstore.o \
    server/file/internaldirectoryhandler.o server/file/racenames1.o \
    server/file/filegame.o server/file/gamestatus.o \
    server/interface/filegameserver.o server/interface/filegameclient.o \
    server/file/pathresolver.o server/file/filebase.o \
    server/file/directoryitem.o server/file/fileitem.o \
    server/file/filesystemhandler.o server/file/item.o server/file/root3.o \
    server/file/commandhandler.o server/interface/filebaseserver.o \
    server/interface/filebaseclient.o server/interface/filebase1.o \
    server/talk/configuration9.o server/interface/baseclient.o \
    server/talk/talknntp.o server/interface/talknntpserver.o \
    server/interface/talknntpclient.o server/talk/talkpm.o \
    server/talk/userpm.o server/interface/talkpmserver.o \
    server/interface/talkpmclient.o server/talk/talkfolder.o \
    server/talk/userfolder.o server/interface/talkfolderserver.o \
    server/interface/talkfolderclient.o server/talk/spam.o \
    server/talk/talkuser.o server/interface/talkuserserver.o \
    server/interface/talkuserclient.o server/talk/newsrc.o \
    server/talk/talkthread.o server/interface/talkthreadserver.o \
    server/interface/talkthreadclient.o server/talk/notify.o \
    server/talk/talkforum1.o server/interface/talkforum.o \
    server/interface/talkforumserver.o server/interface/talkforumclient.o \
    server/interface/mailqueueserver.o server/interface/mailqueueclient.o \
    server/talk/talkpost.o server/interface/talkpostserver.o \
    server/interface/talkpostclient.o server/talk/accesschecker.o \
    server/talk/render/bbrenderer.o server/talk/render/mailrenderer.o \
    server/talk/render/htmlrenderer.o server/talk/parse/bbparser.o \
    server/talk/parse/bblexer.o server/talk/util.o server/talk/user2.o \
    server/interface/talkgroupclient.o server/talk/talkgroup.o \
    server/interface/talkgroupserver.o server/talk/talkrender.o \
    server/interface/talkrenderserver.o server/interface/talkrenderclient.o \
    server/talk/render/render.o server/talk/forum.o server/talk/topic.o \
    server/talk/render/options.o server/talk/render/context1.o \
    server/talk/render/textrenderer.o server/talk/message1.o \
    server/talk/linkformatter.o server/talk/textnode.o server/talk/group.o \
    server/types1.o server/talk/talksyntax.o \
    server/interface/talksyntaxserver.o server/interface/talksyntaxclient.o \
    server/talk/commandhandler3.o server/talk/root7.o server/talk/session5.o \
    server/talk/inlinerecognizer.o server/format/simpacker.o \
    server/format/truehullpacker.o server/format/enginepacker.o \
    server/format/hullpacker.o server/format/torpedopacker.o \
    server/format/utils3.o server/format/beampacker.o server/application3.o \
    server/format/format2.o server/interface/formatserver.o \
    server/format/stringpacker.o server/interface/formatclient.o
OBJECTS_testsuite = u/t_client_proxy_objectlistener.o \
    u/t_game_alliance_level.o u/t_util_helpindex.o \
    u/t_server_host_hostfile.o u/t_server_host_file_rootitem.o \
    u/t_server_host_file_gamerootitem.o u/t_server_host_file_toolitem.o \
    u/t_server_host_file_item.o u/t_server_host_file_fileitem.o \
    u/t_server_interface_hostfileserver.o \
    u/t_server_interface_hostfileclient.o u/t_server_interface_hostfile.o \
    u/t_game_map_movementpredictor.o u/t_game_v3_reverter.o \
    u/t_game_map_ship.o u/t_game_map_planetpredictor.o u/t_util_updater.o \
    u/t_game_vcr_classic_utils.o \
    u/t_game_vcr_classic_mirroringeventlistener.o u/t_gfx_scan.o \
    u/t_gfx_anim_sprite.o u/t_gfx_anim_controller.o \
    u/t_util_syntax_lisphighlighter.o u/t_gfx_gen_colorrange.o \
    u/t_util_syntax_pascalhighlighter.o u/t_game_vcr_classic_eventrecorder.o \
    u/t_game_vcr_classic_eventlistener.o u/t_util_stringinstructionlist.o \
    u/t_util_instructionlist.o u/t_game_map_renderlist.o \
    u/t_game_config_userconfiguration.o u/t_client_si_contextreceiver.o \
    u/t_client_downlink.o u/t_server_application.o \
    u/t_game_v3_resultloader.o u/t_util_digest.o \
    u/t_util_configurationfile.o u/t_server_monitor_timeseriesloader.o \
    u/t_server_monitor_timeserieswriter.o u/t_game_v3_hconfig.o \
    u/t_server_monitor_statusobserver.o u/t_server_monitor_timeseries.o \
    u/t_game_map_markings.o u/t_game_map_markingvector.o \
    u/t_gfx_sdl_streaminterface.o u/t_game_map_fleetmember.o \
    u/t_game_db_fleetloader.o u/t_gfx_gen_planetconfig.o \
    u/t_gfx_gen_planet.o u/t_gfx_gen_vector3d.o \
    u/t_game_actions_cargotransfersetup.o u/t_game_actions_cargotransfer.o \
    u/t_game_actions_buildammo.o u/t_game_actions_buildship.o \
    u/t_game_actions_buildstarbase.o u/t_game_actions_buildstructures.o \
    u/t_game_actions_techupgrade.o u/t_game_v3_undoinformation.o \
    u/t_game_actions_buildparts.o u/t_game_actions_basebuildaction.o \
    u/t_game_actions_basebuildexecutor.o u/t_server_monitor_status.o \
    u/t_interpreter_exporter_configuration.o \
    u/t_interpreter_exporter_format.o u/t_util_charsetfactory.o \
    u/t_game_interface_engineproperty.o u/t_game_v3_packer.o \
    u/t_game_v3_loader.o u/t_game_actions_cargocostaction.o \
    u/t_game_cargocontainer.o u/t_game_v3_outboxreader.o \
    u/t_game_msg_outbox.o u/t_server_monitor_badnessfileobserver.o \
    u/t_server_monitor_observer.o u/t_server_mailout_transmitterimpl.o \
    u/t_server_mailout_root.o u/t_server_mailout_commandhandler.o \
    u/t_server_mailout_mailqueue.o u/t_server_mailout_message.o \
    u/t_server_mailout_template.o u/t_server_mailout_session.o \
    u/t_server_mailout_configuration.o u/t_server_mailout_transmitter.o \
    u/t_server_dbexport_dbexporter.o u/t_server_nntp_root.o \
    u/t_server_console_routercontextfactory.o \
    u/t_server_console_fundamentalcommandhandler.o \
    u/helper/consolecommandhandlermock.o u/t_server_console_pipeterminal.o \
    u/t_server_console_dumbterminal.o u/t_server_console_colorterminal.o \
    u/t_server_console_integercommandhandler.o \
    u/t_server_console_stringcommandhandler.o \
    u/t_server_console_nullterminal.o u/t_server_console_parser.o \
    u/t_server_console_environment.o u/t_server_console_commandhandler.o \
    u/t_server_console_contextfactory.o u/t_server_console_context.o \
    u/t_server_console_terminal.o u/t_server_mailin_mailinapplication.o \
    u/t_server_file_clientdirectory.o u/t_server_errors.o \
    u/t_server_talk_session.o u/t_game_vcr_classic_types.o \
    u/t_server_host_resultsender.o u/t_server_common_user.o \
    u/t_server_common_sessionprotocolhandlerfactory.o \
    u/t_server_common_sessionprotocolhandler.o u/t_server_common_root.o \
    u/t_server_mailin_mailprocessor.o u/t_server_host_commandhandler.o \
    u/t_server_host_hostturn.o u/t_server_host_hostschedule.o \
    u/t_server_host_hostplayer.o u/t_server_host_hostgame.o \
    u/t_server_common_racenames.o u/t_server_host_installer.o \
    u/t_server_file_internalfileserver.o u/t_server_host_game.o \
    u/t_server_host_cronimpl.o u/t_server_host_exporter.o \
    u/t_server_host_configuration.o u/t_server_host_hostcron.o \
    u/t_server_host_hosttool.o u/t_server_host_talkadapter.o \
    u/t_server_host_rank_victory.o u/t_server_host_rank_levelhandler.o \
    u/t_server_host_cron.o u/t_server_interface_sessionrouter.o \
    u/t_server_host_rank_scorefilereader.o \
    u/t_server_host_rank_refereefilereader.o u/t_server_host_rank_rank.o \
    u/t_server_host_configurationbuilder.o u/t_server_host_gamearbiter.o \
    u/t_server_interface_hostplayerserver.o \
    u/t_server_interface_hostplayerclient.o \
    u/t_server_interface_hostturnserver.o \
    u/t_server_interface_hostturnclient.o \
    u/t_server_interface_hostgameserver.o \
    u/t_server_interface_hostscheduleserver.o \
    u/t_server_interface_hostscheduleclient.o \
    u/t_server_interface_hostgameclient.o u/t_server_host_gamecreator.o \
    u/t_server_host_talklistener.o u/t_server_interface_hostplayer.o \
    u/t_server_interface_hostturn.o u/t_server_interface_hostschedule.o \
    u/t_server_interface_hostgame.o u/t_server_host_schedule.o \
    u/t_util_processrunner.o u/t_server_host_session.o \
    u/t_server_interface_hosttoolserver.o \
    u/t_server_interface_hosttoolclient.o \
    u/t_server_interface_hostcronserver.o u/t_server_interface_hosttool.o \
    u/t_interpreter_vmio_filesavecontext.o \
    u/t_interpreter_vmio_processsavecontext.o \
    u/t_interpreter_vmio_structures.o \
    u/t_interpreter_vmio_processloadcontext.o u/t_gfx_filter.o \
    u/t_game_config_stringoption.o u/t_game_config_integerarrayoption.o \
    u/t_gfx_font.o u/t_game_config_enumvalueparser.o u/t_gfx_bitmapfont.o \
    u/t_gfx_bitmapglyph.o u/t_gfx_primitives.o u/t_gfx_pixmapcanvasimpl.o \
    u/t_gfx_fontlist.o u/t_gfx_context.o u/t_gfx_nullcolorscheme.o \
    u/t_gfx_colorscheme.o u/t_gfx_basecontext.o u/t_gfx_rgbapixmap.o \
    u/t_gfx_fontrequest.o u/t_gfx_palettizedpixmap.o \
    u/t_gfx_gen_spaceviewconfig.o u/t_gfx_gen_spaceview.o \
    u/t_game_sim_setup.o u/t_game_sim_configuration.o u/t_game_sim_ability.o \
    u/t_server_configurationhandler.o u/t_interpreter_opcode.o \
    u/t_interpreter_keymapvalue.o u/t_interpreter_simplespecialcommand.o \
    u/t_interpreter_memorycommandsource.o u/t_interpreter_fusion.o \
    u/t_interpreter_filetable.o u/t_interpreter_filevalue.o \
    u/t_gfx_graphicsexception.o u/t_interpreter_filecommandsource.o \
    u/t_interpreter_defaultstatementcompilationcontext.o \
    u/t_interpreter_compilationcontext.o u/t_interpreter_propertyacceptor.o \
    u/t_interpreter_contextprovider.o u/t_interpreter_callablevalue.o \
    u/t_interpreter_basevalue.o u/t_interpreter_commandsource.o \
    u/t_interpreter_arrayvalue.o u/t_interpreter_arguments.o \
    u/t_interpreter_structurevalue.o u/t_interpreter_structurevaluedata.o \
    u/t_interpreter_structuretype.o u/t_interpreter_structuretypedata.o \
    u/t_interpreter_objectpropertyvector.o u/t_interpreter_world.o \
    u/t_interpreter_arraydata.o u/t_interpreter_hashvalue.o \
    u/t_util_rich_alignmentattribute.o u/t_util_syntax_format.o \
    u/t_game_sim_structures.o u/t_game_v3_structures.o \
    u/t_game_db_structures.o u/t_game_extra.o u/t_interpreter_savecontext.o \
    u/t_interpreter_specialcommand.o u/t_interpreter_typehint.o \
    u/t_interpreter_tagnode.o u/t_interpreter_exporter_exporter.o \
    u/t_interpreter_exporter_dbfexporter.o \
    u/t_interpreter_exporter_jsonexporter.o \
    u/t_interpreter_exporter_textexporter.o \
    u/t_interpreter_exporter_separatedtextexporter.o \
    u/t_interpreter_exporter_htmlexporter.o u/t_interpreter_filefunctions.o \
    u/t_game_parser_messageparser.o u/t_game_parser_messageinformation.o \
    u/t_game_parser_messagevalue.o u/t_game_root.o u/t_game_turn.o \
    u/t_game_playerset.o u/t_game_shipbuildorder.o u/t_game_spec_shiplist.o \
    u/t_game_spec_standardcomponentnameprovider.o u/t_game_spec_hull.o \
    u/t_game_spec_hullfunctionassignmentlist.o \
    u/t_game_spec_modifiedhullfunctionlist.o u/t_game_spec_hullfunction.o \
    u/t_game_spec_hullassignmentlist.o u/t_game_spec_mission.o \
    u/t_game_spec_basichullfunctionlist.o \
    u/t_game_spec_nullcomponentnameprovider.o u/t_game_spec_torpedo.o \
    u/t_game_spec_torpedolauncher.o u/t_game_spec_beam.o \
    u/t_game_spec_weapon.o u/t_game_spec_basichullfunction.o \
    u/t_game_spec_basecomponentvector.o u/t_game_score_loader.o \
    u/t_game_score_compoundscore.o u/t_game_score_turnscorelist.o \
    u/t_game_score_turnscore.o u/t_server_talk_render_bbrenderer.o \
    u/t_game_map_ionstorm.o u/t_game_maint_sweeper.o \
    u/t_server_format_format.o u/t_server_format_truehullpacker.o \
    u/t_server_format_stringpacker.o u/t_server_format_hullpacker.o \
    u/t_server_format_enginepacker.o u/t_server_format_torpedopacker.o \
    u/t_server_format_beampacker.o \
    u/t_server_interface_composablecommandhandler.o \
    u/t_server_talk_commandhandler.o u/t_server_talk_talknntp.o \
    u/t_server_talk_talkthread.o u/t_server_talk_talkfolder.o \
    u/t_server_talk_talkgroup.o u/t_server_talk_userfolder.o \
    u/t_server_talk_topic.o u/t_server_talk_user.o \
    u/t_server_talk_talkforum.o u/t_server_talk_talkrender.o \
    u/t_interpreter_vmio_objectloader.o u/t_server_common_session.o \
    u/t_server_interface_hostcronclient.o u/t_server_interface_hostcron.o \
    u/t_util_io.o u/t_game_maint_difficultyrater.o \
    u/t_game_config_collapsibleintegerarrayoption.o \
    u/t_server_file_directorywrapper.o \
    u/t_server_file_clientdirectoryhandler.o \
    u/t_server_file_ca_internalobjectcache.o \
    u/t_server_file_ca_objectcache.o u/t_server_file_ca_referencecounter.o \
    u/t_server_file_ca_internalreferencecounter.o \
    u/t_server_file_directoryhandlerfactory.o u/t_server_file_utils.o \
    u/t_server_file_ca_root.o u/t_server_file_ca_directoryhandler.o \
    u/t_server_file_ca_referenceupdater.o u/t_server_file_ca_commit.o \
    u/t_server_file_ca_directoryentry.o u/t_server_file_ca_objectid.o \
    u/t_server_file_ca_objectstore.o u/t_server_file_filegame.o \
    u/t_server_file_racenames.o u/t_server_file_gamestatus.o u/files.o \
    u/t_server_interface_filegameserver.o \
    u/t_server_interface_filegameclient.o u/t_server_interface_filegame.o \
    u/t_server_file_commandhandler.o u/t_server_file_item.o \
    u/t_server_file_directoryhandler.o u/t_server_file_root.o \
    u/t_server_file_session.o u/t_server_file_filebase.o \
    u/t_ui_res_ccimageloader.o u/t_ui_res_engineimageloader.o \
    u/t_server_interface_filebaseserver.o \
    u/t_server_interface_filebaseclient.o u/t_server_interface_filebase.o \
    u/t_server_talk_message.o u/t_server_talk_accesschecker.o \
    u/t_server_talk_forum.o u/t_server_talk_configuration.o \
    u/t_server_talk_userpm.o u/t_server_interface_baseclient.o \
    u/t_server_interface_base.o u/t_server_interface_talknntpserver.o \
    u/t_server_interface_talknntpclient.o u/t_server_interface_talknntp.o \
    u/t_server_talk_talkpm.o u/t_server_interface_talkpmserver.o \
    u/t_server_interface_talkpmclient.o u/t_server_interface_talkpm.o \
    u/t_server_interface_talkfolderserver.o \
    u/t_server_interface_talkfolderclient.o \
    u/t_server_interface_talkfolder.o u/t_server_talk_render_htmlrenderer.o \
    u/t_server_talk_talkpost.o u/t_server_format_simpacker.o \
    u/t_server_talk_spam.o u/t_server_talk_talkuser.o \
    u/t_server_interface_talkuserserver.o \
    u/t_server_interface_talkuserclient.o u/t_server_interface_talkuser.o \
    u/t_server_talk_newsrc.o u/t_server_talk_talksyntax.o \
    u/t_server_talk_textnode.o u/t_server_interface_formatserver.o \
    u/t_server_interface_talkthreadserver.o \
    u/t_server_interface_talkthreadclient.o \
    u/t_server_interface_talkthread.o u/t_server_interface_talkgroupserver.o \
    u/t_server_interface_talkgroupclient.o u/t_server_talk_sorter.o \
    u/t_server_interface_talkforumserver.o \
    u/t_server_interface_talkforumclient.o u/t_server_interface_talkforum.o \
    u/t_server_interface_mailqueueserver.o \
    u/t_server_interface_mailqueueclient.o u/t_server_interface_mailqueue.o \
    u/t_server_interface_talkpostserver.o \
    u/t_server_interface_talkpostclient.o u/t_server_interface_talkpost.o \
    u/t_game_db_drawingatommap.o u/t_server_talk_parse_bbparser.o \
    u/t_server_talk_parse_bblexer.o u/t_server_interface_talkrenderserver.o \
    u/t_server_interface_talkrenderclient.o u/t_server_format_utils.o \
    u/t_server_talk_root.o u/t_server_talk_util.o \
    u/t_server_talk_render_context.o u/t_server_talk_render_options.o \
    u/t_server_interface_talksyntaxserver.o \
    u/t_server_interface_talksyntaxclient.o \
    u/t_server_interface_talkrender.o u/t_server_interface_talkgroup.o \
    u/t_server_talk_linkformatter.o u/t_server_talk_group.o \
    u/t_server_types.o u/t_server_interface_talksyntax.o \
    u/t_server_talk_inlinerecognizer.o u/t_server_format_packer.o \
    u/t_server_interface_formatclient.o u/t_server_interface_format.o \
    u/t_util_syntax_factory.o u/t_util_syntax_inihighlighter.o \
    u/t_util_syntax_chighlighter.o u/t_util_syntax_keywordtable.o \
    u/t_util_syntax_segment.o u/t_util_syntax_nullhighlighter.o \
    u/t_util_syntax_scripthighlighter.o u/t_util_syntax_highlighter.o \
    u/t_game_v3_trn_parseexception.o u/t_game_v3_trn_filter.o \
    u/t_game_v3_trn_namefilter.o u/t_game_v3_trn_stringfilter.o \
    u/t_game_v3_trn_idfilter.o u/t_game_v3_trn_negatefilter.o \
    u/t_game_v3_trn_orfilter.o u/t_game_v3_trn_indexfilter.o \
    u/t_game_v3_trn_andfilter.o u/t_game_v3_trn_constantfilter.o \
    u/t_util_application.o u/t_interpreter_vmio_nullloadcontext.o \
    u/t_interpreter_selectionexpression.o u/t_interpreter_ternaryoperation.o \
    u/t_interpreter_unaryoperation.o u/t_interpreter_binaryoperation.o \
    u/t_interpreter_optimizer.o u/t_gfx_basecolorscheme.o \
    u/t_ui_widgets_inputline.o u/t_game_v3_commandextra.o \
    u/t_game_v3_command.o u/t_game_v3_commandcontainer.o \
    u/t_client_si_widgetfunction.o u/t_ui_layout_grid.o u/t_ui_root.o \
    u/t_ui_widgets_radiobutton.o u/t_ui_widgets_checkbox.o \
    u/t_interpreter_error.o u/t_gfx_save.o u/t_gfx_nullresourceprovider.o \
    u/t_ui_widgets_abstractbutton.o u/t_ui_prefixargument.o \
    u/t_util_prefixargument.o u/t_game_v3_controlfile.o \
    u/t_util_stringlist.o u/t_util_fileparser.o \
    u/t_util_configurationfileparser.o u/t_gfx_defaultfont.o \
    u/t_util_messagenotifier.o u/t_util_messagecollector.o \
    u/t_util_messagematcher.o u/t_util_filenamepattern.o u/t_gfx_types.o \
    u/t_gfx_gen_perlinnoise.o u/t_client_si_scriptprocedure.o \
    u/t_client_si_usercall.o u/t_game_sim_loader.o u/t_game_sim_planet.o \
    u/t_game_sim_ship.o u/t_game_sim_object.o \
    u/t_game_actions_preconditions.o u/t_util_runlengthexpandtransform.o \
    u/t_util_stringparser.o u/t_ui_res_resid.o \
    u/t_game_interface_explosioncontext.o u/t_game_map_explosion.o \
    u/t_interpreter_procedurevalue.o u/t_util_plugin_plugin.o \
    u/t_game_playerlist.o u/t_interpreter_vmio_valueloader.o \
    u/t_interpreter_mutexlist.o u/t_interpreter_vmio_nullsavecontext.o \
    u/t_interpreter_vmio_loadcontext.o u/t_interpreter_blobvalue.o \
    u/t_game_interface_ufocontext.o u/t_game_interface_enginecontext.o \
    u/t_game_interface_friendlycodecontext.o \
    u/t_game_interface_missioncontext.o u/helper/contextverifier.o \
    u/t_interpreter_context.o u/t_game_config_genericintegerarrayoption.o \
    u/t_game_config_integeroption.o u/t_game_config_aliasoption.o \
    u/t_game_hostversion.o u/t_game_experiencelevelset.o \
    u/t_game_spec_engine.o u/t_game_historyturnlist.o u/t_game_element.o \
    u/t_game_historyturn.o u/t_game_turnloader.o u/t_game_registrationkey.o \
    u/t_game_specificationloader.o u/t_game_timestamp.o \
    u/t_util_backupfile.o u/t_interpreter_exporter_fieldlist.o \
    u/t_ui_widgets_focusiterator.o u/t_ui_colorscheme.o u/t_ui_widget.o \
    u/t_client_dialogs_objectselectiondialog.o u/t_game_game.o \
    u/t_game_interface_userinterfacepropertystack.o u/t_util_skincolor.o \
    u/t_util_math.o u/t_util_constantanswerprovider.o \
    u/t_util_answerprovider.o u/t_game_extraidentifier.o \
    u/t_game_extracontainer.o u/t_game_map_viewport.o \
    u/t_game_map_circularobject.o u/t_game_map_mapobject.o \
    u/t_game_map_object.o u/t_game_tables_basemissionname.o \
    u/t_game_teamsettings.o u/t_game_tables_ionstormclassname.o \
    u/t_game_tables_wormholestabilityname.o \
    u/t_game_tables_mineraldensityclassname.o u/t_game_tables_headingname.o \
    u/t_game_interface_iteratorprovider.o u/t_client_objectcursorfactory.o \
    u/t_client_si_control.o u/t_gfx_eventconsumer.o u/t_gfx_nullengine.o \
    u/t_client_si_contextprovider.o u/t_ui_res_imageloader.o \
    u/t_ui_res_manager.o u/t_interpreter_keywords.o u/t_game_vcr_score.o \
    u/t_game_vcr_object.o u/t_game_parser_datainterface.o \
    u/t_game_interface_richtextfunctions.o u/t_game_v3_stringverifier.o \
    u/t_game_stringverifier.o u/t_client_si_usertask.o \
    u/t_client_si_requestlink2.o u/t_client_si_requestlink1.o \
    u/t_game_cargospec.o u/t_game_interface_userinterfacepropertyaccessor.o \
    u/t_game_interface_userinterfaceproperty.o u/t_game_map_objectcursor.o \
    u/t_game_types.o u/t_game_interpreterinterface.o u/t_game_vcr_battle.o \
    u/t_game_vcr_database.o u/t_game_vcr_classic_statustoken.o \
    u/t_game_vcr_classic_algorithm.o u/t_game_vcr_classic_nullvisualizer.o \
    u/t_game_vcr_classic_visualizer.o u/t_game_spec_componentnameprovider.o \
    u/t_game_spec_componentvector.o u/t_game_spec_component.o \
    u/t_util_keystring.o u/t_interpreter_process.o \
    u/t_interpreter_processlist.o u/t_interpreter_bytecodeobject.o \
    u/t_util_slaverequestsender.o u/t_util_slaverequest.o \
    u/t_util_baseslaverequestsender.o u/t_util_baseslaverequest.o \
    u/t_util_slaveobject.o u/t_game_browser_handlerlist.o u/t_game_player.o \
    u/t_game_config_configurationoption.o u/t_game_config_costarrayoption.o \
    u/t_game_msg_mailbox.o u/t_game_browser_unsupportedaccountfolder.o \
    u/t_ui_invisiblewidget.o u/t_game_exception.o u/t_gfx_resourceprovider.o \
    u/t_ui_rich_imageobject.o u/t_util_rich_parser.o \
    u/t_ui_rich_blockobject.o u/t_gfx_canvas.o u/t_game_browser_account.o \
    u/t_util_unicodechars.o u/t_util_rich_visitor.o \
    u/t_util_rich_attribute.o u/t_util_rich_styleattribute.o \
    u/t_util_rich_linkattribute.o u/t_util_rich_colorattribute.o \
    u/t_util_rich_text.o u/t_gfx_engine.o u/t_util_requestthread.o \
    u/t_ui_group.o u/t_game_browser_handler.o u/t_game_browser_folder.o \
    u/t_ui_res_provider.o u/t_gfx_timerqueue.o u/t_gfx_timer.o \
    u/t_gfx_sdl_engine.o u/t_util_requestreceiver.o u/t_util_request.o \
    u/t_util_requestdispatcher.o u/t_gfx_nullcanvas.o \
    u/t_interpreter_nametable.o u/t_game_tables_happinesschangename.o \
    u/t_game_spec_missionlist.o u/t_game_tables_mineralmassclassname.o \
    u/t_game_tables_happinessname.o u/t_game_tables_temperaturename.o \
    u/t_game_tables_nativeracename.o u/t_game_tables_nativegovernmentname.o \
    u/t_game_tables_industrylevel.o u/t_interpreter_closure.o \
    u/t_interpreter_values.o u/t_game_unitscoredefinitionlist.o \
    u/t_game_unitscorelist.o u/t_interpreter_statementcompiler.o \
    u/t_interpreter_expr_builtinfunction.o u/t_interpreter_expr_parser.o \
    u/t_interpreter.o u/t_util_keymaptable.o u/t_util_keymap.o \
    u/t_util_atomtable.o u/t_util_key.o u/t_game_parser_messagetemplate.o \
    u/t_game_playerbitmatrix.o u/t_game_playerarray.o \
    u/t_interpreter_tokenizer.o u/t_game_spec_friendlycodelist.o \
    u/t_game_spec_friendlycode.o u/t_game_map_configuration.o \
    u/t_game_map_point.o u/t_game_vcr_classic_pvcralgorithm.o \
    u/t_game_vcr_classic_hostalgorithm.o u/t_gfx_rectangle.o u/t_gfx_point.o \
    u/t_gfx_fillpattern.o u/t_util_randomnumbergenerator.o u/t_util_string.o \
    u/t_game_config_valueparser.o u/t_game_config_hostconfiguration.o \
    u/t_game_config_bitsetvalueparser.o u/t_game_config_booleanvalueparser.o \
    u/t_game_config_integervalueparser.o u/t_game_config_configuration.o \
    u/t_game_spec_hullfunctionlist.o u/t_game_v3_resultfile.o testsuite.o \
    u/t_game_spec_cost.o
RM = rm -f
CXXFLAGS = -I$(CONFIG_C2NG_AFL_DIR) -I. $(CONFIG_C2NG_CXXFLAGS) -MMD -g -DTARGET_OS_POSIX
OBJECTS_afl = 
PERL = $(CONFIG_C2NG_PERL)
INSTALL_CMD = $(PERL) scripts/install.pl -d -s $(INSTALL_FLAGS)
INSTDIR = /opt/c2ng
INSTALL_DATA = $(PERL) scripts/install.pl -d -m 644 $(INSTALL_FLAGS)
FILES_MANUAL = client/si/*.cpp game/interface/*.cpp interpreter/*.cpp \
    interpreter/*/*.cpp server/*/*.cpp share/resource/core*.q
HEADERS_testsuite = u/t_*.hpp
CXXTESTDIR = $(CONFIG_AFL_CXXTESTDIR)

include config.mk
include $(CONFIG_C2NG_AFL_DIR)/config.mk

.PHONY: tags manual html clean distclean install install-sdl-yes \
    install-sdl-no afl gamelib guilib serverlib

.SUFFIXES: .cpp .lo .o .s

all: all-guilib-$(CONFIG_C2NG_HAVE_GUILIB) \
    all-cxxtest-$(CONFIG_C2NG_HAVE_CXXTEST)

all-cxxtest-yes: testsuite

all-cxxtest-no:

c2check: $(OBJECTS_c2check) libgamelib.a $(LIBDEPEND)
	@echo "        Linking c2check..."
	@$(CXX) $(LDFLAGS) -o c2check $(OBJECTS_c2check) -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2configtool: $(OBJECTS_c2configtool) libgamelib.a $(LIBDEPEND)
	@echo "        Linking c2configtool..."
	@$(CXX) $(LDFLAGS) -o c2configtool $(OBJECTS_c2configtool) -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2console: $(OBJECTS_c2console) libserverlib.a libgamelib.a $(LIBDEPEND)
	@echo "        Linking c2console..."
	@$(CXX) $(LDFLAGS) -o c2console $(OBJECTS_c2console) -L. -lserverlib -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2dbexport: $(OBJECTS_c2dbexport) libserverlib.a libgamelib.a $(LIBDEPEND)
	@echo "        Linking c2dbexport..."
	@$(CXX) $(LDFLAGS) -o c2dbexport $(OBJECTS_c2dbexport) -L. -lserverlib -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2export: $(OBJECTS_c2export) libgamelib.a $(LIBDEPEND)
	@echo "        Linking c2export..."
	@$(CXX) $(LDFLAGS) -o c2export $(OBJECTS_c2export) -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2file-server: $(OBJECTS_c2file-server) libserverlib.a libgamelib.a \
    $(LIBDEPEND)
	@echo "        Linking c2file-server..."
	@$(CXX) $(LDFLAGS) -o c2file-server $(OBJECTS_c2file-server) -L. -lserverlib -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2fileclient: $(OBJECTS_c2fileclient) libserverlib.a libgamelib.a \
    $(LIBDEPEND)
	@echo "        Linking c2fileclient..."
	@$(CXX) $(LDFLAGS) -o c2fileclient $(OBJECTS_c2fileclient) -L. -lserverlib -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2format-server: $(OBJECTS_c2format-server) libserverlib.a libgamelib.a \
    $(LIBDEPEND)
	@echo "        Linking c2format-server..."
	@$(CXX) $(LDFLAGS) -o c2format-server $(OBJECTS_c2format-server) -L. -lserverlib -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2gfxgen: $(OBJECTS_c2gfxgen) libguilib.a libgamelib.a $(LIBDEPEND)
	@echo "        Linking c2gfxgen..."
	@$(CXX) $(LDFLAGS) -o c2gfxgen $(OBJECTS_c2gfxgen) -L. -lguilib -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2host-server: $(OBJECTS_c2host-server) libserverlib.a libgamelib.a \
    $(LIBDEPEND)
	@echo "        Linking c2host-server..."
	@$(CXX) $(LDFLAGS) -o c2host-server $(OBJECTS_c2host-server) -L. -lserverlib -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2mailin: $(OBJECTS_c2mailin) libserverlib.a libgamelib.a $(LIBDEPEND)
	@echo "        Linking c2mailin..."
	@$(CXX) $(LDFLAGS) -o c2mailin $(OBJECTS_c2mailin) -L. -lserverlib -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2mailout-server: $(OBJECTS_c2mailout-server) libserverlib.a libgamelib.a \
    $(LIBDEPEND)
	@echo "        Linking c2mailout-server..."
	@$(CXX) $(LDFLAGS) -o c2mailout-server $(OBJECTS_c2mailout-server) -L. -lserverlib -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2mgrep: $(OBJECTS_c2mgrep) libgamelib.a $(LIBDEPEND)
	@echo "        Linking c2mgrep..."
	@$(CXX) $(LDFLAGS) -o c2mgrep $(OBJECTS_c2mgrep) -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2mkturn: $(OBJECTS_c2mkturn) libgamelib.a $(LIBDEPEND)
	@echo "        Linking c2mkturn..."
	@$(CXX) $(LDFLAGS) -o c2mkturn $(OBJECTS_c2mkturn) -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2monitor-server: $(OBJECTS_c2monitor-server) libserverlib.a libgamelib.a \
    $(LIBDEPEND)
	@echo "        Linking c2monitor-server..."
	@$(CXX) $(LDFLAGS) -o c2monitor-server $(OBJECTS_c2monitor-server) -L. -lserverlib -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2ng: $(OBJECTS_c2ng) libguilib.a libgamelib.a $(LIBDEPEND)
	@echo "        Linking c2ng..."
	@$(CXX) $(LDFLAGS) -o c2ng $(OBJECTS_c2ng) -L. -lguilib -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS) $(CONFIG_C2NG_GUILIBS)

c2nntp-server: $(OBJECTS_c2nntp-server) libserverlib.a libgamelib.a \
    $(LIBDEPEND)
	@echo "        Linking c2nntp-server..."
	@$(CXX) $(LDFLAGS) -o c2nntp-server $(OBJECTS_c2nntp-server) -L. -lserverlib -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2plugin: $(OBJECTS_c2plugin) libgamelib.a $(LIBDEPEND)
	@echo "        Linking c2plugin..."
	@$(CXX) $(LDFLAGS) -o c2plugin $(OBJECTS_c2plugin) -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2pluginw: $(OBJECTS_c2pluginw) libgamelib.a $(LIBDEPEND)
	@echo "        Linking c2pluginw..."
	@$(CXX) $(LDFLAGS) -o c2pluginw $(OBJECTS_c2pluginw) -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2rater: $(OBJECTS_c2rater) libgamelib.a $(LIBDEPEND)
	@echo "        Linking c2rater..."
	@$(CXX) $(LDFLAGS) -o c2rater $(OBJECTS_c2rater) -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2script: $(OBJECTS_c2script) libgamelib.a $(LIBDEPEND)
	@echo "        Linking c2script..."
	@$(CXX) $(LDFLAGS) -o c2script $(OBJECTS_c2script) -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2sweep: $(OBJECTS_c2sweep) libgamelib.a $(LIBDEPEND)
	@echo "        Linking c2sweep..."
	@$(CXX) $(LDFLAGS) -o c2sweep $(OBJECTS_c2sweep) -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2talk-server: $(OBJECTS_c2talk-server) libserverlib.a libgamelib.a \
    $(LIBDEPEND)
	@echo "        Linking c2talk-server..."
	@$(CXX) $(LDFLAGS) -o c2talk-server $(OBJECTS_c2talk-server) -L. -lserverlib -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2unpack: $(OBJECTS_c2unpack) libgamelib.a $(LIBDEPEND)
	@echo "        Linking c2unpack..."
	@$(CXX) $(LDFLAGS) -o c2unpack $(OBJECTS_c2unpack) -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

c2untrn: $(OBJECTS_c2untrn) libgamelib.a $(LIBDEPEND)
	@echo "        Linking c2untrn..."
	@$(CXX) $(LDFLAGS) -o c2untrn $(OBJECTS_c2untrn) -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS)

libgamelib.a: $(OBJECTS_gamelib)
	@echo "        Archiving libgamelib.a..."
	@$(AR) cru libgamelib.a $(OBJECTS_gamelib) 

libguilib.a: $(OBJECTS_guilib)
	@echo "        Archiving libguilib.a..."
	@$(AR) cru libguilib.a $(OBJECTS_guilib) 

libserverlib.a: $(OBJECTS_serverlib)
	@echo "        Archiving libserverlib.a..."
	@$(AR) cru libserverlib.a $(OBJECTS_serverlib) 

testsuite: $(OBJECTS_testsuite) libserverlib.a libguilib.a libgamelib.a \
    $(LIBDEPEND)
	@echo "        Linking testsuite..."
	@$(CXX) $(LDFLAGS) -o testsuite $(OBJECTS_testsuite) -L. -lserverlib -L. -lguilib -L. -lgamelib -L$(CONFIG_C2NG_AFL_DIR) -lafl $(CONFIG_AFL_LIBS) $(LIBS) $(CONFIG_C2NG_GUILIBS)

Makefile: P9/Settings P9/02_manual.pr P9/Rules-unix.mak P9/Settings-unix.mak
	@echo "        Regenerating Makefile..."
	@proj9 update

all-guilib-no: c2check c2configtool c2export c2mgrep c2mkturn c2plugin \
    c2pluginw c2rater c2script c2sweep c2unpack c2untrn c2gfxgen \
    c2file-server c2format-server c2host-server c2talk-server c2fileclient \
    c2mailin c2console c2dbexport c2nntp-server c2mailout-server \
    c2monitor-server

all-guilib-yes: all-guilib-no c2ng

clean:
	$(RM) share/resource/pcc2tech.xml
	$(RM) $(OBJECTS_gamelib)
	$(RM) $(OBJECTS_guilib)
	$(RM) $(OBJECTS_serverlib)
	$(RM) $(OBJECTS_c2check)
	$(RM) $(OBJECTS_c2configtool)
	$(RM) $(OBJECTS_c2export)
	$(RM) $(OBJECTS_c2mgrep)
	$(RM) $(OBJECTS_c2mkturn)
	$(RM) $(OBJECTS_c2plugin)
	$(RM) $(OBJECTS_c2pluginw)
	$(RM) $(OBJECTS_c2rater)
	$(RM) $(OBJECTS_c2script)
	$(RM) $(OBJECTS_c2sweep)
	$(RM) $(OBJECTS_c2unpack)
	$(RM) $(OBJECTS_c2untrn)
	$(RM) $(OBJECTS_c2gfxgen)
	$(RM) $(OBJECTS_c2file-server)
	$(RM) $(OBJECTS_c2format-server)
	$(RM) $(OBJECTS_c2host-server)
	$(RM) $(OBJECTS_c2talk-server)
	$(RM) $(OBJECTS_c2fileclient)
	$(RM) $(OBJECTS_c2mailin)
	$(RM) $(OBJECTS_c2console)
	$(RM) $(OBJECTS_c2dbexport)
	$(RM) $(OBJECTS_c2nntp-server)
	$(RM) $(OBJECTS_c2mailout-server)
	$(RM) $(OBJECTS_c2monitor-server)
	$(RM) $(OBJECTS_c2ng)
	$(RM) $(OBJECTS_testsuite)

client/vcr/classic/renderer1.lo: client/vcr/classic/renderer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o client/vcr/classic/renderer1.lo -c client/vcr/classic/renderer.cpp

client/vcr/classic/renderer1.o: client/vcr/classic/renderer.cpp
	@echo "        Compiling client/vcr/classic/renderer.cpp..."
	@$(CXX) $(CXXFLAGS) -o client/vcr/classic/renderer1.o -c client/vcr/classic/renderer.cpp

client/vcr/classic/renderer1.s: client/vcr/classic/renderer.cpp
	$(CXX) $(CXXFLAGS) -o client/vcr/classic/renderer1.s -S client/vcr/classic/renderer.cpp

depend.mk: Makefile
	@echo "        Regenerating depend.mk..."
	@for i in $(OBJECTS_afl) $(OBJECTS_gamelib) $(OBJECTS_guilib) $(OBJECTS_serverlib) $(OBJECTS_c2check) $(OBJECTS_c2configtool) $(OBJECTS_c2export) $(OBJECTS_c2mgrep) $(OBJECTS_c2mkturn) $(OBJECTS_c2plugin) $(OBJECTS_c2pluginw) $(OBJECTS_c2rater) $(OBJECTS_c2script) $(OBJECTS_c2sweep) $(OBJECTS_c2unpack) $(OBJECTS_c2untrn) $(OBJECTS_c2gfxgen) $(OBJECTS_c2file-server) $(OBJECTS_c2format-server) $(OBJECTS_c2host-server) $(OBJECTS_c2talk-server) $(OBJECTS_c2fileclient) $(OBJECTS_c2mailin) $(OBJECTS_c2console) $(OBJECTS_c2dbexport) $(OBJECTS_c2nntp-server) $(OBJECTS_c2mailout-server) $(OBJECTS_c2monitor-server) $(OBJECTS_c2ng) $(OBJECTS_testsuite); do echo "-include $${i%o}d"; done > depend.mk

distclean: clean
	$(RM) testsuite.cpp
	$(RM) libgamelib.a
	$(RM) libguilib.a
	$(RM) libserverlib.a
	$(RM) c2check
	$(RM) c2configtool
	$(RM) c2export
	$(RM) c2mgrep
	$(RM) c2mkturn
	$(RM) c2plugin
	$(RM) c2pluginw
	$(RM) c2rater
	$(RM) c2script
	$(RM) c2sweep
	$(RM) c2unpack
	$(RM) c2untrn
	$(RM) c2gfxgen
	$(RM) c2file-server
	$(RM) c2format-server
	$(RM) c2host-server
	$(RM) c2talk-server
	$(RM) c2fileclient
	$(RM) c2mailin
	$(RM) c2console
	$(RM) c2dbexport
	$(RM) c2nntp-server
	$(RM) c2mailout-server
	$(RM) c2monitor-server
	$(RM) c2ng
	$(RM) testsuite

doc/pcc2tech.html: share/resource/pcc2tech.xml scripts/pcc2help.xsl
	xsltproc --path scripts --param whoami "'int'" scripts/pcc2help.xsl share/resource/pcc2tech.xml > $@

game/browser/session1.lo: game/browser/session.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/browser/session1.lo -c game/browser/session.cpp

game/browser/session1.o: game/browser/session.cpp
	@echo "        Compiling game/browser/session.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/browser/session1.o -c game/browser/session.cpp

game/browser/session1.s: game/browser/session.cpp
	$(CXX) $(CXXFLAGS) -o game/browser/session1.s -S game/browser/session.cpp

game/map/configuration1.lo: game/map/configuration.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/map/configuration1.lo -c game/map/configuration.cpp

game/map/configuration1.o: game/map/configuration.cpp
	@echo "        Compiling game/map/configuration.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/map/configuration1.o -c game/map/configuration.cpp

game/map/configuration1.s: game/map/configuration.cpp
	$(CXX) $(CXXFLAGS) -o game/map/configuration1.s -S game/map/configuration.cpp

game/map/renderer2.lo: game/map/renderer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/map/renderer2.lo -c game/map/renderer.cpp

game/map/renderer2.o: game/map/renderer.cpp
	@echo "        Compiling game/map/renderer.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/map/renderer2.o -c game/map/renderer.cpp

game/map/renderer2.s: game/map/renderer.cpp
	$(CXX) $(CXXFLAGS) -o game/map/renderer2.s -S game/map/renderer.cpp

game/msg/configuration2.lo: game/msg/configuration.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/msg/configuration2.lo -c game/msg/configuration.cpp

game/msg/configuration2.o: game/msg/configuration.cpp
	@echo "        Compiling game/msg/configuration.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/msg/configuration2.o -c game/msg/configuration.cpp

game/msg/configuration2.s: game/msg/configuration.cpp
	$(CXX) $(CXXFLAGS) -o game/msg/configuration2.s -S game/msg/configuration.cpp

game/pcc/accountfolder1.lo: game/pcc/accountfolder.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/pcc/accountfolder1.lo -c game/pcc/accountfolder.cpp

game/pcc/accountfolder1.o: game/pcc/accountfolder.cpp
	@echo "        Compiling game/pcc/accountfolder.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/pcc/accountfolder1.o -c game/pcc/accountfolder.cpp

game/pcc/accountfolder1.s: game/pcc/accountfolder.cpp
	$(CXX) $(CXXFLAGS) -o game/pcc/accountfolder1.s -S game/pcc/accountfolder.cpp

game/pcc/browserhandler1.lo: game/pcc/browserhandler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/pcc/browserhandler1.lo -c game/pcc/browserhandler.cpp

game/pcc/browserhandler1.o: game/pcc/browserhandler.cpp
	@echo "        Compiling game/pcc/browserhandler.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/pcc/browserhandler1.o -c game/pcc/browserhandler.cpp

game/pcc/browserhandler1.s: game/pcc/browserhandler.cpp
	$(CXX) $(CXXFLAGS) -o game/pcc/browserhandler1.s -S game/pcc/browserhandler.cpp

game/pcc/gamefolder1.lo: game/pcc/gamefolder.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/pcc/gamefolder1.lo -c game/pcc/gamefolder.cpp

game/pcc/gamefolder1.o: game/pcc/gamefolder.cpp
	@echo "        Compiling game/pcc/gamefolder.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/pcc/gamefolder1.o -c game/pcc/gamefolder.cpp

game/pcc/gamefolder1.s: game/pcc/gamefolder.cpp
	$(CXX) $(CXXFLAGS) -o game/pcc/gamefolder1.s -S game/pcc/gamefolder.cpp

game/player1.lo: game/player.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/player1.lo -c game/player.cpp

game/player1.o: game/player.cpp
	@echo "        Compiling game/player.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/player1.o -c game/player.cpp

game/player1.s: game/player.cpp
	$(CXX) $(CXXFLAGS) -o game/player1.s -S game/player.cpp

game/playerlist1.lo: game/playerlist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/playerlist1.lo -c game/playerlist.cpp

game/playerlist1.o: game/playerlist.cpp
	@echo "        Compiling game/playerlist.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/playerlist1.o -c game/playerlist.cpp

game/playerlist1.s: game/playerlist.cpp
	$(CXX) $(CXXFLAGS) -o game/playerlist1.s -S game/playerlist.cpp

game/ref/configuration3.lo: game/ref/configuration.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/ref/configuration3.lo -c game/ref/configuration.cpp

game/ref/configuration3.o: game/ref/configuration.cpp
	@echo "        Compiling game/ref/configuration.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/ref/configuration3.o -c game/ref/configuration.cpp

game/ref/configuration3.s: game/ref/configuration.cpp
	$(CXX) $(CXXFLAGS) -o game/ref/configuration3.s -S game/ref/configuration.cpp

game/score/loader1.lo: game/score/loader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/score/loader1.lo -c game/score/loader.cpp

game/score/loader1.o: game/score/loader.cpp
	@echo "        Compiling game/score/loader.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/score/loader1.o -c game/score/loader.cpp

game/score/loader1.s: game/score/loader.cpp
	$(CXX) $(CXXFLAGS) -o game/score/loader1.s -S game/score/loader.cpp

game/session2.lo: game/session.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/session2.lo -c game/session.cpp

game/session2.o: game/session.cpp
	@echo "        Compiling game/session.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/session2.o -c game/session.cpp

game/session2.s: game/session.cpp
	$(CXX) $(CXXFLAGS) -o game/session2.s -S game/session.cpp

game/sim/configuration4.lo: game/sim/configuration.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/sim/configuration4.lo -c game/sim/configuration.cpp

game/sim/configuration4.o: game/sim/configuration.cpp
	@echo "        Compiling game/sim/configuration.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/sim/configuration4.o -c game/sim/configuration.cpp

game/sim/configuration4.s: game/sim/configuration.cpp
	$(CXX) $(CXXFLAGS) -o game/sim/configuration4.s -S game/sim/configuration.cpp

game/sim/loader2.lo: game/sim/loader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/sim/loader2.lo -c game/sim/loader.cpp

game/sim/loader2.o: game/sim/loader.cpp
	@echo "        Compiling game/sim/loader.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/sim/loader2.o -c game/sim/loader.cpp

game/sim/loader2.s: game/sim/loader.cpp
	$(CXX) $(CXXFLAGS) -o game/sim/loader2.s -S game/sim/loader.cpp

game/sim/object1.lo: game/sim/object.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/sim/object1.lo -c game/sim/object.cpp

game/sim/object1.o: game/sim/object.cpp
	@echo "        Compiling game/sim/object.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/sim/object1.o -c game/sim/object.cpp

game/sim/object1.s: game/sim/object.cpp
	$(CXX) $(CXXFLAGS) -o game/sim/object1.s -S game/sim/object.cpp

game/sim/planet1.lo: game/sim/planet.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/sim/planet1.lo -c game/sim/planet.cpp

game/sim/planet1.o: game/sim/planet.cpp
	@echo "        Compiling game/sim/planet.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/sim/planet1.o -c game/sim/planet.cpp

game/sim/planet1.s: game/sim/planet.cpp
	$(CXX) $(CXXFLAGS) -o game/sim/planet1.s -S game/sim/planet.cpp

game/sim/ship1.lo: game/sim/ship.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/sim/ship1.lo -c game/sim/ship.cpp

game/sim/ship1.o: game/sim/ship.cpp
	@echo "        Compiling game/sim/ship.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/sim/ship1.o -c game/sim/ship.cpp

game/sim/ship1.s: game/sim/ship.cpp
	$(CXX) $(CXXFLAGS) -o game/sim/ship1.s -S game/sim/ship.cpp

game/spec/hullfunction1.lo: game/spec/hullfunction.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/spec/hullfunction1.lo -c game/spec/hullfunction.cpp

game/spec/hullfunction1.o: game/spec/hullfunction.cpp
	@echo "        Compiling game/spec/hullfunction.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/spec/hullfunction1.o -c game/spec/hullfunction.cpp

game/spec/hullfunction1.s: game/spec/hullfunction.cpp
	$(CXX) $(CXXFLAGS) -o game/spec/hullfunction1.s -S game/spec/hullfunction.cpp

game/stringverifier1.lo: game/stringverifier.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/stringverifier1.lo -c game/stringverifier.cpp

game/stringverifier1.o: game/stringverifier.cpp
	@echo "        Compiling game/stringverifier.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/stringverifier1.o -c game/stringverifier.cpp

game/stringverifier1.s: game/stringverifier.cpp
	$(CXX) $(CXXFLAGS) -o game/stringverifier1.s -S game/stringverifier.cpp

game/test/cargocontainer1.lo: game/test/cargocontainer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/test/cargocontainer1.lo -c game/test/cargocontainer.cpp

game/test/cargocontainer1.o: game/test/cargocontainer.cpp
	@echo "        Compiling game/test/cargocontainer.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/test/cargocontainer1.o -c game/test/cargocontainer.cpp

game/test/cargocontainer1.s: game/test/cargocontainer.cpp
	$(CXX) $(CXXFLAGS) -o game/test/cargocontainer1.s -S game/test/cargocontainer.cpp

game/test/registrationkey1.lo: game/test/registrationkey.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/test/registrationkey1.lo -c game/test/registrationkey.cpp

game/test/registrationkey1.o: game/test/registrationkey.cpp
	@echo "        Compiling game/test/registrationkey.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/test/registrationkey1.o -c game/test/registrationkey.cpp

game/test/registrationkey1.s: game/test/registrationkey.cpp
	$(CXX) $(CXXFLAGS) -o game/test/registrationkey1.s -S game/test/registrationkey.cpp

game/test/specificationloader1.lo: game/test/specificationloader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/test/specificationloader1.lo -c game/test/specificationloader.cpp

game/test/specificationloader1.o: game/test/specificationloader.cpp
	@echo "        Compiling game/test/specificationloader.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/test/specificationloader1.o -c game/test/specificationloader.cpp

game/test/specificationloader1.s: game/test/specificationloader.cpp
	$(CXX) $(CXXFLAGS) -o game/test/specificationloader1.s -S game/test/specificationloader.cpp

game/test/stringverifier2.lo: game/test/stringverifier.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/test/stringverifier2.lo -c game/test/stringverifier.cpp

game/test/stringverifier2.o: game/test/stringverifier.cpp
	@echo "        Compiling game/test/stringverifier.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/test/stringverifier2.o -c game/test/stringverifier.cpp

game/test/stringverifier2.s: game/test/stringverifier.cpp
	$(CXX) $(CXXFLAGS) -o game/test/stringverifier2.s -S game/test/stringverifier.cpp

game/turnloader1.lo: game/turnloader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/turnloader1.lo -c game/turnloader.cpp

game/turnloader1.o: game/turnloader.cpp
	@echo "        Compiling game/turnloader.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/turnloader1.o -c game/turnloader.cpp

game/turnloader1.s: game/turnloader.cpp
	$(CXX) $(CXXFLAGS) -o game/turnloader1.s -S game/turnloader.cpp

game/v3/check/configuration5.lo: game/v3/check/configuration.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/v3/check/configuration5.lo -c game/v3/check/configuration.cpp

game/v3/check/configuration5.o: game/v3/check/configuration.cpp
	@echo "        Compiling game/v3/check/configuration.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/v3/check/configuration5.o -c game/v3/check/configuration.cpp

game/v3/check/configuration5.s: game/v3/check/configuration.cpp
	$(CXX) $(CXXFLAGS) -o game/v3/check/configuration5.s -S game/v3/check/configuration.cpp

game/v3/loader3.lo: game/v3/loader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/v3/loader3.lo -c game/v3/loader.cpp

game/v3/loader3.o: game/v3/loader.cpp
	@echo "        Compiling game/v3/loader.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/v3/loader3.o -c game/v3/loader.cpp

game/v3/loader3.s: game/v3/loader.cpp
	$(CXX) $(CXXFLAGS) -o game/v3/loader3.s -S game/v3/loader.cpp

game/v3/packer1.lo: game/v3/packer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/v3/packer1.lo -c game/v3/packer.cpp

game/v3/packer1.o: game/v3/packer.cpp
	@echo "        Compiling game/v3/packer.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/v3/packer1.o -c game/v3/packer.cpp

game/v3/packer1.s: game/v3/packer.cpp
	$(CXX) $(CXXFLAGS) -o game/v3/packer1.s -S game/v3/packer.cpp

game/v3/registrationkey2.lo: game/v3/registrationkey.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/v3/registrationkey2.lo -c game/v3/registrationkey.cpp

game/v3/registrationkey2.o: game/v3/registrationkey.cpp
	@echo "        Compiling game/v3/registrationkey.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/v3/registrationkey2.o -c game/v3/registrationkey.cpp

game/v3/registrationkey2.s: game/v3/registrationkey.cpp
	$(CXX) $(CXXFLAGS) -o game/v3/registrationkey2.s -S game/v3/registrationkey.cpp

game/v3/specificationloader2.lo: game/v3/specificationloader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/v3/specificationloader2.lo -c game/v3/specificationloader.cpp

game/v3/specificationloader2.o: game/v3/specificationloader.cpp
	@echo "        Compiling game/v3/specificationloader.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/v3/specificationloader2.o -c game/v3/specificationloader.cpp

game/v3/specificationloader2.s: game/v3/specificationloader.cpp
	$(CXX) $(CXXFLAGS) -o game/v3/specificationloader2.s -S game/v3/specificationloader.cpp

game/v3/stringverifier3.lo: game/v3/stringverifier.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/v3/stringverifier3.lo -c game/v3/stringverifier.cpp

game/v3/stringverifier3.o: game/v3/stringverifier.cpp
	@echo "        Compiling game/v3/stringverifier.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/v3/stringverifier3.o -c game/v3/stringverifier.cpp

game/v3/stringverifier3.s: game/v3/stringverifier.cpp
	$(CXX) $(CXXFLAGS) -o game/v3/stringverifier3.s -S game/v3/stringverifier.cpp

game/vcr/classic/battle1.lo: game/vcr/classic/battle.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/vcr/classic/battle1.lo -c game/vcr/classic/battle.cpp

game/vcr/classic/battle1.o: game/vcr/classic/battle.cpp
	@echo "        Compiling game/vcr/classic/battle.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/vcr/classic/battle1.o -c game/vcr/classic/battle.cpp

game/vcr/classic/battle1.s: game/vcr/classic/battle.cpp
	$(CXX) $(CXXFLAGS) -o game/vcr/classic/battle1.s -S game/vcr/classic/battle.cpp

game/vcr/classic/utils1.lo: game/vcr/classic/utils.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/vcr/classic/utils1.lo -c game/vcr/classic/utils.cpp

game/vcr/classic/utils1.o: game/vcr/classic/utils.cpp
	@echo "        Compiling game/vcr/classic/utils.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/vcr/classic/utils1.o -c game/vcr/classic/utils.cpp

game/vcr/classic/utils1.s: game/vcr/classic/utils.cpp
	$(CXX) $(CXXFLAGS) -o game/vcr/classic/utils1.s -S game/vcr/classic/utils.cpp

game/vcr/object2.lo: game/vcr/object.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o game/vcr/object2.lo -c game/vcr/object.cpp

game/vcr/object2.o: game/vcr/object.cpp
	@echo "        Compiling game/vcr/object.cpp..."
	@$(CXX) $(CXXFLAGS) -o game/vcr/object2.o -c game/vcr/object.cpp

game/vcr/object2.s: game/vcr/object.cpp
	$(CXX) $(CXXFLAGS) -o game/vcr/object2.s -S game/vcr/object.cpp

gamelib: libgamelib.a

gfx/application1.lo: gfx/application.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o gfx/application1.lo -c gfx/application.cpp

gfx/application1.o: gfx/application.cpp
	@echo "        Compiling gfx/application.cpp..."
	@$(CXX) $(CXXFLAGS) -o gfx/application1.o -c gfx/application.cpp

gfx/application1.s: gfx/application.cpp
	$(CXX) $(CXXFLAGS) -o gfx/application1.s -S gfx/application.cpp

gfx/filter1.lo: gfx/filter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o gfx/filter1.lo -c gfx/filter.cpp

gfx/filter1.o: gfx/filter.cpp
	@echo "        Compiling gfx/filter.cpp..."
	@$(CXX) $(CXXFLAGS) -o gfx/filter1.o -c gfx/filter.cpp

gfx/filter1.s: gfx/filter.cpp
	$(CXX) $(CXXFLAGS) -o gfx/filter1.s -S gfx/filter.cpp

gfx/gen/application2.lo: gfx/gen/application.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o gfx/gen/application2.lo -c gfx/gen/application.cpp

gfx/gen/application2.o: gfx/gen/application.cpp
	@echo "        Compiling gfx/gen/application.cpp..."
	@$(CXX) $(CXXFLAGS) -o gfx/gen/application2.o -c gfx/gen/application.cpp

gfx/gen/application2.s: gfx/gen/application.cpp
	$(CXX) $(CXXFLAGS) -o gfx/gen/application2.s -S gfx/gen/application.cpp

gfx/gen/planet2.lo: gfx/gen/planet.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o gfx/gen/planet2.lo -c gfx/gen/planet.cpp

gfx/gen/planet2.o: gfx/gen/planet.cpp
	@echo "        Compiling gfx/gen/planet.cpp..."
	@$(CXX) $(CXXFLAGS) -o gfx/gen/planet2.o -c gfx/gen/planet.cpp

gfx/gen/planet2.s: gfx/gen/planet.cpp
	$(CXX) $(CXXFLAGS) -o gfx/gen/planet2.s -S gfx/gen/planet.cpp

gfx/gen/spaceview.lo: gfx/gen/spaceview.cpp
	$(CXX) -fPIC $(CXXFLAGS) -ffloat-store -o gfx/gen/spaceview.lo -c gfx/gen/spaceview.cpp

gfx/gen/spaceview.o: gfx/gen/spaceview.cpp
	@echo "        Compiling gfx/gen/spaceview.cpp..."
	@$(CXX) $(CXXFLAGS) -ffloat-store -o gfx/gen/spaceview.o -c gfx/gen/spaceview.cpp

gfx/gen/spaceview.s: gfx/gen/spaceview.cpp
	$(CXX) $(CXXFLAGS) -ffloat-store -o gfx/gen/spaceview.s -S gfx/gen/spaceview.cpp

gfx/point1.lo: gfx/point.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o gfx/point1.lo -c gfx/point.cpp

gfx/point1.o: gfx/point.cpp
	@echo "        Compiling gfx/point.cpp..."
	@$(CXX) $(CXXFLAGS) -o gfx/point1.o -c gfx/point.cpp

gfx/point1.s: gfx/point.cpp
	$(CXX) $(CXXFLAGS) -o gfx/point1.s -S gfx/point.cpp

gfx/sdl/engine1.lo: gfx/sdl/engine.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o gfx/sdl/engine1.lo -c gfx/sdl/engine.cpp

gfx/sdl/engine1.o: gfx/sdl/engine.cpp
	@echo "        Compiling gfx/sdl/engine.cpp..."
	@$(CXX) $(CXXFLAGS) -o gfx/sdl/engine1.o -c gfx/sdl/engine.cpp

gfx/sdl/engine1.s: gfx/sdl/engine.cpp
	$(CXX) $(CXXFLAGS) -o gfx/sdl/engine1.s -S gfx/sdl/engine.cpp

gfx/sdl2/engine2.lo: gfx/sdl2/engine.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o gfx/sdl2/engine2.lo -c gfx/sdl2/engine.cpp

gfx/sdl2/engine2.o: gfx/sdl2/engine.cpp
	@echo "        Compiling gfx/sdl2/engine.cpp..."
	@$(CXX) $(CXXFLAGS) -o gfx/sdl2/engine2.o -c gfx/sdl2/engine.cpp

gfx/sdl2/engine2.s: gfx/sdl2/engine.cpp
	$(CXX) $(CXXFLAGS) -o gfx/sdl2/engine2.s -S gfx/sdl2/engine.cpp

gfx/sdl2/streaminterface1.lo: gfx/sdl2/streaminterface.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o gfx/sdl2/streaminterface1.lo -c gfx/sdl2/streaminterface.cpp

gfx/sdl2/streaminterface1.o: gfx/sdl2/streaminterface.cpp
	@echo "        Compiling gfx/sdl2/streaminterface.cpp..."
	@$(CXX) $(CXXFLAGS) -o gfx/sdl2/streaminterface1.o -c gfx/sdl2/streaminterface.cpp

gfx/sdl2/streaminterface1.s: gfx/sdl2/streaminterface.cpp
	$(CXX) $(CXXFLAGS) -o gfx/sdl2/streaminterface1.s -S gfx/sdl2/streaminterface.cpp

gfx/sdl2/surface1.lo: gfx/sdl2/surface.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o gfx/sdl2/surface1.lo -c gfx/sdl2/surface.cpp

gfx/sdl2/surface1.o: gfx/sdl2/surface.cpp
	@echo "        Compiling gfx/sdl2/surface.cpp..."
	@$(CXX) $(CXXFLAGS) -o gfx/sdl2/surface1.o -c gfx/sdl2/surface.cpp

gfx/sdl2/surface1.s: gfx/sdl2/surface.cpp
	$(CXX) $(CXXFLAGS) -o gfx/sdl2/surface1.s -S gfx/sdl2/surface.cpp

guilib: libguilib.a

html: doc/pcc2tech.html

install: c2check c2configtool c2export c2mgrep c2mkturn c2plugin c2pluginw \
    c2rater c2script c2sweep c2unpack c2untrn c2gfxgen c2file-server \
    c2format-server c2host-server c2talk-server c2fileclient c2mailin \
    c2console c2dbexport c2nntp-server c2mailout-server c2monitor-server
	$(INSTALL_CMD) c2check c2configtool c2export c2mgrep c2mkturn c2plugin c2pluginw c2rater c2script c2sweep c2unpack c2untrn c2gfxgen c2file-server c2format-server c2host-server c2talk-server c2fileclient c2mailin c2console c2dbexport c2nntp-server c2mailout-server c2monitor-server $(INSTDIR)/bin
	$(MAKE) install-sdl-$(CONFIG_C2NG_HAVE_SDL)
	$(INSTALL_DATA) -R share $(INSTDIR)/share

install-sdl-no:

install-sdl-yes: c2ng
	$(INSTALL_CMD) c2ng $(INSTDIR)/bin

interpreter/exporter/configuration6.lo: \
    interpreter/exporter/configuration.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o interpreter/exporter/configuration6.lo -c interpreter/exporter/configuration.cpp

interpreter/exporter/configuration6.o: \
    interpreter/exporter/configuration.cpp
	@echo "        Compiling interpreter/exporter/configuration.cpp..."
	@$(CXX) $(CXXFLAGS) -o interpreter/exporter/configuration6.o -c interpreter/exporter/configuration.cpp

interpreter/exporter/configuration6.s: \
    interpreter/exporter/configuration.cpp
	$(CXX) $(CXXFLAGS) -o interpreter/exporter/configuration6.s -S interpreter/exporter/configuration.cpp

interpreter/exporter/format1.lo: interpreter/exporter/format.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o interpreter/exporter/format1.lo -c interpreter/exporter/format.cpp

interpreter/exporter/format1.o: interpreter/exporter/format.cpp
	@echo "        Compiling interpreter/exporter/format.cpp..."
	@$(CXX) $(CXXFLAGS) -o interpreter/exporter/format1.o -c interpreter/exporter/format.cpp

interpreter/exporter/format1.s: interpreter/exporter/format.cpp
	$(CXX) $(CXXFLAGS) -o interpreter/exporter/format1.s -S interpreter/exporter/format.cpp

interpreter/expr/parser1.lo: interpreter/expr/parser.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o interpreter/expr/parser1.lo -c interpreter/expr/parser.cpp

interpreter/expr/parser1.o: interpreter/expr/parser.cpp
	@echo "        Compiling interpreter/expr/parser.cpp..."
	@$(CXX) $(CXXFLAGS) -o interpreter/expr/parser1.o -c interpreter/expr/parser.cpp

interpreter/expr/parser1.s: interpreter/expr/parser.cpp
	$(CXX) $(CXXFLAGS) -o interpreter/expr/parser1.s -S interpreter/expr/parser.cpp

interpreter/values1.lo: interpreter/values.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o interpreter/values1.lo -c interpreter/values.cpp

interpreter/values1.o: interpreter/values.cpp
	@echo "        Compiling interpreter/values.cpp..."
	@$(CXX) $(CXXFLAGS) -o interpreter/values1.o -c interpreter/values.cpp

interpreter/values1.s: interpreter/values.cpp
	$(CXX) $(CXXFLAGS) -o interpreter/values1.s -S interpreter/values.cpp

manual: share/resource/pcc2tech.xml

server/application3.lo: server/application.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/application3.lo -c server/application.cpp

server/application3.o: server/application.cpp
	@echo "        Compiling server/application.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/application3.o -c server/application.cpp

server/application3.s: server/application.cpp
	$(CXX) $(CXXFLAGS) -o server/application3.s -S server/application.cpp

server/common/root1.lo: server/common/root.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/common/root1.lo -c server/common/root.cpp

server/common/root1.o: server/common/root.cpp
	@echo "        Compiling server/common/root.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/common/root1.o -c server/common/root.cpp

server/common/root1.s: server/common/root.cpp
	$(CXX) $(CXXFLAGS) -o server/common/root1.s -S server/common/root.cpp

server/common/session3.lo: server/common/session.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/common/session3.lo -c server/common/session.cpp

server/common/session3.o: server/common/session.cpp
	@echo "        Compiling server/common/session.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/common/session3.o -c server/common/session.cpp

server/common/session3.s: server/common/session.cpp
	$(CXX) $(CXXFLAGS) -o server/common/session3.s -S server/common/session.cpp

server/console/parser2.lo: server/console/parser.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/console/parser2.lo -c server/console/parser.cpp

server/console/parser2.o: server/console/parser.cpp
	@echo "        Compiling server/console/parser.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/console/parser2.o -c server/console/parser.cpp

server/console/parser2.s: server/console/parser.cpp
	$(CXX) $(CXXFLAGS) -o server/console/parser2.s -S server/console/parser.cpp

server/file/ca/directoryhandler1.lo: server/file/ca/directoryhandler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/file/ca/directoryhandler1.lo -c server/file/ca/directoryhandler.cpp

server/file/ca/directoryhandler1.o: server/file/ca/directoryhandler.cpp
	@echo "        Compiling server/file/ca/directoryhandler.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/file/ca/directoryhandler1.o -c server/file/ca/directoryhandler.cpp

server/file/ca/directoryhandler1.s: server/file/ca/directoryhandler.cpp
	$(CXX) $(CXXFLAGS) -o server/file/ca/directoryhandler1.s -S server/file/ca/directoryhandler.cpp

server/file/ca/root2.lo: server/file/ca/root.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/file/ca/root2.lo -c server/file/ca/root.cpp

server/file/ca/root2.o: server/file/ca/root.cpp
	@echo "        Compiling server/file/ca/root.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/file/ca/root2.o -c server/file/ca/root.cpp

server/file/ca/root2.s: server/file/ca/root.cpp
	$(CXX) $(CXXFLAGS) -o server/file/ca/root2.s -S server/file/ca/root.cpp

server/file/directoryhandler2.lo: server/file/directoryhandler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/file/directoryhandler2.lo -c server/file/directoryhandler.cpp

server/file/directoryhandler2.o: server/file/directoryhandler.cpp
	@echo "        Compiling server/file/directoryhandler.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/file/directoryhandler2.o -c server/file/directoryhandler.cpp

server/file/directoryhandler2.s: server/file/directoryhandler.cpp
	$(CXX) $(CXXFLAGS) -o server/file/directoryhandler2.s -S server/file/directoryhandler.cpp

server/file/directorywrapper1.lo: server/file/directorywrapper.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/file/directorywrapper1.lo -c server/file/directorywrapper.cpp

server/file/directorywrapper1.o: server/file/directorywrapper.cpp
	@echo "        Compiling server/file/directorywrapper.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/file/directorywrapper1.o -c server/file/directorywrapper.cpp

server/file/directorywrapper1.s: server/file/directorywrapper.cpp
	$(CXX) $(CXXFLAGS) -o server/file/directorywrapper1.s -S server/file/directorywrapper.cpp

server/file/racenames1.lo: server/file/racenames.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/file/racenames1.lo -c server/file/racenames.cpp

server/file/racenames1.o: server/file/racenames.cpp
	@echo "        Compiling server/file/racenames.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/file/racenames1.o -c server/file/racenames.cpp

server/file/racenames1.s: server/file/racenames.cpp
	$(CXX) $(CXXFLAGS) -o server/file/racenames1.s -S server/file/racenames.cpp

server/file/root3.lo: server/file/root.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/file/root3.lo -c server/file/root.cpp

server/file/root3.o: server/file/root.cpp
	@echo "        Compiling server/file/root.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/file/root3.o -c server/file/root.cpp

server/file/root3.s: server/file/root.cpp
	$(CXX) $(CXXFLAGS) -o server/file/root3.s -S server/file/root.cpp

server/file/utils2.lo: server/file/utils.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/file/utils2.lo -c server/file/utils.cpp

server/file/utils2.o: server/file/utils.cpp
	@echo "        Compiling server/file/utils.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/file/utils2.o -c server/file/utils.cpp

server/file/utils2.s: server/file/utils.cpp
	$(CXX) $(CXXFLAGS) -o server/file/utils2.s -S server/file/utils.cpp

server/format/format2.lo: server/format/format.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/format/format2.lo -c server/format/format.cpp

server/format/format2.o: server/format/format.cpp
	@echo "        Compiling server/format/format.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/format/format2.o -c server/format/format.cpp

server/format/format2.s: server/format/format.cpp
	$(CXX) $(CXXFLAGS) -o server/format/format2.s -S server/format/format.cpp

server/format/serverapplication1.lo: server/format/serverapplication.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/format/serverapplication1.lo -c server/format/serverapplication.cpp

server/format/serverapplication1.o: server/format/serverapplication.cpp
	@echo "        Compiling server/format/serverapplication.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/format/serverapplication1.o -c server/format/serverapplication.cpp

server/format/serverapplication1.s: server/format/serverapplication.cpp
	$(CXX) $(CXXFLAGS) -o server/format/serverapplication1.s -S server/format/serverapplication.cpp

server/format/utils3.lo: server/format/utils.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/format/utils3.lo -c server/format/utils.cpp

server/format/utils3.o: server/format/utils.cpp
	@echo "        Compiling server/format/utils.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/format/utils3.o -c server/format/utils.cpp

server/format/utils3.s: server/format/utils.cpp
	$(CXX) $(CXXFLAGS) -o server/format/utils3.s -S server/format/utils.cpp

server/host/commandhandler1.lo: server/host/commandhandler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/host/commandhandler1.lo -c server/host/commandhandler.cpp

server/host/commandhandler1.o: server/host/commandhandler.cpp
	@echo "        Compiling server/host/commandhandler.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/host/commandhandler1.o -c server/host/commandhandler.cpp

server/host/commandhandler1.s: server/host/commandhandler.cpp
	$(CXX) $(CXXFLAGS) -o server/host/commandhandler1.s -S server/host/commandhandler.cpp

server/host/configuration7.lo: server/host/configuration.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/host/configuration7.lo -c server/host/configuration.cpp

server/host/configuration7.o: server/host/configuration.cpp
	@echo "        Compiling server/host/configuration.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/host/configuration7.o -c server/host/configuration.cpp

server/host/configuration7.s: server/host/configuration.cpp
	$(CXX) $(CXXFLAGS) -o server/host/configuration7.s -S server/host/configuration.cpp

server/host/exporter1.lo: server/host/exporter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/host/exporter1.lo -c server/host/exporter.cpp

server/host/exporter1.o: server/host/exporter.cpp
	@echo "        Compiling server/host/exporter.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/host/exporter1.o -c server/host/exporter.cpp

server/host/exporter1.s: server/host/exporter.cpp
	$(CXX) $(CXXFLAGS) -o server/host/exporter1.s -S server/host/exporter.cpp

server/host/file/fileitem1.lo: server/host/file/fileitem.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/host/file/fileitem1.lo -c server/host/file/fileitem.cpp

server/host/file/fileitem1.o: server/host/file/fileitem.cpp
	@echo "        Compiling server/host/file/fileitem.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/host/file/fileitem1.o -c server/host/file/fileitem.cpp

server/host/file/fileitem1.s: server/host/file/fileitem.cpp
	$(CXX) $(CXXFLAGS) -o server/host/file/fileitem1.s -S server/host/file/fileitem.cpp

server/host/file/item1.lo: server/host/file/item.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/host/file/item1.lo -c server/host/file/item.cpp

server/host/file/item1.o: server/host/file/item.cpp
	@echo "        Compiling server/host/file/item.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/host/file/item1.o -c server/host/file/item.cpp

server/host/file/item1.s: server/host/file/item.cpp
	$(CXX) $(CXXFLAGS) -o server/host/file/item1.s -S server/host/file/item.cpp

server/host/game1.lo: server/host/game.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/host/game1.lo -c server/host/game.cpp

server/host/game1.o: server/host/game.cpp
	@echo "        Compiling server/host/game.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/host/game1.o -c server/host/game.cpp

server/host/game1.s: server/host/game.cpp
	$(CXX) $(CXXFLAGS) -o server/host/game1.s -S server/host/game.cpp

server/host/root4.lo: server/host/root.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/host/root4.lo -c server/host/root.cpp

server/host/root4.o: server/host/root.cpp
	@echo "        Compiling server/host/root.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/host/root4.o -c server/host/root.cpp

server/host/root4.s: server/host/root.cpp
	$(CXX) $(CXXFLAGS) -o server/host/root4.s -S server/host/root.cpp

server/host/serverapplication2.lo: server/host/serverapplication.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/host/serverapplication2.lo -c server/host/serverapplication.cpp

server/host/serverapplication2.o: server/host/serverapplication.cpp
	@echo "        Compiling server/host/serverapplication.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/host/serverapplication2.o -c server/host/serverapplication.cpp

server/host/serverapplication2.s: server/host/serverapplication.cpp
	$(CXX) $(CXXFLAGS) -o server/host/serverapplication2.s -S server/host/serverapplication.cpp

server/host/session4.lo: server/host/session.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/host/session4.lo -c server/host/session.cpp

server/host/session4.o: server/host/session.cpp
	@echo "        Compiling server/host/session.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/host/session4.o -c server/host/session.cpp

server/host/session4.s: server/host/session.cpp
	$(CXX) $(CXXFLAGS) -o server/host/session4.s -S server/host/session.cpp

server/host/user1.lo: server/host/user.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/host/user1.lo -c server/host/user.cpp

server/host/user1.o: server/host/user.cpp
	@echo "        Compiling server/host/user.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/host/user1.o -c server/host/user.cpp

server/host/user1.s: server/host/user.cpp
	$(CXX) $(CXXFLAGS) -o server/host/user1.s -S server/host/user.cpp

server/interface/filebase1.lo: server/interface/filebase.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/interface/filebase1.lo -c server/interface/filebase.cpp

server/interface/filebase1.o: server/interface/filebase.cpp
	@echo "        Compiling server/interface/filebase.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/interface/filebase1.o -c server/interface/filebase.cpp

server/interface/filebase1.s: server/interface/filebase.cpp
	$(CXX) $(CXXFLAGS) -o server/interface/filebase1.s -S server/interface/filebase.cpp

server/interface/hostfile1.lo: server/interface/hostfile.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/interface/hostfile1.lo -c server/interface/hostfile.cpp

server/interface/hostfile1.o: server/interface/hostfile.cpp
	@echo "        Compiling server/interface/hostfile.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/interface/hostfile1.o -c server/interface/hostfile.cpp

server/interface/hostfile1.s: server/interface/hostfile.cpp
	$(CXX) $(CXXFLAGS) -o server/interface/hostfile1.s -S server/interface/hostfile.cpp

server/interface/hostgame1.lo: server/interface/hostgame.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/interface/hostgame1.lo -c server/interface/hostgame.cpp

server/interface/hostgame1.o: server/interface/hostgame.cpp
	@echo "        Compiling server/interface/hostgame.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/interface/hostgame1.o -c server/interface/hostgame.cpp

server/interface/hostgame1.s: server/interface/hostgame.cpp
	$(CXX) $(CXXFLAGS) -o server/interface/hostgame1.s -S server/interface/hostgame.cpp

server/interface/hostplayer1.lo: server/interface/hostplayer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/interface/hostplayer1.lo -c server/interface/hostplayer.cpp

server/interface/hostplayer1.o: server/interface/hostplayer.cpp
	@echo "        Compiling server/interface/hostplayer.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/interface/hostplayer1.o -c server/interface/hostplayer.cpp

server/interface/hostplayer1.s: server/interface/hostplayer.cpp
	$(CXX) $(CXXFLAGS) -o server/interface/hostplayer1.s -S server/interface/hostplayer.cpp

server/interface/hostschedule1.lo: server/interface/hostschedule.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/interface/hostschedule1.lo -c server/interface/hostschedule.cpp

server/interface/hostschedule1.o: server/interface/hostschedule.cpp
	@echo "        Compiling server/interface/hostschedule.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/interface/hostschedule1.o -c server/interface/hostschedule.cpp

server/interface/hostschedule1.s: server/interface/hostschedule.cpp
	$(CXX) $(CXXFLAGS) -o server/interface/hostschedule1.s -S server/interface/hostschedule.cpp

server/interface/hosttool1.lo: server/interface/hosttool.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/interface/hosttool1.lo -c server/interface/hosttool.cpp

server/interface/hosttool1.o: server/interface/hosttool.cpp
	@echo "        Compiling server/interface/hosttool.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/interface/hosttool1.o -c server/interface/hosttool.cpp

server/interface/hosttool1.s: server/interface/hosttool.cpp
	$(CXX) $(CXXFLAGS) -o server/interface/hosttool1.s -S server/interface/hosttool.cpp

server/interface/hostturn1.lo: server/interface/hostturn.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/interface/hostturn1.lo -c server/interface/hostturn.cpp

server/interface/hostturn1.o: server/interface/hostturn.cpp
	@echo "        Compiling server/interface/hostturn.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/interface/hostturn1.o -c server/interface/hostturn.cpp

server/interface/hostturn1.s: server/interface/hostturn.cpp
	$(CXX) $(CXXFLAGS) -o server/interface/hostturn1.s -S server/interface/hostturn.cpp

server/mailout/commandhandler2.lo: server/mailout/commandhandler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/mailout/commandhandler2.lo -c server/mailout/commandhandler.cpp

server/mailout/commandhandler2.o: server/mailout/commandhandler.cpp
	@echo "        Compiling server/mailout/commandhandler.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/mailout/commandhandler2.o -c server/mailout/commandhandler.cpp

server/mailout/commandhandler2.s: server/mailout/commandhandler.cpp
	$(CXX) $(CXXFLAGS) -o server/mailout/commandhandler2.s -S server/mailout/commandhandler.cpp

server/mailout/configuration8.lo: server/mailout/configuration.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/mailout/configuration8.lo -c server/mailout/configuration.cpp

server/mailout/configuration8.o: server/mailout/configuration.cpp
	@echo "        Compiling server/mailout/configuration.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/mailout/configuration8.o -c server/mailout/configuration.cpp

server/mailout/configuration8.s: server/mailout/configuration.cpp
	$(CXX) $(CXXFLAGS) -o server/mailout/configuration8.s -S server/mailout/configuration.cpp

server/mailout/root5.lo: server/mailout/root.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/mailout/root5.lo -c server/mailout/root.cpp

server/mailout/root5.o: server/mailout/root.cpp
	@echo "        Compiling server/mailout/root.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/mailout/root5.o -c server/mailout/root.cpp

server/mailout/root5.s: server/mailout/root.cpp
	$(CXX) $(CXXFLAGS) -o server/mailout/root5.s -S server/mailout/root.cpp

server/mailout/serverapplication3.lo: server/mailout/serverapplication.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/mailout/serverapplication3.lo -c server/mailout/serverapplication.cpp

server/mailout/serverapplication3.o: server/mailout/serverapplication.cpp
	@echo "        Compiling server/mailout/serverapplication.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/mailout/serverapplication3.o -c server/mailout/serverapplication.cpp

server/mailout/serverapplication3.s: server/mailout/serverapplication.cpp
	$(CXX) $(CXXFLAGS) -o server/mailout/serverapplication3.s -S server/mailout/serverapplication.cpp

server/monitor/serverapplication4.lo: server/monitor/serverapplication.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/monitor/serverapplication4.lo -c server/monitor/serverapplication.cpp

server/monitor/serverapplication4.o: server/monitor/serverapplication.cpp
	@echo "        Compiling server/monitor/serverapplication.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/monitor/serverapplication4.o -c server/monitor/serverapplication.cpp

server/monitor/serverapplication4.s: server/monitor/serverapplication.cpp
	$(CXX) $(CXXFLAGS) -o server/monitor/serverapplication4.s -S server/monitor/serverapplication.cpp

server/nntp/root6.lo: server/nntp/root.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/nntp/root6.lo -c server/nntp/root.cpp

server/nntp/root6.o: server/nntp/root.cpp
	@echo "        Compiling server/nntp/root.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/nntp/root6.o -c server/nntp/root.cpp

server/nntp/root6.s: server/nntp/root.cpp
	$(CXX) $(CXXFLAGS) -o server/nntp/root6.s -S server/nntp/root.cpp

server/nntp/serverapplication5.lo: server/nntp/serverapplication.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/nntp/serverapplication5.lo -c server/nntp/serverapplication.cpp

server/nntp/serverapplication5.o: server/nntp/serverapplication.cpp
	@echo "        Compiling server/nntp/serverapplication.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/nntp/serverapplication5.o -c server/nntp/serverapplication.cpp

server/nntp/serverapplication5.s: server/nntp/serverapplication.cpp
	$(CXX) $(CXXFLAGS) -o server/nntp/serverapplication5.s -S server/nntp/serverapplication.cpp

server/talk/commandhandler3.lo: server/talk/commandhandler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/talk/commandhandler3.lo -c server/talk/commandhandler.cpp

server/talk/commandhandler3.o: server/talk/commandhandler.cpp
	@echo "        Compiling server/talk/commandhandler.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/talk/commandhandler3.o -c server/talk/commandhandler.cpp

server/talk/commandhandler3.s: server/talk/commandhandler.cpp
	$(CXX) $(CXXFLAGS) -o server/talk/commandhandler3.s -S server/talk/commandhandler.cpp

server/talk/configuration9.lo: server/talk/configuration.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/talk/configuration9.lo -c server/talk/configuration.cpp

server/talk/configuration9.o: server/talk/configuration.cpp
	@echo "        Compiling server/talk/configuration.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/talk/configuration9.o -c server/talk/configuration.cpp

server/talk/configuration9.s: server/talk/configuration.cpp
	$(CXX) $(CXXFLAGS) -o server/talk/configuration9.s -S server/talk/configuration.cpp

server/talk/message1.lo: server/talk/message.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/talk/message1.lo -c server/talk/message.cpp

server/talk/message1.o: server/talk/message.cpp
	@echo "        Compiling server/talk/message.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/talk/message1.o -c server/talk/message.cpp

server/talk/message1.s: server/talk/message.cpp
	$(CXX) $(CXXFLAGS) -o server/talk/message1.s -S server/talk/message.cpp

server/talk/render/context1.lo: server/talk/render/context.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/talk/render/context1.lo -c server/talk/render/context.cpp

server/talk/render/context1.o: server/talk/render/context.cpp
	@echo "        Compiling server/talk/render/context.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/talk/render/context1.o -c server/talk/render/context.cpp

server/talk/render/context1.s: server/talk/render/context.cpp
	$(CXX) $(CXXFLAGS) -o server/talk/render/context1.s -S server/talk/render/context.cpp

server/talk/root7.lo: server/talk/root.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/talk/root7.lo -c server/talk/root.cpp

server/talk/root7.o: server/talk/root.cpp
	@echo "        Compiling server/talk/root.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/talk/root7.o -c server/talk/root.cpp

server/talk/root7.s: server/talk/root.cpp
	$(CXX) $(CXXFLAGS) -o server/talk/root7.s -S server/talk/root.cpp

server/talk/serverapplication6.lo: server/talk/serverapplication.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/talk/serverapplication6.lo -c server/talk/serverapplication.cpp

server/talk/serverapplication6.o: server/talk/serverapplication.cpp
	@echo "        Compiling server/talk/serverapplication.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/talk/serverapplication6.o -c server/talk/serverapplication.cpp

server/talk/serverapplication6.s: server/talk/serverapplication.cpp
	$(CXX) $(CXXFLAGS) -o server/talk/serverapplication6.s -S server/talk/serverapplication.cpp

server/talk/session5.lo: server/talk/session.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/talk/session5.lo -c server/talk/session.cpp

server/talk/session5.o: server/talk/session.cpp
	@echo "        Compiling server/talk/session.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/talk/session5.o -c server/talk/session.cpp

server/talk/session5.s: server/talk/session.cpp
	$(CXX) $(CXXFLAGS) -o server/talk/session5.s -S server/talk/session.cpp

server/talk/talkforum1.lo: server/talk/talkforum.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/talk/talkforum1.lo -c server/talk/talkforum.cpp

server/talk/talkforum1.o: server/talk/talkforum.cpp
	@echo "        Compiling server/talk/talkforum.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/talk/talkforum1.o -c server/talk/talkforum.cpp

server/talk/talkforum1.s: server/talk/talkforum.cpp
	$(CXX) $(CXXFLAGS) -o server/talk/talkforum1.s -S server/talk/talkforum.cpp

server/talk/user2.lo: server/talk/user.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/talk/user2.lo -c server/talk/user.cpp

server/talk/user2.o: server/talk/user.cpp
	@echo "        Compiling server/talk/user.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/talk/user2.o -c server/talk/user.cpp

server/talk/user2.s: server/talk/user.cpp
	$(CXX) $(CXXFLAGS) -o server/talk/user2.s -S server/talk/user.cpp

server/types1.lo: server/types.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o server/types1.lo -c server/types.cpp

server/types1.o: server/types.cpp
	@echo "        Compiling server/types.cpp..."
	@$(CXX) $(CXXFLAGS) -o server/types1.o -c server/types.cpp

server/types1.s: server/types.cpp
	$(CXX) $(CXXFLAGS) -o server/types1.s -S server/types.cpp

serverlib: libserverlib.a

share/resource/pcc2tech.xml: scripts/doc.pl $(FILES_MANUAL)
	$(PERL) scripts/doc.pl $(FILES_MANUAL) > $@

tags:
	@etags --recurse client game gfx interpreter main server tools ui util

test: testsuite
	@echo "        Running testsuite..."
	@$(RUN) ./testsuite

testsuite.cpp: $(HEADERS_testsuite)
	@echo "        Generating test driver..."
	@$(PERL) $(CXXTESTDIR)/cxxtestgen.pl --gui=TestController --have-eh --error-printer -o $@ $(HEADERS_testsuite)

testsuite.lo: testsuite.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -U_CXXTEST_HAVE_EH -U_CXXTEST_HAVE_STD -O0 -o testsuite.lo -c testsuite.cpp

testsuite.o: testsuite.cpp
	@echo "        Compiling testsuite.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -U_CXXTEST_HAVE_EH -U_CXXTEST_HAVE_STD -O0 -o testsuite.o -c testsuite.cpp

testsuite.s: testsuite.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -U_CXXTEST_HAVE_EH -U_CXXTEST_HAVE_STD -O0 -o testsuite.s -S testsuite.cpp

u/files.lo: u/files.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/files.lo -c u/files.cpp

u/files.o: u/files.cpp
	@echo "        Compiling u/files.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/files.o -c u/files.cpp

u/files.s: u/files.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/files.s -S u/files.cpp

u/helper/consolecommandhandlermock.lo: \
    u/helper/consolecommandhandlermock.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/helper/consolecommandhandlermock.lo -c u/helper/consolecommandhandlermock.cpp

u/helper/consolecommandhandlermock.o: u/helper/consolecommandhandlermock.cpp
	@echo "        Compiling u/helper/consolecommandhandlermock.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/helper/consolecommandhandlermock.o -c u/helper/consolecommandhandlermock.cpp

u/helper/consolecommandhandlermock.s: u/helper/consolecommandhandlermock.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/helper/consolecommandhandlermock.s -S u/helper/consolecommandhandlermock.cpp

u/helper/contextverifier.lo: u/helper/contextverifier.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/helper/contextverifier.lo -c u/helper/contextverifier.cpp

u/helper/contextverifier.o: u/helper/contextverifier.cpp
	@echo "        Compiling u/helper/contextverifier.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/helper/contextverifier.o -c u/helper/contextverifier.cpp

u/helper/contextverifier.s: u/helper/contextverifier.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/helper/contextverifier.s -S u/helper/contextverifier.cpp

u/t_client_dialogs_objectselectiondialog.lo: \
    u/t_client_dialogs_objectselectiondialog.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_dialogs_objectselectiondialog.lo -c u/t_client_dialogs_objectselectiondialog.cpp

u/t_client_dialogs_objectselectiondialog.o: \
    u/t_client_dialogs_objectselectiondialog.cpp
	@echo "        Compiling u/t_client_dialogs_objectselectiondialog.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_dialogs_objectselectiondialog.o -c u/t_client_dialogs_objectselectiondialog.cpp

u/t_client_dialogs_objectselectiondialog.s: \
    u/t_client_dialogs_objectselectiondialog.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_dialogs_objectselectiondialog.s -S u/t_client_dialogs_objectselectiondialog.cpp

u/t_client_downlink.lo: u/t_client_downlink.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_downlink.lo -c u/t_client_downlink.cpp

u/t_client_downlink.o: u/t_client_downlink.cpp
	@echo "        Compiling u/t_client_downlink.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_downlink.o -c u/t_client_downlink.cpp

u/t_client_downlink.s: u/t_client_downlink.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_downlink.s -S u/t_client_downlink.cpp

u/t_client_objectcursorfactory.lo: u/t_client_objectcursorfactory.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_objectcursorfactory.lo -c u/t_client_objectcursorfactory.cpp

u/t_client_objectcursorfactory.o: u/t_client_objectcursorfactory.cpp
	@echo "        Compiling u/t_client_objectcursorfactory.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_objectcursorfactory.o -c u/t_client_objectcursorfactory.cpp

u/t_client_objectcursorfactory.s: u/t_client_objectcursorfactory.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_objectcursorfactory.s -S u/t_client_objectcursorfactory.cpp

u/t_client_proxy_objectlistener.lo: u/t_client_proxy_objectlistener.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_proxy_objectlistener.lo -c u/t_client_proxy_objectlistener.cpp

u/t_client_proxy_objectlistener.o: u/t_client_proxy_objectlistener.cpp
	@echo "        Compiling u/t_client_proxy_objectlistener.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_proxy_objectlistener.o -c u/t_client_proxy_objectlistener.cpp

u/t_client_proxy_objectlistener.s: u/t_client_proxy_objectlistener.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_proxy_objectlistener.s -S u/t_client_proxy_objectlistener.cpp

u/t_client_si_contextprovider.lo: u/t_client_si_contextprovider.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_contextprovider.lo -c u/t_client_si_contextprovider.cpp

u/t_client_si_contextprovider.o: u/t_client_si_contextprovider.cpp
	@echo "        Compiling u/t_client_si_contextprovider.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_contextprovider.o -c u/t_client_si_contextprovider.cpp

u/t_client_si_contextprovider.s: u/t_client_si_contextprovider.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_contextprovider.s -S u/t_client_si_contextprovider.cpp

u/t_client_si_contextreceiver.lo: u/t_client_si_contextreceiver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_contextreceiver.lo -c u/t_client_si_contextreceiver.cpp

u/t_client_si_contextreceiver.o: u/t_client_si_contextreceiver.cpp
	@echo "        Compiling u/t_client_si_contextreceiver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_contextreceiver.o -c u/t_client_si_contextreceiver.cpp

u/t_client_si_contextreceiver.s: u/t_client_si_contextreceiver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_contextreceiver.s -S u/t_client_si_contextreceiver.cpp

u/t_client_si_control.lo: u/t_client_si_control.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_control.lo -c u/t_client_si_control.cpp

u/t_client_si_control.o: u/t_client_si_control.cpp
	@echo "        Compiling u/t_client_si_control.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_control.o -c u/t_client_si_control.cpp

u/t_client_si_control.s: u/t_client_si_control.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_control.s -S u/t_client_si_control.cpp

u/t_client_si_requestlink1.lo: u/t_client_si_requestlink1.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_requestlink1.lo -c u/t_client_si_requestlink1.cpp

u/t_client_si_requestlink1.o: u/t_client_si_requestlink1.cpp
	@echo "        Compiling u/t_client_si_requestlink1.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_requestlink1.o -c u/t_client_si_requestlink1.cpp

u/t_client_si_requestlink1.s: u/t_client_si_requestlink1.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_requestlink1.s -S u/t_client_si_requestlink1.cpp

u/t_client_si_requestlink2.lo: u/t_client_si_requestlink2.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_requestlink2.lo -c u/t_client_si_requestlink2.cpp

u/t_client_si_requestlink2.o: u/t_client_si_requestlink2.cpp
	@echo "        Compiling u/t_client_si_requestlink2.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_requestlink2.o -c u/t_client_si_requestlink2.cpp

u/t_client_si_requestlink2.s: u/t_client_si_requestlink2.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_requestlink2.s -S u/t_client_si_requestlink2.cpp

u/t_client_si_scriptprocedure.lo: u/t_client_si_scriptprocedure.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_scriptprocedure.lo -c u/t_client_si_scriptprocedure.cpp

u/t_client_si_scriptprocedure.o: u/t_client_si_scriptprocedure.cpp
	@echo "        Compiling u/t_client_si_scriptprocedure.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_scriptprocedure.o -c u/t_client_si_scriptprocedure.cpp

u/t_client_si_scriptprocedure.s: u/t_client_si_scriptprocedure.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_scriptprocedure.s -S u/t_client_si_scriptprocedure.cpp

u/t_client_si_usercall.lo: u/t_client_si_usercall.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_usercall.lo -c u/t_client_si_usercall.cpp

u/t_client_si_usercall.o: u/t_client_si_usercall.cpp
	@echo "        Compiling u/t_client_si_usercall.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_usercall.o -c u/t_client_si_usercall.cpp

u/t_client_si_usercall.s: u/t_client_si_usercall.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_usercall.s -S u/t_client_si_usercall.cpp

u/t_client_si_usertask.lo: u/t_client_si_usertask.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_usertask.lo -c u/t_client_si_usertask.cpp

u/t_client_si_usertask.o: u/t_client_si_usertask.cpp
	@echo "        Compiling u/t_client_si_usertask.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_usertask.o -c u/t_client_si_usertask.cpp

u/t_client_si_usertask.s: u/t_client_si_usertask.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_usertask.s -S u/t_client_si_usertask.cpp

u/t_client_si_widgetfunction.lo: u/t_client_si_widgetfunction.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_widgetfunction.lo -c u/t_client_si_widgetfunction.cpp

u/t_client_si_widgetfunction.o: u/t_client_si_widgetfunction.cpp
	@echo "        Compiling u/t_client_si_widgetfunction.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_widgetfunction.o -c u/t_client_si_widgetfunction.cpp

u/t_client_si_widgetfunction.s: u/t_client_si_widgetfunction.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_client_si_widgetfunction.s -S u/t_client_si_widgetfunction.cpp

u/t_game_actions_basebuildaction.lo: u/t_game_actions_basebuildaction.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_basebuildaction.lo -c u/t_game_actions_basebuildaction.cpp

u/t_game_actions_basebuildaction.o: u/t_game_actions_basebuildaction.cpp
	@echo "        Compiling u/t_game_actions_basebuildaction.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_basebuildaction.o -c u/t_game_actions_basebuildaction.cpp

u/t_game_actions_basebuildaction.s: u/t_game_actions_basebuildaction.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_basebuildaction.s -S u/t_game_actions_basebuildaction.cpp

u/t_game_actions_basebuildexecutor.lo: \
    u/t_game_actions_basebuildexecutor.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_basebuildexecutor.lo -c u/t_game_actions_basebuildexecutor.cpp

u/t_game_actions_basebuildexecutor.o: u/t_game_actions_basebuildexecutor.cpp
	@echo "        Compiling u/t_game_actions_basebuildexecutor.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_basebuildexecutor.o -c u/t_game_actions_basebuildexecutor.cpp

u/t_game_actions_basebuildexecutor.s: u/t_game_actions_basebuildexecutor.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_basebuildexecutor.s -S u/t_game_actions_basebuildexecutor.cpp

u/t_game_actions_buildammo.lo: u/t_game_actions_buildammo.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_buildammo.lo -c u/t_game_actions_buildammo.cpp

u/t_game_actions_buildammo.o: u/t_game_actions_buildammo.cpp
	@echo "        Compiling u/t_game_actions_buildammo.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_buildammo.o -c u/t_game_actions_buildammo.cpp

u/t_game_actions_buildammo.s: u/t_game_actions_buildammo.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_buildammo.s -S u/t_game_actions_buildammo.cpp

u/t_game_actions_buildparts.lo: u/t_game_actions_buildparts.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_buildparts.lo -c u/t_game_actions_buildparts.cpp

u/t_game_actions_buildparts.o: u/t_game_actions_buildparts.cpp
	@echo "        Compiling u/t_game_actions_buildparts.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_buildparts.o -c u/t_game_actions_buildparts.cpp

u/t_game_actions_buildparts.s: u/t_game_actions_buildparts.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_buildparts.s -S u/t_game_actions_buildparts.cpp

u/t_game_actions_buildship.lo: u/t_game_actions_buildship.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_buildship.lo -c u/t_game_actions_buildship.cpp

u/t_game_actions_buildship.o: u/t_game_actions_buildship.cpp
	@echo "        Compiling u/t_game_actions_buildship.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_buildship.o -c u/t_game_actions_buildship.cpp

u/t_game_actions_buildship.s: u/t_game_actions_buildship.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_buildship.s -S u/t_game_actions_buildship.cpp

u/t_game_actions_buildstarbase.lo: u/t_game_actions_buildstarbase.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_buildstarbase.lo -c u/t_game_actions_buildstarbase.cpp

u/t_game_actions_buildstarbase.o: u/t_game_actions_buildstarbase.cpp
	@echo "        Compiling u/t_game_actions_buildstarbase.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_buildstarbase.o -c u/t_game_actions_buildstarbase.cpp

u/t_game_actions_buildstarbase.s: u/t_game_actions_buildstarbase.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_buildstarbase.s -S u/t_game_actions_buildstarbase.cpp

u/t_game_actions_buildstructures.lo: u/t_game_actions_buildstructures.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_buildstructures.lo -c u/t_game_actions_buildstructures.cpp

u/t_game_actions_buildstructures.o: u/t_game_actions_buildstructures.cpp
	@echo "        Compiling u/t_game_actions_buildstructures.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_buildstructures.o -c u/t_game_actions_buildstructures.cpp

u/t_game_actions_buildstructures.s: u/t_game_actions_buildstructures.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_buildstructures.s -S u/t_game_actions_buildstructures.cpp

u/t_game_actions_cargocostaction.lo: u/t_game_actions_cargocostaction.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_cargocostaction.lo -c u/t_game_actions_cargocostaction.cpp

u/t_game_actions_cargocostaction.o: u/t_game_actions_cargocostaction.cpp
	@echo "        Compiling u/t_game_actions_cargocostaction.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_cargocostaction.o -c u/t_game_actions_cargocostaction.cpp

u/t_game_actions_cargocostaction.s: u/t_game_actions_cargocostaction.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_cargocostaction.s -S u/t_game_actions_cargocostaction.cpp

u/t_game_actions_cargotransfer.lo: u/t_game_actions_cargotransfer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_cargotransfer.lo -c u/t_game_actions_cargotransfer.cpp

u/t_game_actions_cargotransfer.o: u/t_game_actions_cargotransfer.cpp
	@echo "        Compiling u/t_game_actions_cargotransfer.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_cargotransfer.o -c u/t_game_actions_cargotransfer.cpp

u/t_game_actions_cargotransfer.s: u/t_game_actions_cargotransfer.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_cargotransfer.s -S u/t_game_actions_cargotransfer.cpp

u/t_game_actions_cargotransfersetup.lo: \
    u/t_game_actions_cargotransfersetup.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_cargotransfersetup.lo -c u/t_game_actions_cargotransfersetup.cpp

u/t_game_actions_cargotransfersetup.o: \
    u/t_game_actions_cargotransfersetup.cpp
	@echo "        Compiling u/t_game_actions_cargotransfersetup.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_cargotransfersetup.o -c u/t_game_actions_cargotransfersetup.cpp

u/t_game_actions_cargotransfersetup.s: \
    u/t_game_actions_cargotransfersetup.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_cargotransfersetup.s -S u/t_game_actions_cargotransfersetup.cpp

u/t_game_actions_preconditions.lo: u/t_game_actions_preconditions.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_preconditions.lo -c u/t_game_actions_preconditions.cpp

u/t_game_actions_preconditions.o: u/t_game_actions_preconditions.cpp
	@echo "        Compiling u/t_game_actions_preconditions.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_preconditions.o -c u/t_game_actions_preconditions.cpp

u/t_game_actions_preconditions.s: u/t_game_actions_preconditions.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_preconditions.s -S u/t_game_actions_preconditions.cpp

u/t_game_actions_techupgrade.lo: u/t_game_actions_techupgrade.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_techupgrade.lo -c u/t_game_actions_techupgrade.cpp

u/t_game_actions_techupgrade.o: u/t_game_actions_techupgrade.cpp
	@echo "        Compiling u/t_game_actions_techupgrade.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_techupgrade.o -c u/t_game_actions_techupgrade.cpp

u/t_game_actions_techupgrade.s: u/t_game_actions_techupgrade.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_actions_techupgrade.s -S u/t_game_actions_techupgrade.cpp

u/t_game_alliance_level.lo: u/t_game_alliance_level.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_alliance_level.lo -c u/t_game_alliance_level.cpp

u/t_game_alliance_level.o: u/t_game_alliance_level.cpp
	@echo "        Compiling u/t_game_alliance_level.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_alliance_level.o -c u/t_game_alliance_level.cpp

u/t_game_alliance_level.s: u/t_game_alliance_level.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_alliance_level.s -S u/t_game_alliance_level.cpp

u/t_game_browser_account.lo: u/t_game_browser_account.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_browser_account.lo -c u/t_game_browser_account.cpp

u/t_game_browser_account.o: u/t_game_browser_account.cpp
	@echo "        Compiling u/t_game_browser_account.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_browser_account.o -c u/t_game_browser_account.cpp

u/t_game_browser_account.s: u/t_game_browser_account.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_browser_account.s -S u/t_game_browser_account.cpp

u/t_game_browser_folder.lo: u/t_game_browser_folder.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_browser_folder.lo -c u/t_game_browser_folder.cpp

u/t_game_browser_folder.o: u/t_game_browser_folder.cpp
	@echo "        Compiling u/t_game_browser_folder.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_browser_folder.o -c u/t_game_browser_folder.cpp

u/t_game_browser_folder.s: u/t_game_browser_folder.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_browser_folder.s -S u/t_game_browser_folder.cpp

u/t_game_browser_handler.lo: u/t_game_browser_handler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_browser_handler.lo -c u/t_game_browser_handler.cpp

u/t_game_browser_handler.o: u/t_game_browser_handler.cpp
	@echo "        Compiling u/t_game_browser_handler.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_browser_handler.o -c u/t_game_browser_handler.cpp

u/t_game_browser_handler.s: u/t_game_browser_handler.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_browser_handler.s -S u/t_game_browser_handler.cpp

u/t_game_browser_handlerlist.lo: u/t_game_browser_handlerlist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_browser_handlerlist.lo -c u/t_game_browser_handlerlist.cpp

u/t_game_browser_handlerlist.o: u/t_game_browser_handlerlist.cpp
	@echo "        Compiling u/t_game_browser_handlerlist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_browser_handlerlist.o -c u/t_game_browser_handlerlist.cpp

u/t_game_browser_handlerlist.s: u/t_game_browser_handlerlist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_browser_handlerlist.s -S u/t_game_browser_handlerlist.cpp

u/t_game_browser_unsupportedaccountfolder.lo: \
    u/t_game_browser_unsupportedaccountfolder.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_browser_unsupportedaccountfolder.lo -c u/t_game_browser_unsupportedaccountfolder.cpp

u/t_game_browser_unsupportedaccountfolder.o: \
    u/t_game_browser_unsupportedaccountfolder.cpp
	@echo "        Compiling u/t_game_browser_unsupportedaccountfolder.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_browser_unsupportedaccountfolder.o -c u/t_game_browser_unsupportedaccountfolder.cpp

u/t_game_browser_unsupportedaccountfolder.s: \
    u/t_game_browser_unsupportedaccountfolder.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_browser_unsupportedaccountfolder.s -S u/t_game_browser_unsupportedaccountfolder.cpp

u/t_game_cargocontainer.lo: u/t_game_cargocontainer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_cargocontainer.lo -c u/t_game_cargocontainer.cpp

u/t_game_cargocontainer.o: u/t_game_cargocontainer.cpp
	@echo "        Compiling u/t_game_cargocontainer.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_cargocontainer.o -c u/t_game_cargocontainer.cpp

u/t_game_cargocontainer.s: u/t_game_cargocontainer.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_cargocontainer.s -S u/t_game_cargocontainer.cpp

u/t_game_cargospec.lo: u/t_game_cargospec.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_cargospec.lo -c u/t_game_cargospec.cpp

u/t_game_cargospec.o: u/t_game_cargospec.cpp
	@echo "        Compiling u/t_game_cargospec.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_cargospec.o -c u/t_game_cargospec.cpp

u/t_game_cargospec.s: u/t_game_cargospec.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_cargospec.s -S u/t_game_cargospec.cpp

u/t_game_config_aliasoption.lo: u/t_game_config_aliasoption.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_aliasoption.lo -c u/t_game_config_aliasoption.cpp

u/t_game_config_aliasoption.o: u/t_game_config_aliasoption.cpp
	@echo "        Compiling u/t_game_config_aliasoption.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_aliasoption.o -c u/t_game_config_aliasoption.cpp

u/t_game_config_aliasoption.s: u/t_game_config_aliasoption.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_aliasoption.s -S u/t_game_config_aliasoption.cpp

u/t_game_config_bitsetvalueparser.lo: u/t_game_config_bitsetvalueparser.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_bitsetvalueparser.lo -c u/t_game_config_bitsetvalueparser.cpp

u/t_game_config_bitsetvalueparser.o: u/t_game_config_bitsetvalueparser.cpp
	@echo "        Compiling u/t_game_config_bitsetvalueparser.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_bitsetvalueparser.o -c u/t_game_config_bitsetvalueparser.cpp

u/t_game_config_bitsetvalueparser.s: u/t_game_config_bitsetvalueparser.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_bitsetvalueparser.s -S u/t_game_config_bitsetvalueparser.cpp

u/t_game_config_booleanvalueparser.lo: \
    u/t_game_config_booleanvalueparser.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_booleanvalueparser.lo -c u/t_game_config_booleanvalueparser.cpp

u/t_game_config_booleanvalueparser.o: u/t_game_config_booleanvalueparser.cpp
	@echo "        Compiling u/t_game_config_booleanvalueparser.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_booleanvalueparser.o -c u/t_game_config_booleanvalueparser.cpp

u/t_game_config_booleanvalueparser.s: u/t_game_config_booleanvalueparser.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_booleanvalueparser.s -S u/t_game_config_booleanvalueparser.cpp

u/t_game_config_collapsibleintegerarrayoption.lo: \
    u/t_game_config_collapsibleintegerarrayoption.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_collapsibleintegerarrayoption.lo -c u/t_game_config_collapsibleintegerarrayoption.cpp

u/t_game_config_collapsibleintegerarrayoption.o: \
    u/t_game_config_collapsibleintegerarrayoption.cpp
	@echo "        Compiling u/t_game_config_collapsibleintegerarrayoption.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_collapsibleintegerarrayoption.o -c u/t_game_config_collapsibleintegerarrayoption.cpp

u/t_game_config_collapsibleintegerarrayoption.s: \
    u/t_game_config_collapsibleintegerarrayoption.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_collapsibleintegerarrayoption.s -S u/t_game_config_collapsibleintegerarrayoption.cpp

u/t_game_config_configuration.lo: u/t_game_config_configuration.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_configuration.lo -c u/t_game_config_configuration.cpp

u/t_game_config_configuration.o: u/t_game_config_configuration.cpp
	@echo "        Compiling u/t_game_config_configuration.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_configuration.o -c u/t_game_config_configuration.cpp

u/t_game_config_configuration.s: u/t_game_config_configuration.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_configuration.s -S u/t_game_config_configuration.cpp

u/t_game_config_configurationoption.lo: \
    u/t_game_config_configurationoption.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_configurationoption.lo -c u/t_game_config_configurationoption.cpp

u/t_game_config_configurationoption.o: \
    u/t_game_config_configurationoption.cpp
	@echo "        Compiling u/t_game_config_configurationoption.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_configurationoption.o -c u/t_game_config_configurationoption.cpp

u/t_game_config_configurationoption.s: \
    u/t_game_config_configurationoption.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_configurationoption.s -S u/t_game_config_configurationoption.cpp

u/t_game_config_costarrayoption.lo: u/t_game_config_costarrayoption.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_costarrayoption.lo -c u/t_game_config_costarrayoption.cpp

u/t_game_config_costarrayoption.o: u/t_game_config_costarrayoption.cpp
	@echo "        Compiling u/t_game_config_costarrayoption.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_costarrayoption.o -c u/t_game_config_costarrayoption.cpp

u/t_game_config_costarrayoption.s: u/t_game_config_costarrayoption.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_costarrayoption.s -S u/t_game_config_costarrayoption.cpp

u/t_game_config_enumvalueparser.lo: u/t_game_config_enumvalueparser.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_enumvalueparser.lo -c u/t_game_config_enumvalueparser.cpp

u/t_game_config_enumvalueparser.o: u/t_game_config_enumvalueparser.cpp
	@echo "        Compiling u/t_game_config_enumvalueparser.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_enumvalueparser.o -c u/t_game_config_enumvalueparser.cpp

u/t_game_config_enumvalueparser.s: u/t_game_config_enumvalueparser.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_enumvalueparser.s -S u/t_game_config_enumvalueparser.cpp

u/t_game_config_genericintegerarrayoption.lo: \
    u/t_game_config_genericintegerarrayoption.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_genericintegerarrayoption.lo -c u/t_game_config_genericintegerarrayoption.cpp

u/t_game_config_genericintegerarrayoption.o: \
    u/t_game_config_genericintegerarrayoption.cpp
	@echo "        Compiling u/t_game_config_genericintegerarrayoption.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_genericintegerarrayoption.o -c u/t_game_config_genericintegerarrayoption.cpp

u/t_game_config_genericintegerarrayoption.s: \
    u/t_game_config_genericintegerarrayoption.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_genericintegerarrayoption.s -S u/t_game_config_genericintegerarrayoption.cpp

u/t_game_config_hostconfiguration.lo: u/t_game_config_hostconfiguration.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_hostconfiguration.lo -c u/t_game_config_hostconfiguration.cpp

u/t_game_config_hostconfiguration.o: u/t_game_config_hostconfiguration.cpp
	@echo "        Compiling u/t_game_config_hostconfiguration.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_hostconfiguration.o -c u/t_game_config_hostconfiguration.cpp

u/t_game_config_hostconfiguration.s: u/t_game_config_hostconfiguration.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_hostconfiguration.s -S u/t_game_config_hostconfiguration.cpp

u/t_game_config_integerarrayoption.lo: \
    u/t_game_config_integerarrayoption.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_integerarrayoption.lo -c u/t_game_config_integerarrayoption.cpp

u/t_game_config_integerarrayoption.o: u/t_game_config_integerarrayoption.cpp
	@echo "        Compiling u/t_game_config_integerarrayoption.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_integerarrayoption.o -c u/t_game_config_integerarrayoption.cpp

u/t_game_config_integerarrayoption.s: u/t_game_config_integerarrayoption.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_integerarrayoption.s -S u/t_game_config_integerarrayoption.cpp

u/t_game_config_integeroption.lo: u/t_game_config_integeroption.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_integeroption.lo -c u/t_game_config_integeroption.cpp

u/t_game_config_integeroption.o: u/t_game_config_integeroption.cpp
	@echo "        Compiling u/t_game_config_integeroption.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_integeroption.o -c u/t_game_config_integeroption.cpp

u/t_game_config_integeroption.s: u/t_game_config_integeroption.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_integeroption.s -S u/t_game_config_integeroption.cpp

u/t_game_config_integervalueparser.lo: \
    u/t_game_config_integervalueparser.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_integervalueparser.lo -c u/t_game_config_integervalueparser.cpp

u/t_game_config_integervalueparser.o: u/t_game_config_integervalueparser.cpp
	@echo "        Compiling u/t_game_config_integervalueparser.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_integervalueparser.o -c u/t_game_config_integervalueparser.cpp

u/t_game_config_integervalueparser.s: u/t_game_config_integervalueparser.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_integervalueparser.s -S u/t_game_config_integervalueparser.cpp

u/t_game_config_stringoption.lo: u/t_game_config_stringoption.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_stringoption.lo -c u/t_game_config_stringoption.cpp

u/t_game_config_stringoption.o: u/t_game_config_stringoption.cpp
	@echo "        Compiling u/t_game_config_stringoption.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_stringoption.o -c u/t_game_config_stringoption.cpp

u/t_game_config_stringoption.s: u/t_game_config_stringoption.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_stringoption.s -S u/t_game_config_stringoption.cpp

u/t_game_config_userconfiguration.lo: u/t_game_config_userconfiguration.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_userconfiguration.lo -c u/t_game_config_userconfiguration.cpp

u/t_game_config_userconfiguration.o: u/t_game_config_userconfiguration.cpp
	@echo "        Compiling u/t_game_config_userconfiguration.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_userconfiguration.o -c u/t_game_config_userconfiguration.cpp

u/t_game_config_userconfiguration.s: u/t_game_config_userconfiguration.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_userconfiguration.s -S u/t_game_config_userconfiguration.cpp

u/t_game_config_valueparser.lo: u/t_game_config_valueparser.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_valueparser.lo -c u/t_game_config_valueparser.cpp

u/t_game_config_valueparser.o: u/t_game_config_valueparser.cpp
	@echo "        Compiling u/t_game_config_valueparser.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_valueparser.o -c u/t_game_config_valueparser.cpp

u/t_game_config_valueparser.s: u/t_game_config_valueparser.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_config_valueparser.s -S u/t_game_config_valueparser.cpp

u/t_game_db_drawingatommap.lo: u/t_game_db_drawingatommap.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_db_drawingatommap.lo -c u/t_game_db_drawingatommap.cpp

u/t_game_db_drawingatommap.o: u/t_game_db_drawingatommap.cpp
	@echo "        Compiling u/t_game_db_drawingatommap.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_db_drawingatommap.o -c u/t_game_db_drawingatommap.cpp

u/t_game_db_drawingatommap.s: u/t_game_db_drawingatommap.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_db_drawingatommap.s -S u/t_game_db_drawingatommap.cpp

u/t_game_db_fleetloader.lo: u/t_game_db_fleetloader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_db_fleetloader.lo -c u/t_game_db_fleetloader.cpp

u/t_game_db_fleetloader.o: u/t_game_db_fleetloader.cpp
	@echo "        Compiling u/t_game_db_fleetloader.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_db_fleetloader.o -c u/t_game_db_fleetloader.cpp

u/t_game_db_fleetloader.s: u/t_game_db_fleetloader.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_db_fleetloader.s -S u/t_game_db_fleetloader.cpp

u/t_game_db_structures.lo: u/t_game_db_structures.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_db_structures.lo -c u/t_game_db_structures.cpp

u/t_game_db_structures.o: u/t_game_db_structures.cpp
	@echo "        Compiling u/t_game_db_structures.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_db_structures.o -c u/t_game_db_structures.cpp

u/t_game_db_structures.s: u/t_game_db_structures.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_db_structures.s -S u/t_game_db_structures.cpp

u/t_game_element.lo: u/t_game_element.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_element.lo -c u/t_game_element.cpp

u/t_game_element.o: u/t_game_element.cpp
	@echo "        Compiling u/t_game_element.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_element.o -c u/t_game_element.cpp

u/t_game_element.s: u/t_game_element.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_element.s -S u/t_game_element.cpp

u/t_game_exception.lo: u/t_game_exception.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_exception.lo -c u/t_game_exception.cpp

u/t_game_exception.o: u/t_game_exception.cpp
	@echo "        Compiling u/t_game_exception.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_exception.o -c u/t_game_exception.cpp

u/t_game_exception.s: u/t_game_exception.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_exception.s -S u/t_game_exception.cpp

u/t_game_experiencelevelset.lo: u/t_game_experiencelevelset.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_experiencelevelset.lo -c u/t_game_experiencelevelset.cpp

u/t_game_experiencelevelset.o: u/t_game_experiencelevelset.cpp
	@echo "        Compiling u/t_game_experiencelevelset.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_experiencelevelset.o -c u/t_game_experiencelevelset.cpp

u/t_game_experiencelevelset.s: u/t_game_experiencelevelset.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_experiencelevelset.s -S u/t_game_experiencelevelset.cpp

u/t_game_extra.lo: u/t_game_extra.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_extra.lo -c u/t_game_extra.cpp

u/t_game_extra.o: u/t_game_extra.cpp
	@echo "        Compiling u/t_game_extra.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_extra.o -c u/t_game_extra.cpp

u/t_game_extra.s: u/t_game_extra.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_extra.s -S u/t_game_extra.cpp

u/t_game_extracontainer.lo: u/t_game_extracontainer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_extracontainer.lo -c u/t_game_extracontainer.cpp

u/t_game_extracontainer.o: u/t_game_extracontainer.cpp
	@echo "        Compiling u/t_game_extracontainer.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_extracontainer.o -c u/t_game_extracontainer.cpp

u/t_game_extracontainer.s: u/t_game_extracontainer.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_extracontainer.s -S u/t_game_extracontainer.cpp

u/t_game_extraidentifier.lo: u/t_game_extraidentifier.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_extraidentifier.lo -c u/t_game_extraidentifier.cpp

u/t_game_extraidentifier.o: u/t_game_extraidentifier.cpp
	@echo "        Compiling u/t_game_extraidentifier.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_extraidentifier.o -c u/t_game_extraidentifier.cpp

u/t_game_extraidentifier.s: u/t_game_extraidentifier.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_extraidentifier.s -S u/t_game_extraidentifier.cpp

u/t_game_game.lo: u/t_game_game.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_game.lo -c u/t_game_game.cpp

u/t_game_game.o: u/t_game_game.cpp
	@echo "        Compiling u/t_game_game.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_game.o -c u/t_game_game.cpp

u/t_game_game.s: u/t_game_game.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_game.s -S u/t_game_game.cpp

u/t_game_historyturn.lo: u/t_game_historyturn.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_historyturn.lo -c u/t_game_historyturn.cpp

u/t_game_historyturn.o: u/t_game_historyturn.cpp
	@echo "        Compiling u/t_game_historyturn.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_historyturn.o -c u/t_game_historyturn.cpp

u/t_game_historyturn.s: u/t_game_historyturn.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_historyturn.s -S u/t_game_historyturn.cpp

u/t_game_historyturnlist.lo: u/t_game_historyturnlist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_historyturnlist.lo -c u/t_game_historyturnlist.cpp

u/t_game_historyturnlist.o: u/t_game_historyturnlist.cpp
	@echo "        Compiling u/t_game_historyturnlist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_historyturnlist.o -c u/t_game_historyturnlist.cpp

u/t_game_historyturnlist.s: u/t_game_historyturnlist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_historyturnlist.s -S u/t_game_historyturnlist.cpp

u/t_game_hostversion.lo: u/t_game_hostversion.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_hostversion.lo -c u/t_game_hostversion.cpp

u/t_game_hostversion.o: u/t_game_hostversion.cpp
	@echo "        Compiling u/t_game_hostversion.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_hostversion.o -c u/t_game_hostversion.cpp

u/t_game_hostversion.s: u/t_game_hostversion.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_hostversion.s -S u/t_game_hostversion.cpp

u/t_game_interface_enginecontext.lo: u/t_game_interface_enginecontext.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_enginecontext.lo -c u/t_game_interface_enginecontext.cpp

u/t_game_interface_enginecontext.o: u/t_game_interface_enginecontext.cpp
	@echo "        Compiling u/t_game_interface_enginecontext.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_enginecontext.o -c u/t_game_interface_enginecontext.cpp

u/t_game_interface_enginecontext.s: u/t_game_interface_enginecontext.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_enginecontext.s -S u/t_game_interface_enginecontext.cpp

u/t_game_interface_engineproperty.lo: u/t_game_interface_engineproperty.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_engineproperty.lo -c u/t_game_interface_engineproperty.cpp

u/t_game_interface_engineproperty.o: u/t_game_interface_engineproperty.cpp
	@echo "        Compiling u/t_game_interface_engineproperty.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_engineproperty.o -c u/t_game_interface_engineproperty.cpp

u/t_game_interface_engineproperty.s: u/t_game_interface_engineproperty.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_engineproperty.s -S u/t_game_interface_engineproperty.cpp

u/t_game_interface_explosioncontext.lo: \
    u/t_game_interface_explosioncontext.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_explosioncontext.lo -c u/t_game_interface_explosioncontext.cpp

u/t_game_interface_explosioncontext.o: \
    u/t_game_interface_explosioncontext.cpp
	@echo "        Compiling u/t_game_interface_explosioncontext.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_explosioncontext.o -c u/t_game_interface_explosioncontext.cpp

u/t_game_interface_explosioncontext.s: \
    u/t_game_interface_explosioncontext.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_explosioncontext.s -S u/t_game_interface_explosioncontext.cpp

u/t_game_interface_friendlycodecontext.lo: \
    u/t_game_interface_friendlycodecontext.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_friendlycodecontext.lo -c u/t_game_interface_friendlycodecontext.cpp

u/t_game_interface_friendlycodecontext.o: \
    u/t_game_interface_friendlycodecontext.cpp
	@echo "        Compiling u/t_game_interface_friendlycodecontext.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_friendlycodecontext.o -c u/t_game_interface_friendlycodecontext.cpp

u/t_game_interface_friendlycodecontext.s: \
    u/t_game_interface_friendlycodecontext.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_friendlycodecontext.s -S u/t_game_interface_friendlycodecontext.cpp

u/t_game_interface_iteratorprovider.lo: \
    u/t_game_interface_iteratorprovider.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_iteratorprovider.lo -c u/t_game_interface_iteratorprovider.cpp

u/t_game_interface_iteratorprovider.o: \
    u/t_game_interface_iteratorprovider.cpp
	@echo "        Compiling u/t_game_interface_iteratorprovider.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_iteratorprovider.o -c u/t_game_interface_iteratorprovider.cpp

u/t_game_interface_iteratorprovider.s: \
    u/t_game_interface_iteratorprovider.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_iteratorprovider.s -S u/t_game_interface_iteratorprovider.cpp

u/t_game_interface_missioncontext.lo: u/t_game_interface_missioncontext.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_missioncontext.lo -c u/t_game_interface_missioncontext.cpp

u/t_game_interface_missioncontext.o: u/t_game_interface_missioncontext.cpp
	@echo "        Compiling u/t_game_interface_missioncontext.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_missioncontext.o -c u/t_game_interface_missioncontext.cpp

u/t_game_interface_missioncontext.s: u/t_game_interface_missioncontext.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_missioncontext.s -S u/t_game_interface_missioncontext.cpp

u/t_game_interface_richtextfunctions.lo: \
    u/t_game_interface_richtextfunctions.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_richtextfunctions.lo -c u/t_game_interface_richtextfunctions.cpp

u/t_game_interface_richtextfunctions.o: \
    u/t_game_interface_richtextfunctions.cpp
	@echo "        Compiling u/t_game_interface_richtextfunctions.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_richtextfunctions.o -c u/t_game_interface_richtextfunctions.cpp

u/t_game_interface_richtextfunctions.s: \
    u/t_game_interface_richtextfunctions.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_richtextfunctions.s -S u/t_game_interface_richtextfunctions.cpp

u/t_game_interface_ufocontext.lo: u/t_game_interface_ufocontext.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_ufocontext.lo -c u/t_game_interface_ufocontext.cpp

u/t_game_interface_ufocontext.o: u/t_game_interface_ufocontext.cpp
	@echo "        Compiling u/t_game_interface_ufocontext.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_ufocontext.o -c u/t_game_interface_ufocontext.cpp

u/t_game_interface_ufocontext.s: u/t_game_interface_ufocontext.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_ufocontext.s -S u/t_game_interface_ufocontext.cpp

u/t_game_interface_userinterfaceproperty.lo: \
    u/t_game_interface_userinterfaceproperty.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_userinterfaceproperty.lo -c u/t_game_interface_userinterfaceproperty.cpp

u/t_game_interface_userinterfaceproperty.o: \
    u/t_game_interface_userinterfaceproperty.cpp
	@echo "        Compiling u/t_game_interface_userinterfaceproperty.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_userinterfaceproperty.o -c u/t_game_interface_userinterfaceproperty.cpp

u/t_game_interface_userinterfaceproperty.s: \
    u/t_game_interface_userinterfaceproperty.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_userinterfaceproperty.s -S u/t_game_interface_userinterfaceproperty.cpp

u/t_game_interface_userinterfacepropertyaccessor.lo: \
    u/t_game_interface_userinterfacepropertyaccessor.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_userinterfacepropertyaccessor.lo -c u/t_game_interface_userinterfacepropertyaccessor.cpp

u/t_game_interface_userinterfacepropertyaccessor.o: \
    u/t_game_interface_userinterfacepropertyaccessor.cpp
	@echo "        Compiling u/t_game_interface_userinterfacepropertyaccessor.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_userinterfacepropertyaccessor.o -c u/t_game_interface_userinterfacepropertyaccessor.cpp

u/t_game_interface_userinterfacepropertyaccessor.s: \
    u/t_game_interface_userinterfacepropertyaccessor.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_userinterfacepropertyaccessor.s -S u/t_game_interface_userinterfacepropertyaccessor.cpp

u/t_game_interface_userinterfacepropertystack.lo: \
    u/t_game_interface_userinterfacepropertystack.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_userinterfacepropertystack.lo -c u/t_game_interface_userinterfacepropertystack.cpp

u/t_game_interface_userinterfacepropertystack.o: \
    u/t_game_interface_userinterfacepropertystack.cpp
	@echo "        Compiling u/t_game_interface_userinterfacepropertystack.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_userinterfacepropertystack.o -c u/t_game_interface_userinterfacepropertystack.cpp

u/t_game_interface_userinterfacepropertystack.s: \
    u/t_game_interface_userinterfacepropertystack.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interface_userinterfacepropertystack.s -S u/t_game_interface_userinterfacepropertystack.cpp

u/t_game_interpreterinterface.lo: u/t_game_interpreterinterface.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interpreterinterface.lo -c u/t_game_interpreterinterface.cpp

u/t_game_interpreterinterface.o: u/t_game_interpreterinterface.cpp
	@echo "        Compiling u/t_game_interpreterinterface.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interpreterinterface.o -c u/t_game_interpreterinterface.cpp

u/t_game_interpreterinterface.s: u/t_game_interpreterinterface.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_interpreterinterface.s -S u/t_game_interpreterinterface.cpp

u/t_game_maint_difficultyrater.lo: u/t_game_maint_difficultyrater.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_maint_difficultyrater.lo -c u/t_game_maint_difficultyrater.cpp

u/t_game_maint_difficultyrater.o: u/t_game_maint_difficultyrater.cpp
	@echo "        Compiling u/t_game_maint_difficultyrater.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_maint_difficultyrater.o -c u/t_game_maint_difficultyrater.cpp

u/t_game_maint_difficultyrater.s: u/t_game_maint_difficultyrater.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_maint_difficultyrater.s -S u/t_game_maint_difficultyrater.cpp

u/t_game_maint_sweeper.lo: u/t_game_maint_sweeper.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_maint_sweeper.lo -c u/t_game_maint_sweeper.cpp

u/t_game_maint_sweeper.o: u/t_game_maint_sweeper.cpp
	@echo "        Compiling u/t_game_maint_sweeper.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_maint_sweeper.o -c u/t_game_maint_sweeper.cpp

u/t_game_maint_sweeper.s: u/t_game_maint_sweeper.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_maint_sweeper.s -S u/t_game_maint_sweeper.cpp

u/t_game_map_circularobject.lo: u/t_game_map_circularobject.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_circularobject.lo -c u/t_game_map_circularobject.cpp

u/t_game_map_circularobject.o: u/t_game_map_circularobject.cpp
	@echo "        Compiling u/t_game_map_circularobject.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_circularobject.o -c u/t_game_map_circularobject.cpp

u/t_game_map_circularobject.s: u/t_game_map_circularobject.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_circularobject.s -S u/t_game_map_circularobject.cpp

u/t_game_map_configuration.lo: u/t_game_map_configuration.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_configuration.lo -c u/t_game_map_configuration.cpp

u/t_game_map_configuration.o: u/t_game_map_configuration.cpp
	@echo "        Compiling u/t_game_map_configuration.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_configuration.o -c u/t_game_map_configuration.cpp

u/t_game_map_configuration.s: u/t_game_map_configuration.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_configuration.s -S u/t_game_map_configuration.cpp

u/t_game_map_explosion.lo: u/t_game_map_explosion.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_explosion.lo -c u/t_game_map_explosion.cpp

u/t_game_map_explosion.o: u/t_game_map_explosion.cpp
	@echo "        Compiling u/t_game_map_explosion.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_explosion.o -c u/t_game_map_explosion.cpp

u/t_game_map_explosion.s: u/t_game_map_explosion.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_explosion.s -S u/t_game_map_explosion.cpp

u/t_game_map_fleetmember.lo: u/t_game_map_fleetmember.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_fleetmember.lo -c u/t_game_map_fleetmember.cpp

u/t_game_map_fleetmember.o: u/t_game_map_fleetmember.cpp
	@echo "        Compiling u/t_game_map_fleetmember.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_fleetmember.o -c u/t_game_map_fleetmember.cpp

u/t_game_map_fleetmember.s: u/t_game_map_fleetmember.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_fleetmember.s -S u/t_game_map_fleetmember.cpp

u/t_game_map_ionstorm.lo: u/t_game_map_ionstorm.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_ionstorm.lo -c u/t_game_map_ionstorm.cpp

u/t_game_map_ionstorm.o: u/t_game_map_ionstorm.cpp
	@echo "        Compiling u/t_game_map_ionstorm.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_ionstorm.o -c u/t_game_map_ionstorm.cpp

u/t_game_map_ionstorm.s: u/t_game_map_ionstorm.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_ionstorm.s -S u/t_game_map_ionstorm.cpp

u/t_game_map_mapobject.lo: u/t_game_map_mapobject.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_mapobject.lo -c u/t_game_map_mapobject.cpp

u/t_game_map_mapobject.o: u/t_game_map_mapobject.cpp
	@echo "        Compiling u/t_game_map_mapobject.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_mapobject.o -c u/t_game_map_mapobject.cpp

u/t_game_map_mapobject.s: u/t_game_map_mapobject.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_mapobject.s -S u/t_game_map_mapobject.cpp

u/t_game_map_markings.lo: u/t_game_map_markings.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_markings.lo -c u/t_game_map_markings.cpp

u/t_game_map_markings.o: u/t_game_map_markings.cpp
	@echo "        Compiling u/t_game_map_markings.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_markings.o -c u/t_game_map_markings.cpp

u/t_game_map_markings.s: u/t_game_map_markings.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_markings.s -S u/t_game_map_markings.cpp

u/t_game_map_markingvector.lo: u/t_game_map_markingvector.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_markingvector.lo -c u/t_game_map_markingvector.cpp

u/t_game_map_markingvector.o: u/t_game_map_markingvector.cpp
	@echo "        Compiling u/t_game_map_markingvector.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_markingvector.o -c u/t_game_map_markingvector.cpp

u/t_game_map_markingvector.s: u/t_game_map_markingvector.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_markingvector.s -S u/t_game_map_markingvector.cpp

u/t_game_map_movementpredictor.lo: u/t_game_map_movementpredictor.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_movementpredictor.lo -c u/t_game_map_movementpredictor.cpp

u/t_game_map_movementpredictor.o: u/t_game_map_movementpredictor.cpp
	@echo "        Compiling u/t_game_map_movementpredictor.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_movementpredictor.o -c u/t_game_map_movementpredictor.cpp

u/t_game_map_movementpredictor.s: u/t_game_map_movementpredictor.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_movementpredictor.s -S u/t_game_map_movementpredictor.cpp

u/t_game_map_object.lo: u/t_game_map_object.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_object.lo -c u/t_game_map_object.cpp

u/t_game_map_object.o: u/t_game_map_object.cpp
	@echo "        Compiling u/t_game_map_object.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_object.o -c u/t_game_map_object.cpp

u/t_game_map_object.s: u/t_game_map_object.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_object.s -S u/t_game_map_object.cpp

u/t_game_map_objectcursor.lo: u/t_game_map_objectcursor.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_objectcursor.lo -c u/t_game_map_objectcursor.cpp

u/t_game_map_objectcursor.o: u/t_game_map_objectcursor.cpp
	@echo "        Compiling u/t_game_map_objectcursor.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_objectcursor.o -c u/t_game_map_objectcursor.cpp

u/t_game_map_objectcursor.s: u/t_game_map_objectcursor.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_objectcursor.s -S u/t_game_map_objectcursor.cpp

u/t_game_map_planetpredictor.lo: u/t_game_map_planetpredictor.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_planetpredictor.lo -c u/t_game_map_planetpredictor.cpp

u/t_game_map_planetpredictor.o: u/t_game_map_planetpredictor.cpp
	@echo "        Compiling u/t_game_map_planetpredictor.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_planetpredictor.o -c u/t_game_map_planetpredictor.cpp

u/t_game_map_planetpredictor.s: u/t_game_map_planetpredictor.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_planetpredictor.s -S u/t_game_map_planetpredictor.cpp

u/t_game_map_point.lo: u/t_game_map_point.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_point.lo -c u/t_game_map_point.cpp

u/t_game_map_point.o: u/t_game_map_point.cpp
	@echo "        Compiling u/t_game_map_point.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_point.o -c u/t_game_map_point.cpp

u/t_game_map_point.s: u/t_game_map_point.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_point.s -S u/t_game_map_point.cpp

u/t_game_map_renderlist.lo: u/t_game_map_renderlist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_renderlist.lo -c u/t_game_map_renderlist.cpp

u/t_game_map_renderlist.o: u/t_game_map_renderlist.cpp
	@echo "        Compiling u/t_game_map_renderlist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_renderlist.o -c u/t_game_map_renderlist.cpp

u/t_game_map_renderlist.s: u/t_game_map_renderlist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_renderlist.s -S u/t_game_map_renderlist.cpp

u/t_game_map_ship.lo: u/t_game_map_ship.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_ship.lo -c u/t_game_map_ship.cpp

u/t_game_map_ship.o: u/t_game_map_ship.cpp
	@echo "        Compiling u/t_game_map_ship.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_ship.o -c u/t_game_map_ship.cpp

u/t_game_map_ship.s: u/t_game_map_ship.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_ship.s -S u/t_game_map_ship.cpp

u/t_game_map_viewport.lo: u/t_game_map_viewport.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_viewport.lo -c u/t_game_map_viewport.cpp

u/t_game_map_viewport.o: u/t_game_map_viewport.cpp
	@echo "        Compiling u/t_game_map_viewport.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_viewport.o -c u/t_game_map_viewport.cpp

u/t_game_map_viewport.s: u/t_game_map_viewport.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_map_viewport.s -S u/t_game_map_viewport.cpp

u/t_game_msg_mailbox.lo: u/t_game_msg_mailbox.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_msg_mailbox.lo -c u/t_game_msg_mailbox.cpp

u/t_game_msg_mailbox.o: u/t_game_msg_mailbox.cpp
	@echo "        Compiling u/t_game_msg_mailbox.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_msg_mailbox.o -c u/t_game_msg_mailbox.cpp

u/t_game_msg_mailbox.s: u/t_game_msg_mailbox.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_msg_mailbox.s -S u/t_game_msg_mailbox.cpp

u/t_game_msg_outbox.lo: u/t_game_msg_outbox.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_msg_outbox.lo -c u/t_game_msg_outbox.cpp

u/t_game_msg_outbox.o: u/t_game_msg_outbox.cpp
	@echo "        Compiling u/t_game_msg_outbox.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_msg_outbox.o -c u/t_game_msg_outbox.cpp

u/t_game_msg_outbox.s: u/t_game_msg_outbox.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_msg_outbox.s -S u/t_game_msg_outbox.cpp

u/t_game_parser_datainterface.lo: u/t_game_parser_datainterface.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_parser_datainterface.lo -c u/t_game_parser_datainterface.cpp

u/t_game_parser_datainterface.o: u/t_game_parser_datainterface.cpp
	@echo "        Compiling u/t_game_parser_datainterface.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_parser_datainterface.o -c u/t_game_parser_datainterface.cpp

u/t_game_parser_datainterface.s: u/t_game_parser_datainterface.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_parser_datainterface.s -S u/t_game_parser_datainterface.cpp

u/t_game_parser_messageinformation.lo: \
    u/t_game_parser_messageinformation.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_parser_messageinformation.lo -c u/t_game_parser_messageinformation.cpp

u/t_game_parser_messageinformation.o: u/t_game_parser_messageinformation.cpp
	@echo "        Compiling u/t_game_parser_messageinformation.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_parser_messageinformation.o -c u/t_game_parser_messageinformation.cpp

u/t_game_parser_messageinformation.s: u/t_game_parser_messageinformation.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_parser_messageinformation.s -S u/t_game_parser_messageinformation.cpp

u/t_game_parser_messageparser.lo: u/t_game_parser_messageparser.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_parser_messageparser.lo -c u/t_game_parser_messageparser.cpp

u/t_game_parser_messageparser.o: u/t_game_parser_messageparser.cpp
	@echo "        Compiling u/t_game_parser_messageparser.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_parser_messageparser.o -c u/t_game_parser_messageparser.cpp

u/t_game_parser_messageparser.s: u/t_game_parser_messageparser.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_parser_messageparser.s -S u/t_game_parser_messageparser.cpp

u/t_game_parser_messagetemplate.lo: u/t_game_parser_messagetemplate.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_parser_messagetemplate.lo -c u/t_game_parser_messagetemplate.cpp

u/t_game_parser_messagetemplate.o: u/t_game_parser_messagetemplate.cpp
	@echo "        Compiling u/t_game_parser_messagetemplate.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_parser_messagetemplate.o -c u/t_game_parser_messagetemplate.cpp

u/t_game_parser_messagetemplate.s: u/t_game_parser_messagetemplate.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_parser_messagetemplate.s -S u/t_game_parser_messagetemplate.cpp

u/t_game_parser_messagevalue.lo: u/t_game_parser_messagevalue.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_parser_messagevalue.lo -c u/t_game_parser_messagevalue.cpp

u/t_game_parser_messagevalue.o: u/t_game_parser_messagevalue.cpp
	@echo "        Compiling u/t_game_parser_messagevalue.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_parser_messagevalue.o -c u/t_game_parser_messagevalue.cpp

u/t_game_parser_messagevalue.s: u/t_game_parser_messagevalue.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_parser_messagevalue.s -S u/t_game_parser_messagevalue.cpp

u/t_game_player.lo: u/t_game_player.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_player.lo -c u/t_game_player.cpp

u/t_game_player.o: u/t_game_player.cpp
	@echo "        Compiling u/t_game_player.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_player.o -c u/t_game_player.cpp

u/t_game_player.s: u/t_game_player.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_player.s -S u/t_game_player.cpp

u/t_game_playerarray.lo: u/t_game_playerarray.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_playerarray.lo -c u/t_game_playerarray.cpp

u/t_game_playerarray.o: u/t_game_playerarray.cpp
	@echo "        Compiling u/t_game_playerarray.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_playerarray.o -c u/t_game_playerarray.cpp

u/t_game_playerarray.s: u/t_game_playerarray.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_playerarray.s -S u/t_game_playerarray.cpp

u/t_game_playerbitmatrix.lo: u/t_game_playerbitmatrix.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_playerbitmatrix.lo -c u/t_game_playerbitmatrix.cpp

u/t_game_playerbitmatrix.o: u/t_game_playerbitmatrix.cpp
	@echo "        Compiling u/t_game_playerbitmatrix.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_playerbitmatrix.o -c u/t_game_playerbitmatrix.cpp

u/t_game_playerbitmatrix.s: u/t_game_playerbitmatrix.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_playerbitmatrix.s -S u/t_game_playerbitmatrix.cpp

u/t_game_playerlist.lo: u/t_game_playerlist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_playerlist.lo -c u/t_game_playerlist.cpp

u/t_game_playerlist.o: u/t_game_playerlist.cpp
	@echo "        Compiling u/t_game_playerlist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_playerlist.o -c u/t_game_playerlist.cpp

u/t_game_playerlist.s: u/t_game_playerlist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_playerlist.s -S u/t_game_playerlist.cpp

u/t_game_playerset.lo: u/t_game_playerset.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_playerset.lo -c u/t_game_playerset.cpp

u/t_game_playerset.o: u/t_game_playerset.cpp
	@echo "        Compiling u/t_game_playerset.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_playerset.o -c u/t_game_playerset.cpp

u/t_game_playerset.s: u/t_game_playerset.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_playerset.s -S u/t_game_playerset.cpp

u/t_game_registrationkey.lo: u/t_game_registrationkey.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_registrationkey.lo -c u/t_game_registrationkey.cpp

u/t_game_registrationkey.o: u/t_game_registrationkey.cpp
	@echo "        Compiling u/t_game_registrationkey.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_registrationkey.o -c u/t_game_registrationkey.cpp

u/t_game_registrationkey.s: u/t_game_registrationkey.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_registrationkey.s -S u/t_game_registrationkey.cpp

u/t_game_root.lo: u/t_game_root.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_root.lo -c u/t_game_root.cpp

u/t_game_root.o: u/t_game_root.cpp
	@echo "        Compiling u/t_game_root.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_root.o -c u/t_game_root.cpp

u/t_game_root.s: u/t_game_root.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_root.s -S u/t_game_root.cpp

u/t_game_score_compoundscore.lo: u/t_game_score_compoundscore.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_score_compoundscore.lo -c u/t_game_score_compoundscore.cpp

u/t_game_score_compoundscore.o: u/t_game_score_compoundscore.cpp
	@echo "        Compiling u/t_game_score_compoundscore.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_score_compoundscore.o -c u/t_game_score_compoundscore.cpp

u/t_game_score_compoundscore.s: u/t_game_score_compoundscore.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_score_compoundscore.s -S u/t_game_score_compoundscore.cpp

u/t_game_score_loader.lo: u/t_game_score_loader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_score_loader.lo -c u/t_game_score_loader.cpp

u/t_game_score_loader.o: u/t_game_score_loader.cpp
	@echo "        Compiling u/t_game_score_loader.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_score_loader.o -c u/t_game_score_loader.cpp

u/t_game_score_loader.s: u/t_game_score_loader.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_score_loader.s -S u/t_game_score_loader.cpp

u/t_game_score_turnscore.lo: u/t_game_score_turnscore.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_score_turnscore.lo -c u/t_game_score_turnscore.cpp

u/t_game_score_turnscore.o: u/t_game_score_turnscore.cpp
	@echo "        Compiling u/t_game_score_turnscore.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_score_turnscore.o -c u/t_game_score_turnscore.cpp

u/t_game_score_turnscore.s: u/t_game_score_turnscore.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_score_turnscore.s -S u/t_game_score_turnscore.cpp

u/t_game_score_turnscorelist.lo: u/t_game_score_turnscorelist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_score_turnscorelist.lo -c u/t_game_score_turnscorelist.cpp

u/t_game_score_turnscorelist.o: u/t_game_score_turnscorelist.cpp
	@echo "        Compiling u/t_game_score_turnscorelist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_score_turnscorelist.o -c u/t_game_score_turnscorelist.cpp

u/t_game_score_turnscorelist.s: u/t_game_score_turnscorelist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_score_turnscorelist.s -S u/t_game_score_turnscorelist.cpp

u/t_game_shipbuildorder.lo: u/t_game_shipbuildorder.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_shipbuildorder.lo -c u/t_game_shipbuildorder.cpp

u/t_game_shipbuildorder.o: u/t_game_shipbuildorder.cpp
	@echo "        Compiling u/t_game_shipbuildorder.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_shipbuildorder.o -c u/t_game_shipbuildorder.cpp

u/t_game_shipbuildorder.s: u/t_game_shipbuildorder.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_shipbuildorder.s -S u/t_game_shipbuildorder.cpp

u/t_game_sim_ability.lo: u/t_game_sim_ability.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_ability.lo -c u/t_game_sim_ability.cpp

u/t_game_sim_ability.o: u/t_game_sim_ability.cpp
	@echo "        Compiling u/t_game_sim_ability.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_ability.o -c u/t_game_sim_ability.cpp

u/t_game_sim_ability.s: u/t_game_sim_ability.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_ability.s -S u/t_game_sim_ability.cpp

u/t_game_sim_configuration.lo: u/t_game_sim_configuration.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_configuration.lo -c u/t_game_sim_configuration.cpp

u/t_game_sim_configuration.o: u/t_game_sim_configuration.cpp
	@echo "        Compiling u/t_game_sim_configuration.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_configuration.o -c u/t_game_sim_configuration.cpp

u/t_game_sim_configuration.s: u/t_game_sim_configuration.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_configuration.s -S u/t_game_sim_configuration.cpp

u/t_game_sim_loader.lo: u/t_game_sim_loader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_loader.lo -c u/t_game_sim_loader.cpp

u/t_game_sim_loader.o: u/t_game_sim_loader.cpp
	@echo "        Compiling u/t_game_sim_loader.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_loader.o -c u/t_game_sim_loader.cpp

u/t_game_sim_loader.s: u/t_game_sim_loader.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_loader.s -S u/t_game_sim_loader.cpp

u/t_game_sim_object.lo: u/t_game_sim_object.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_object.lo -c u/t_game_sim_object.cpp

u/t_game_sim_object.o: u/t_game_sim_object.cpp
	@echo "        Compiling u/t_game_sim_object.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_object.o -c u/t_game_sim_object.cpp

u/t_game_sim_object.s: u/t_game_sim_object.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_object.s -S u/t_game_sim_object.cpp

u/t_game_sim_planet.lo: u/t_game_sim_planet.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_planet.lo -c u/t_game_sim_planet.cpp

u/t_game_sim_planet.o: u/t_game_sim_planet.cpp
	@echo "        Compiling u/t_game_sim_planet.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_planet.o -c u/t_game_sim_planet.cpp

u/t_game_sim_planet.s: u/t_game_sim_planet.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_planet.s -S u/t_game_sim_planet.cpp

u/t_game_sim_setup.lo: u/t_game_sim_setup.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_setup.lo -c u/t_game_sim_setup.cpp

u/t_game_sim_setup.o: u/t_game_sim_setup.cpp
	@echo "        Compiling u/t_game_sim_setup.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_setup.o -c u/t_game_sim_setup.cpp

u/t_game_sim_setup.s: u/t_game_sim_setup.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_setup.s -S u/t_game_sim_setup.cpp

u/t_game_sim_ship.lo: u/t_game_sim_ship.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_ship.lo -c u/t_game_sim_ship.cpp

u/t_game_sim_ship.o: u/t_game_sim_ship.cpp
	@echo "        Compiling u/t_game_sim_ship.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_ship.o -c u/t_game_sim_ship.cpp

u/t_game_sim_ship.s: u/t_game_sim_ship.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_ship.s -S u/t_game_sim_ship.cpp

u/t_game_sim_structures.lo: u/t_game_sim_structures.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_structures.lo -c u/t_game_sim_structures.cpp

u/t_game_sim_structures.o: u/t_game_sim_structures.cpp
	@echo "        Compiling u/t_game_sim_structures.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_structures.o -c u/t_game_sim_structures.cpp

u/t_game_sim_structures.s: u/t_game_sim_structures.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_sim_structures.s -S u/t_game_sim_structures.cpp

u/t_game_spec_basecomponentvector.lo: u/t_game_spec_basecomponentvector.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_basecomponentvector.lo -c u/t_game_spec_basecomponentvector.cpp

u/t_game_spec_basecomponentvector.o: u/t_game_spec_basecomponentvector.cpp
	@echo "        Compiling u/t_game_spec_basecomponentvector.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_basecomponentvector.o -c u/t_game_spec_basecomponentvector.cpp

u/t_game_spec_basecomponentvector.s: u/t_game_spec_basecomponentvector.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_basecomponentvector.s -S u/t_game_spec_basecomponentvector.cpp

u/t_game_spec_basichullfunction.lo: u/t_game_spec_basichullfunction.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_basichullfunction.lo -c u/t_game_spec_basichullfunction.cpp

u/t_game_spec_basichullfunction.o: u/t_game_spec_basichullfunction.cpp
	@echo "        Compiling u/t_game_spec_basichullfunction.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_basichullfunction.o -c u/t_game_spec_basichullfunction.cpp

u/t_game_spec_basichullfunction.s: u/t_game_spec_basichullfunction.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_basichullfunction.s -S u/t_game_spec_basichullfunction.cpp

u/t_game_spec_basichullfunctionlist.lo: \
    u/t_game_spec_basichullfunctionlist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_basichullfunctionlist.lo -c u/t_game_spec_basichullfunctionlist.cpp

u/t_game_spec_basichullfunctionlist.o: \
    u/t_game_spec_basichullfunctionlist.cpp
	@echo "        Compiling u/t_game_spec_basichullfunctionlist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_basichullfunctionlist.o -c u/t_game_spec_basichullfunctionlist.cpp

u/t_game_spec_basichullfunctionlist.s: \
    u/t_game_spec_basichullfunctionlist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_basichullfunctionlist.s -S u/t_game_spec_basichullfunctionlist.cpp

u/t_game_spec_beam.lo: u/t_game_spec_beam.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_beam.lo -c u/t_game_spec_beam.cpp

u/t_game_spec_beam.o: u/t_game_spec_beam.cpp
	@echo "        Compiling u/t_game_spec_beam.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_beam.o -c u/t_game_spec_beam.cpp

u/t_game_spec_beam.s: u/t_game_spec_beam.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_beam.s -S u/t_game_spec_beam.cpp

u/t_game_spec_component.lo: u/t_game_spec_component.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_component.lo -c u/t_game_spec_component.cpp

u/t_game_spec_component.o: u/t_game_spec_component.cpp
	@echo "        Compiling u/t_game_spec_component.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_component.o -c u/t_game_spec_component.cpp

u/t_game_spec_component.s: u/t_game_spec_component.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_component.s -S u/t_game_spec_component.cpp

u/t_game_spec_componentnameprovider.lo: \
    u/t_game_spec_componentnameprovider.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_componentnameprovider.lo -c u/t_game_spec_componentnameprovider.cpp

u/t_game_spec_componentnameprovider.o: \
    u/t_game_spec_componentnameprovider.cpp
	@echo "        Compiling u/t_game_spec_componentnameprovider.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_componentnameprovider.o -c u/t_game_spec_componentnameprovider.cpp

u/t_game_spec_componentnameprovider.s: \
    u/t_game_spec_componentnameprovider.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_componentnameprovider.s -S u/t_game_spec_componentnameprovider.cpp

u/t_game_spec_componentvector.lo: u/t_game_spec_componentvector.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_componentvector.lo -c u/t_game_spec_componentvector.cpp

u/t_game_spec_componentvector.o: u/t_game_spec_componentvector.cpp
	@echo "        Compiling u/t_game_spec_componentvector.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_componentvector.o -c u/t_game_spec_componentvector.cpp

u/t_game_spec_componentvector.s: u/t_game_spec_componentvector.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_componentvector.s -S u/t_game_spec_componentvector.cpp

u/t_game_spec_cost.lo: u/t_game_spec_cost.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_cost.lo -c u/t_game_spec_cost.cpp

u/t_game_spec_cost.o: u/t_game_spec_cost.cpp
	@echo "        Compiling u/t_game_spec_cost.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_cost.o -c u/t_game_spec_cost.cpp

u/t_game_spec_cost.s: u/t_game_spec_cost.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_cost.s -S u/t_game_spec_cost.cpp

u/t_game_spec_engine.lo: u/t_game_spec_engine.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_engine.lo -c u/t_game_spec_engine.cpp

u/t_game_spec_engine.o: u/t_game_spec_engine.cpp
	@echo "        Compiling u/t_game_spec_engine.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_engine.o -c u/t_game_spec_engine.cpp

u/t_game_spec_engine.s: u/t_game_spec_engine.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_engine.s -S u/t_game_spec_engine.cpp

u/t_game_spec_friendlycode.lo: u/t_game_spec_friendlycode.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_friendlycode.lo -c u/t_game_spec_friendlycode.cpp

u/t_game_spec_friendlycode.o: u/t_game_spec_friendlycode.cpp
	@echo "        Compiling u/t_game_spec_friendlycode.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_friendlycode.o -c u/t_game_spec_friendlycode.cpp

u/t_game_spec_friendlycode.s: u/t_game_spec_friendlycode.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_friendlycode.s -S u/t_game_spec_friendlycode.cpp

u/t_game_spec_friendlycodelist.lo: u/t_game_spec_friendlycodelist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_friendlycodelist.lo -c u/t_game_spec_friendlycodelist.cpp

u/t_game_spec_friendlycodelist.o: u/t_game_spec_friendlycodelist.cpp
	@echo "        Compiling u/t_game_spec_friendlycodelist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_friendlycodelist.o -c u/t_game_spec_friendlycodelist.cpp

u/t_game_spec_friendlycodelist.s: u/t_game_spec_friendlycodelist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_friendlycodelist.s -S u/t_game_spec_friendlycodelist.cpp

u/t_game_spec_hull.lo: u/t_game_spec_hull.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_hull.lo -c u/t_game_spec_hull.cpp

u/t_game_spec_hull.o: u/t_game_spec_hull.cpp
	@echo "        Compiling u/t_game_spec_hull.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_hull.o -c u/t_game_spec_hull.cpp

u/t_game_spec_hull.s: u/t_game_spec_hull.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_hull.s -S u/t_game_spec_hull.cpp

u/t_game_spec_hullassignmentlist.lo: u/t_game_spec_hullassignmentlist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_hullassignmentlist.lo -c u/t_game_spec_hullassignmentlist.cpp

u/t_game_spec_hullassignmentlist.o: u/t_game_spec_hullassignmentlist.cpp
	@echo "        Compiling u/t_game_spec_hullassignmentlist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_hullassignmentlist.o -c u/t_game_spec_hullassignmentlist.cpp

u/t_game_spec_hullassignmentlist.s: u/t_game_spec_hullassignmentlist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_hullassignmentlist.s -S u/t_game_spec_hullassignmentlist.cpp

u/t_game_spec_hullfunction.lo: u/t_game_spec_hullfunction.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_hullfunction.lo -c u/t_game_spec_hullfunction.cpp

u/t_game_spec_hullfunction.o: u/t_game_spec_hullfunction.cpp
	@echo "        Compiling u/t_game_spec_hullfunction.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_hullfunction.o -c u/t_game_spec_hullfunction.cpp

u/t_game_spec_hullfunction.s: u/t_game_spec_hullfunction.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_hullfunction.s -S u/t_game_spec_hullfunction.cpp

u/t_game_spec_hullfunctionassignmentlist.lo: \
    u/t_game_spec_hullfunctionassignmentlist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_hullfunctionassignmentlist.lo -c u/t_game_spec_hullfunctionassignmentlist.cpp

u/t_game_spec_hullfunctionassignmentlist.o: \
    u/t_game_spec_hullfunctionassignmentlist.cpp
	@echo "        Compiling u/t_game_spec_hullfunctionassignmentlist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_hullfunctionassignmentlist.o -c u/t_game_spec_hullfunctionassignmentlist.cpp

u/t_game_spec_hullfunctionassignmentlist.s: \
    u/t_game_spec_hullfunctionassignmentlist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_hullfunctionassignmentlist.s -S u/t_game_spec_hullfunctionassignmentlist.cpp

u/t_game_spec_hullfunctionlist.lo: u/t_game_spec_hullfunctionlist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_hullfunctionlist.lo -c u/t_game_spec_hullfunctionlist.cpp

u/t_game_spec_hullfunctionlist.o: u/t_game_spec_hullfunctionlist.cpp
	@echo "        Compiling u/t_game_spec_hullfunctionlist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_hullfunctionlist.o -c u/t_game_spec_hullfunctionlist.cpp

u/t_game_spec_hullfunctionlist.s: u/t_game_spec_hullfunctionlist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_hullfunctionlist.s -S u/t_game_spec_hullfunctionlist.cpp

u/t_game_spec_mission.lo: u/t_game_spec_mission.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_mission.lo -c u/t_game_spec_mission.cpp

u/t_game_spec_mission.o: u/t_game_spec_mission.cpp
	@echo "        Compiling u/t_game_spec_mission.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_mission.o -c u/t_game_spec_mission.cpp

u/t_game_spec_mission.s: u/t_game_spec_mission.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_mission.s -S u/t_game_spec_mission.cpp

u/t_game_spec_missionlist.lo: u/t_game_spec_missionlist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_missionlist.lo -c u/t_game_spec_missionlist.cpp

u/t_game_spec_missionlist.o: u/t_game_spec_missionlist.cpp
	@echo "        Compiling u/t_game_spec_missionlist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_missionlist.o -c u/t_game_spec_missionlist.cpp

u/t_game_spec_missionlist.s: u/t_game_spec_missionlist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_missionlist.s -S u/t_game_spec_missionlist.cpp

u/t_game_spec_modifiedhullfunctionlist.lo: \
    u/t_game_spec_modifiedhullfunctionlist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_modifiedhullfunctionlist.lo -c u/t_game_spec_modifiedhullfunctionlist.cpp

u/t_game_spec_modifiedhullfunctionlist.o: \
    u/t_game_spec_modifiedhullfunctionlist.cpp
	@echo "        Compiling u/t_game_spec_modifiedhullfunctionlist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_modifiedhullfunctionlist.o -c u/t_game_spec_modifiedhullfunctionlist.cpp

u/t_game_spec_modifiedhullfunctionlist.s: \
    u/t_game_spec_modifiedhullfunctionlist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_modifiedhullfunctionlist.s -S u/t_game_spec_modifiedhullfunctionlist.cpp

u/t_game_spec_nullcomponentnameprovider.lo: \
    u/t_game_spec_nullcomponentnameprovider.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_nullcomponentnameprovider.lo -c u/t_game_spec_nullcomponentnameprovider.cpp

u/t_game_spec_nullcomponentnameprovider.o: \
    u/t_game_spec_nullcomponentnameprovider.cpp
	@echo "        Compiling u/t_game_spec_nullcomponentnameprovider.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_nullcomponentnameprovider.o -c u/t_game_spec_nullcomponentnameprovider.cpp

u/t_game_spec_nullcomponentnameprovider.s: \
    u/t_game_spec_nullcomponentnameprovider.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_nullcomponentnameprovider.s -S u/t_game_spec_nullcomponentnameprovider.cpp

u/t_game_spec_shiplist.lo: u/t_game_spec_shiplist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_shiplist.lo -c u/t_game_spec_shiplist.cpp

u/t_game_spec_shiplist.o: u/t_game_spec_shiplist.cpp
	@echo "        Compiling u/t_game_spec_shiplist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_shiplist.o -c u/t_game_spec_shiplist.cpp

u/t_game_spec_shiplist.s: u/t_game_spec_shiplist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_shiplist.s -S u/t_game_spec_shiplist.cpp

u/t_game_spec_standardcomponentnameprovider.lo: \
    u/t_game_spec_standardcomponentnameprovider.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_standardcomponentnameprovider.lo -c u/t_game_spec_standardcomponentnameprovider.cpp

u/t_game_spec_standardcomponentnameprovider.o: \
    u/t_game_spec_standardcomponentnameprovider.cpp
	@echo "        Compiling u/t_game_spec_standardcomponentnameprovider.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_standardcomponentnameprovider.o -c u/t_game_spec_standardcomponentnameprovider.cpp

u/t_game_spec_standardcomponentnameprovider.s: \
    u/t_game_spec_standardcomponentnameprovider.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_standardcomponentnameprovider.s -S u/t_game_spec_standardcomponentnameprovider.cpp

u/t_game_spec_torpedo.lo: u/t_game_spec_torpedo.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_torpedo.lo -c u/t_game_spec_torpedo.cpp

u/t_game_spec_torpedo.o: u/t_game_spec_torpedo.cpp
	@echo "        Compiling u/t_game_spec_torpedo.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_torpedo.o -c u/t_game_spec_torpedo.cpp

u/t_game_spec_torpedo.s: u/t_game_spec_torpedo.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_torpedo.s -S u/t_game_spec_torpedo.cpp

u/t_game_spec_torpedolauncher.lo: u/t_game_spec_torpedolauncher.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_torpedolauncher.lo -c u/t_game_spec_torpedolauncher.cpp

u/t_game_spec_torpedolauncher.o: u/t_game_spec_torpedolauncher.cpp
	@echo "        Compiling u/t_game_spec_torpedolauncher.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_torpedolauncher.o -c u/t_game_spec_torpedolauncher.cpp

u/t_game_spec_torpedolauncher.s: u/t_game_spec_torpedolauncher.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_torpedolauncher.s -S u/t_game_spec_torpedolauncher.cpp

u/t_game_spec_weapon.lo: u/t_game_spec_weapon.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_weapon.lo -c u/t_game_spec_weapon.cpp

u/t_game_spec_weapon.o: u/t_game_spec_weapon.cpp
	@echo "        Compiling u/t_game_spec_weapon.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_weapon.o -c u/t_game_spec_weapon.cpp

u/t_game_spec_weapon.s: u/t_game_spec_weapon.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_spec_weapon.s -S u/t_game_spec_weapon.cpp

u/t_game_specificationloader.lo: u/t_game_specificationloader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_specificationloader.lo -c u/t_game_specificationloader.cpp

u/t_game_specificationloader.o: u/t_game_specificationloader.cpp
	@echo "        Compiling u/t_game_specificationloader.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_specificationloader.o -c u/t_game_specificationloader.cpp

u/t_game_specificationloader.s: u/t_game_specificationloader.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_specificationloader.s -S u/t_game_specificationloader.cpp

u/t_game_stringverifier.lo: u/t_game_stringverifier.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_stringverifier.lo -c u/t_game_stringverifier.cpp

u/t_game_stringverifier.o: u/t_game_stringverifier.cpp
	@echo "        Compiling u/t_game_stringverifier.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_stringverifier.o -c u/t_game_stringverifier.cpp

u/t_game_stringverifier.s: u/t_game_stringverifier.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_stringverifier.s -S u/t_game_stringverifier.cpp

u/t_game_tables_basemissionname.lo: u/t_game_tables_basemissionname.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_basemissionname.lo -c u/t_game_tables_basemissionname.cpp

u/t_game_tables_basemissionname.o: u/t_game_tables_basemissionname.cpp
	@echo "        Compiling u/t_game_tables_basemissionname.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_basemissionname.o -c u/t_game_tables_basemissionname.cpp

u/t_game_tables_basemissionname.s: u/t_game_tables_basemissionname.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_basemissionname.s -S u/t_game_tables_basemissionname.cpp

u/t_game_tables_happinesschangename.lo: \
    u/t_game_tables_happinesschangename.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_happinesschangename.lo -c u/t_game_tables_happinesschangename.cpp

u/t_game_tables_happinesschangename.o: \
    u/t_game_tables_happinesschangename.cpp
	@echo "        Compiling u/t_game_tables_happinesschangename.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_happinesschangename.o -c u/t_game_tables_happinesschangename.cpp

u/t_game_tables_happinesschangename.s: \
    u/t_game_tables_happinesschangename.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_happinesschangename.s -S u/t_game_tables_happinesschangename.cpp

u/t_game_tables_happinessname.lo: u/t_game_tables_happinessname.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_happinessname.lo -c u/t_game_tables_happinessname.cpp

u/t_game_tables_happinessname.o: u/t_game_tables_happinessname.cpp
	@echo "        Compiling u/t_game_tables_happinessname.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_happinessname.o -c u/t_game_tables_happinessname.cpp

u/t_game_tables_happinessname.s: u/t_game_tables_happinessname.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_happinessname.s -S u/t_game_tables_happinessname.cpp

u/t_game_tables_headingname.lo: u/t_game_tables_headingname.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_headingname.lo -c u/t_game_tables_headingname.cpp

u/t_game_tables_headingname.o: u/t_game_tables_headingname.cpp
	@echo "        Compiling u/t_game_tables_headingname.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_headingname.o -c u/t_game_tables_headingname.cpp

u/t_game_tables_headingname.s: u/t_game_tables_headingname.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_headingname.s -S u/t_game_tables_headingname.cpp

u/t_game_tables_industrylevel.lo: u/t_game_tables_industrylevel.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_industrylevel.lo -c u/t_game_tables_industrylevel.cpp

u/t_game_tables_industrylevel.o: u/t_game_tables_industrylevel.cpp
	@echo "        Compiling u/t_game_tables_industrylevel.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_industrylevel.o -c u/t_game_tables_industrylevel.cpp

u/t_game_tables_industrylevel.s: u/t_game_tables_industrylevel.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_industrylevel.s -S u/t_game_tables_industrylevel.cpp

u/t_game_tables_ionstormclassname.lo: u/t_game_tables_ionstormclassname.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_ionstormclassname.lo -c u/t_game_tables_ionstormclassname.cpp

u/t_game_tables_ionstormclassname.o: u/t_game_tables_ionstormclassname.cpp
	@echo "        Compiling u/t_game_tables_ionstormclassname.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_ionstormclassname.o -c u/t_game_tables_ionstormclassname.cpp

u/t_game_tables_ionstormclassname.s: u/t_game_tables_ionstormclassname.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_ionstormclassname.s -S u/t_game_tables_ionstormclassname.cpp

u/t_game_tables_mineraldensityclassname.lo: \
    u/t_game_tables_mineraldensityclassname.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_mineraldensityclassname.lo -c u/t_game_tables_mineraldensityclassname.cpp

u/t_game_tables_mineraldensityclassname.o: \
    u/t_game_tables_mineraldensityclassname.cpp
	@echo "        Compiling u/t_game_tables_mineraldensityclassname.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_mineraldensityclassname.o -c u/t_game_tables_mineraldensityclassname.cpp

u/t_game_tables_mineraldensityclassname.s: \
    u/t_game_tables_mineraldensityclassname.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_mineraldensityclassname.s -S u/t_game_tables_mineraldensityclassname.cpp

u/t_game_tables_mineralmassclassname.lo: \
    u/t_game_tables_mineralmassclassname.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_mineralmassclassname.lo -c u/t_game_tables_mineralmassclassname.cpp

u/t_game_tables_mineralmassclassname.o: \
    u/t_game_tables_mineralmassclassname.cpp
	@echo "        Compiling u/t_game_tables_mineralmassclassname.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_mineralmassclassname.o -c u/t_game_tables_mineralmassclassname.cpp

u/t_game_tables_mineralmassclassname.s: \
    u/t_game_tables_mineralmassclassname.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_mineralmassclassname.s -S u/t_game_tables_mineralmassclassname.cpp

u/t_game_tables_nativegovernmentname.lo: \
    u/t_game_tables_nativegovernmentname.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_nativegovernmentname.lo -c u/t_game_tables_nativegovernmentname.cpp

u/t_game_tables_nativegovernmentname.o: \
    u/t_game_tables_nativegovernmentname.cpp
	@echo "        Compiling u/t_game_tables_nativegovernmentname.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_nativegovernmentname.o -c u/t_game_tables_nativegovernmentname.cpp

u/t_game_tables_nativegovernmentname.s: \
    u/t_game_tables_nativegovernmentname.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_nativegovernmentname.s -S u/t_game_tables_nativegovernmentname.cpp

u/t_game_tables_nativeracename.lo: u/t_game_tables_nativeracename.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_nativeracename.lo -c u/t_game_tables_nativeracename.cpp

u/t_game_tables_nativeracename.o: u/t_game_tables_nativeracename.cpp
	@echo "        Compiling u/t_game_tables_nativeracename.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_nativeracename.o -c u/t_game_tables_nativeracename.cpp

u/t_game_tables_nativeracename.s: u/t_game_tables_nativeracename.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_nativeracename.s -S u/t_game_tables_nativeracename.cpp

u/t_game_tables_temperaturename.lo: u/t_game_tables_temperaturename.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_temperaturename.lo -c u/t_game_tables_temperaturename.cpp

u/t_game_tables_temperaturename.o: u/t_game_tables_temperaturename.cpp
	@echo "        Compiling u/t_game_tables_temperaturename.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_temperaturename.o -c u/t_game_tables_temperaturename.cpp

u/t_game_tables_temperaturename.s: u/t_game_tables_temperaturename.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_temperaturename.s -S u/t_game_tables_temperaturename.cpp

u/t_game_tables_wormholestabilityname.lo: \
    u/t_game_tables_wormholestabilityname.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_wormholestabilityname.lo -c u/t_game_tables_wormholestabilityname.cpp

u/t_game_tables_wormholestabilityname.o: \
    u/t_game_tables_wormholestabilityname.cpp
	@echo "        Compiling u/t_game_tables_wormholestabilityname.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_wormholestabilityname.o -c u/t_game_tables_wormholestabilityname.cpp

u/t_game_tables_wormholestabilityname.s: \
    u/t_game_tables_wormholestabilityname.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_tables_wormholestabilityname.s -S u/t_game_tables_wormholestabilityname.cpp

u/t_game_teamsettings.lo: u/t_game_teamsettings.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_teamsettings.lo -c u/t_game_teamsettings.cpp

u/t_game_teamsettings.o: u/t_game_teamsettings.cpp
	@echo "        Compiling u/t_game_teamsettings.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_teamsettings.o -c u/t_game_teamsettings.cpp

u/t_game_teamsettings.s: u/t_game_teamsettings.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_teamsettings.s -S u/t_game_teamsettings.cpp

u/t_game_timestamp.lo: u/t_game_timestamp.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_timestamp.lo -c u/t_game_timestamp.cpp

u/t_game_timestamp.o: u/t_game_timestamp.cpp
	@echo "        Compiling u/t_game_timestamp.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_timestamp.o -c u/t_game_timestamp.cpp

u/t_game_timestamp.s: u/t_game_timestamp.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_timestamp.s -S u/t_game_timestamp.cpp

u/t_game_turn.lo: u/t_game_turn.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_turn.lo -c u/t_game_turn.cpp

u/t_game_turn.o: u/t_game_turn.cpp
	@echo "        Compiling u/t_game_turn.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_turn.o -c u/t_game_turn.cpp

u/t_game_turn.s: u/t_game_turn.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_turn.s -S u/t_game_turn.cpp

u/t_game_turnloader.lo: u/t_game_turnloader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_turnloader.lo -c u/t_game_turnloader.cpp

u/t_game_turnloader.o: u/t_game_turnloader.cpp
	@echo "        Compiling u/t_game_turnloader.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_turnloader.o -c u/t_game_turnloader.cpp

u/t_game_turnloader.s: u/t_game_turnloader.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_turnloader.s -S u/t_game_turnloader.cpp

u/t_game_types.lo: u/t_game_types.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_types.lo -c u/t_game_types.cpp

u/t_game_types.o: u/t_game_types.cpp
	@echo "        Compiling u/t_game_types.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_types.o -c u/t_game_types.cpp

u/t_game_types.s: u/t_game_types.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_types.s -S u/t_game_types.cpp

u/t_game_unitscoredefinitionlist.lo: u/t_game_unitscoredefinitionlist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_unitscoredefinitionlist.lo -c u/t_game_unitscoredefinitionlist.cpp

u/t_game_unitscoredefinitionlist.o: u/t_game_unitscoredefinitionlist.cpp
	@echo "        Compiling u/t_game_unitscoredefinitionlist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_unitscoredefinitionlist.o -c u/t_game_unitscoredefinitionlist.cpp

u/t_game_unitscoredefinitionlist.s: u/t_game_unitscoredefinitionlist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_unitscoredefinitionlist.s -S u/t_game_unitscoredefinitionlist.cpp

u/t_game_unitscorelist.lo: u/t_game_unitscorelist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_unitscorelist.lo -c u/t_game_unitscorelist.cpp

u/t_game_unitscorelist.o: u/t_game_unitscorelist.cpp
	@echo "        Compiling u/t_game_unitscorelist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_unitscorelist.o -c u/t_game_unitscorelist.cpp

u/t_game_unitscorelist.s: u/t_game_unitscorelist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_unitscorelist.s -S u/t_game_unitscorelist.cpp

u/t_game_v3_command.lo: u/t_game_v3_command.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_command.lo -c u/t_game_v3_command.cpp

u/t_game_v3_command.o: u/t_game_v3_command.cpp
	@echo "        Compiling u/t_game_v3_command.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_command.o -c u/t_game_v3_command.cpp

u/t_game_v3_command.s: u/t_game_v3_command.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_command.s -S u/t_game_v3_command.cpp

u/t_game_v3_commandcontainer.lo: u/t_game_v3_commandcontainer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_commandcontainer.lo -c u/t_game_v3_commandcontainer.cpp

u/t_game_v3_commandcontainer.o: u/t_game_v3_commandcontainer.cpp
	@echo "        Compiling u/t_game_v3_commandcontainer.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_commandcontainer.o -c u/t_game_v3_commandcontainer.cpp

u/t_game_v3_commandcontainer.s: u/t_game_v3_commandcontainer.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_commandcontainer.s -S u/t_game_v3_commandcontainer.cpp

u/t_game_v3_commandextra.lo: u/t_game_v3_commandextra.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_commandextra.lo -c u/t_game_v3_commandextra.cpp

u/t_game_v3_commandextra.o: u/t_game_v3_commandextra.cpp
	@echo "        Compiling u/t_game_v3_commandextra.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_commandextra.o -c u/t_game_v3_commandextra.cpp

u/t_game_v3_commandextra.s: u/t_game_v3_commandextra.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_commandextra.s -S u/t_game_v3_commandextra.cpp

u/t_game_v3_controlfile.lo: u/t_game_v3_controlfile.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_controlfile.lo -c u/t_game_v3_controlfile.cpp

u/t_game_v3_controlfile.o: u/t_game_v3_controlfile.cpp
	@echo "        Compiling u/t_game_v3_controlfile.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_controlfile.o -c u/t_game_v3_controlfile.cpp

u/t_game_v3_controlfile.s: u/t_game_v3_controlfile.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_controlfile.s -S u/t_game_v3_controlfile.cpp

u/t_game_v3_hconfig.lo: u/t_game_v3_hconfig.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_hconfig.lo -c u/t_game_v3_hconfig.cpp

u/t_game_v3_hconfig.o: u/t_game_v3_hconfig.cpp
	@echo "        Compiling u/t_game_v3_hconfig.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_hconfig.o -c u/t_game_v3_hconfig.cpp

u/t_game_v3_hconfig.s: u/t_game_v3_hconfig.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_hconfig.s -S u/t_game_v3_hconfig.cpp

u/t_game_v3_loader.lo: u/t_game_v3_loader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_loader.lo -c u/t_game_v3_loader.cpp

u/t_game_v3_loader.o: u/t_game_v3_loader.cpp
	@echo "        Compiling u/t_game_v3_loader.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_loader.o -c u/t_game_v3_loader.cpp

u/t_game_v3_loader.s: u/t_game_v3_loader.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_loader.s -S u/t_game_v3_loader.cpp

u/t_game_v3_outboxreader.lo: u/t_game_v3_outboxreader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_outboxreader.lo -c u/t_game_v3_outboxreader.cpp

u/t_game_v3_outboxreader.o: u/t_game_v3_outboxreader.cpp
	@echo "        Compiling u/t_game_v3_outboxreader.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_outboxreader.o -c u/t_game_v3_outboxreader.cpp

u/t_game_v3_outboxreader.s: u/t_game_v3_outboxreader.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_outboxreader.s -S u/t_game_v3_outboxreader.cpp

u/t_game_v3_packer.lo: u/t_game_v3_packer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_packer.lo -c u/t_game_v3_packer.cpp

u/t_game_v3_packer.o: u/t_game_v3_packer.cpp
	@echo "        Compiling u/t_game_v3_packer.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_packer.o -c u/t_game_v3_packer.cpp

u/t_game_v3_packer.s: u/t_game_v3_packer.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_packer.s -S u/t_game_v3_packer.cpp

u/t_game_v3_resultfile.lo: u/t_game_v3_resultfile.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_resultfile.lo -c u/t_game_v3_resultfile.cpp

u/t_game_v3_resultfile.o: u/t_game_v3_resultfile.cpp
	@echo "        Compiling u/t_game_v3_resultfile.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_resultfile.o -c u/t_game_v3_resultfile.cpp

u/t_game_v3_resultfile.s: u/t_game_v3_resultfile.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_resultfile.s -S u/t_game_v3_resultfile.cpp

u/t_game_v3_resultloader.lo: u/t_game_v3_resultloader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_resultloader.lo -c u/t_game_v3_resultloader.cpp

u/t_game_v3_resultloader.o: u/t_game_v3_resultloader.cpp
	@echo "        Compiling u/t_game_v3_resultloader.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_resultloader.o -c u/t_game_v3_resultloader.cpp

u/t_game_v3_resultloader.s: u/t_game_v3_resultloader.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_resultloader.s -S u/t_game_v3_resultloader.cpp

u/t_game_v3_reverter.lo: u/t_game_v3_reverter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_reverter.lo -c u/t_game_v3_reverter.cpp

u/t_game_v3_reverter.o: u/t_game_v3_reverter.cpp
	@echo "        Compiling u/t_game_v3_reverter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_reverter.o -c u/t_game_v3_reverter.cpp

u/t_game_v3_reverter.s: u/t_game_v3_reverter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_reverter.s -S u/t_game_v3_reverter.cpp

u/t_game_v3_stringverifier.lo: u/t_game_v3_stringverifier.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_stringverifier.lo -c u/t_game_v3_stringverifier.cpp

u/t_game_v3_stringverifier.o: u/t_game_v3_stringverifier.cpp
	@echo "        Compiling u/t_game_v3_stringverifier.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_stringverifier.o -c u/t_game_v3_stringverifier.cpp

u/t_game_v3_stringverifier.s: u/t_game_v3_stringverifier.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_stringverifier.s -S u/t_game_v3_stringverifier.cpp

u/t_game_v3_structures.lo: u/t_game_v3_structures.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_structures.lo -c u/t_game_v3_structures.cpp

u/t_game_v3_structures.o: u/t_game_v3_structures.cpp
	@echo "        Compiling u/t_game_v3_structures.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_structures.o -c u/t_game_v3_structures.cpp

u/t_game_v3_structures.s: u/t_game_v3_structures.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_structures.s -S u/t_game_v3_structures.cpp

u/t_game_v3_trn_andfilter.lo: u/t_game_v3_trn_andfilter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_andfilter.lo -c u/t_game_v3_trn_andfilter.cpp

u/t_game_v3_trn_andfilter.o: u/t_game_v3_trn_andfilter.cpp
	@echo "        Compiling u/t_game_v3_trn_andfilter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_andfilter.o -c u/t_game_v3_trn_andfilter.cpp

u/t_game_v3_trn_andfilter.s: u/t_game_v3_trn_andfilter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_andfilter.s -S u/t_game_v3_trn_andfilter.cpp

u/t_game_v3_trn_constantfilter.lo: u/t_game_v3_trn_constantfilter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_constantfilter.lo -c u/t_game_v3_trn_constantfilter.cpp

u/t_game_v3_trn_constantfilter.o: u/t_game_v3_trn_constantfilter.cpp
	@echo "        Compiling u/t_game_v3_trn_constantfilter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_constantfilter.o -c u/t_game_v3_trn_constantfilter.cpp

u/t_game_v3_trn_constantfilter.s: u/t_game_v3_trn_constantfilter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_constantfilter.s -S u/t_game_v3_trn_constantfilter.cpp

u/t_game_v3_trn_filter.lo: u/t_game_v3_trn_filter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_filter.lo -c u/t_game_v3_trn_filter.cpp

u/t_game_v3_trn_filter.o: u/t_game_v3_trn_filter.cpp
	@echo "        Compiling u/t_game_v3_trn_filter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_filter.o -c u/t_game_v3_trn_filter.cpp

u/t_game_v3_trn_filter.s: u/t_game_v3_trn_filter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_filter.s -S u/t_game_v3_trn_filter.cpp

u/t_game_v3_trn_idfilter.lo: u/t_game_v3_trn_idfilter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_idfilter.lo -c u/t_game_v3_trn_idfilter.cpp

u/t_game_v3_trn_idfilter.o: u/t_game_v3_trn_idfilter.cpp
	@echo "        Compiling u/t_game_v3_trn_idfilter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_idfilter.o -c u/t_game_v3_trn_idfilter.cpp

u/t_game_v3_trn_idfilter.s: u/t_game_v3_trn_idfilter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_idfilter.s -S u/t_game_v3_trn_idfilter.cpp

u/t_game_v3_trn_indexfilter.lo: u/t_game_v3_trn_indexfilter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_indexfilter.lo -c u/t_game_v3_trn_indexfilter.cpp

u/t_game_v3_trn_indexfilter.o: u/t_game_v3_trn_indexfilter.cpp
	@echo "        Compiling u/t_game_v3_trn_indexfilter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_indexfilter.o -c u/t_game_v3_trn_indexfilter.cpp

u/t_game_v3_trn_indexfilter.s: u/t_game_v3_trn_indexfilter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_indexfilter.s -S u/t_game_v3_trn_indexfilter.cpp

u/t_game_v3_trn_namefilter.lo: u/t_game_v3_trn_namefilter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_namefilter.lo -c u/t_game_v3_trn_namefilter.cpp

u/t_game_v3_trn_namefilter.o: u/t_game_v3_trn_namefilter.cpp
	@echo "        Compiling u/t_game_v3_trn_namefilter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_namefilter.o -c u/t_game_v3_trn_namefilter.cpp

u/t_game_v3_trn_namefilter.s: u/t_game_v3_trn_namefilter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_namefilter.s -S u/t_game_v3_trn_namefilter.cpp

u/t_game_v3_trn_negatefilter.lo: u/t_game_v3_trn_negatefilter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_negatefilter.lo -c u/t_game_v3_trn_negatefilter.cpp

u/t_game_v3_trn_negatefilter.o: u/t_game_v3_trn_negatefilter.cpp
	@echo "        Compiling u/t_game_v3_trn_negatefilter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_negatefilter.o -c u/t_game_v3_trn_negatefilter.cpp

u/t_game_v3_trn_negatefilter.s: u/t_game_v3_trn_negatefilter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_negatefilter.s -S u/t_game_v3_trn_negatefilter.cpp

u/t_game_v3_trn_orfilter.lo: u/t_game_v3_trn_orfilter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_orfilter.lo -c u/t_game_v3_trn_orfilter.cpp

u/t_game_v3_trn_orfilter.o: u/t_game_v3_trn_orfilter.cpp
	@echo "        Compiling u/t_game_v3_trn_orfilter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_orfilter.o -c u/t_game_v3_trn_orfilter.cpp

u/t_game_v3_trn_orfilter.s: u/t_game_v3_trn_orfilter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_orfilter.s -S u/t_game_v3_trn_orfilter.cpp

u/t_game_v3_trn_parseexception.lo: u/t_game_v3_trn_parseexception.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_parseexception.lo -c u/t_game_v3_trn_parseexception.cpp

u/t_game_v3_trn_parseexception.o: u/t_game_v3_trn_parseexception.cpp
	@echo "        Compiling u/t_game_v3_trn_parseexception.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_parseexception.o -c u/t_game_v3_trn_parseexception.cpp

u/t_game_v3_trn_parseexception.s: u/t_game_v3_trn_parseexception.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_parseexception.s -S u/t_game_v3_trn_parseexception.cpp

u/t_game_v3_trn_stringfilter.lo: u/t_game_v3_trn_stringfilter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_stringfilter.lo -c u/t_game_v3_trn_stringfilter.cpp

u/t_game_v3_trn_stringfilter.o: u/t_game_v3_trn_stringfilter.cpp
	@echo "        Compiling u/t_game_v3_trn_stringfilter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_stringfilter.o -c u/t_game_v3_trn_stringfilter.cpp

u/t_game_v3_trn_stringfilter.s: u/t_game_v3_trn_stringfilter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_trn_stringfilter.s -S u/t_game_v3_trn_stringfilter.cpp

u/t_game_v3_undoinformation.lo: u/t_game_v3_undoinformation.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_undoinformation.lo -c u/t_game_v3_undoinformation.cpp

u/t_game_v3_undoinformation.o: u/t_game_v3_undoinformation.cpp
	@echo "        Compiling u/t_game_v3_undoinformation.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_undoinformation.o -c u/t_game_v3_undoinformation.cpp

u/t_game_v3_undoinformation.s: u/t_game_v3_undoinformation.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_v3_undoinformation.s -S u/t_game_v3_undoinformation.cpp

u/t_game_vcr_battle.lo: u/t_game_vcr_battle.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_battle.lo -c u/t_game_vcr_battle.cpp

u/t_game_vcr_battle.o: u/t_game_vcr_battle.cpp
	@echo "        Compiling u/t_game_vcr_battle.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_battle.o -c u/t_game_vcr_battle.cpp

u/t_game_vcr_battle.s: u/t_game_vcr_battle.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_battle.s -S u/t_game_vcr_battle.cpp

u/t_game_vcr_classic_algorithm.lo: u/t_game_vcr_classic_algorithm.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_algorithm.lo -c u/t_game_vcr_classic_algorithm.cpp

u/t_game_vcr_classic_algorithm.o: u/t_game_vcr_classic_algorithm.cpp
	@echo "        Compiling u/t_game_vcr_classic_algorithm.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_algorithm.o -c u/t_game_vcr_classic_algorithm.cpp

u/t_game_vcr_classic_algorithm.s: u/t_game_vcr_classic_algorithm.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_algorithm.s -S u/t_game_vcr_classic_algorithm.cpp

u/t_game_vcr_classic_eventlistener.lo: \
    u/t_game_vcr_classic_eventlistener.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_eventlistener.lo -c u/t_game_vcr_classic_eventlistener.cpp

u/t_game_vcr_classic_eventlistener.o: u/t_game_vcr_classic_eventlistener.cpp
	@echo "        Compiling u/t_game_vcr_classic_eventlistener.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_eventlistener.o -c u/t_game_vcr_classic_eventlistener.cpp

u/t_game_vcr_classic_eventlistener.s: u/t_game_vcr_classic_eventlistener.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_eventlistener.s -S u/t_game_vcr_classic_eventlistener.cpp

u/t_game_vcr_classic_eventrecorder.lo: \
    u/t_game_vcr_classic_eventrecorder.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_eventrecorder.lo -c u/t_game_vcr_classic_eventrecorder.cpp

u/t_game_vcr_classic_eventrecorder.o: u/t_game_vcr_classic_eventrecorder.cpp
	@echo "        Compiling u/t_game_vcr_classic_eventrecorder.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_eventrecorder.o -c u/t_game_vcr_classic_eventrecorder.cpp

u/t_game_vcr_classic_eventrecorder.s: u/t_game_vcr_classic_eventrecorder.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_eventrecorder.s -S u/t_game_vcr_classic_eventrecorder.cpp

u/t_game_vcr_classic_hostalgorithm.lo: \
    u/t_game_vcr_classic_hostalgorithm.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_hostalgorithm.lo -c u/t_game_vcr_classic_hostalgorithm.cpp

u/t_game_vcr_classic_hostalgorithm.o: u/t_game_vcr_classic_hostalgorithm.cpp
	@echo "        Compiling u/t_game_vcr_classic_hostalgorithm.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_hostalgorithm.o -c u/t_game_vcr_classic_hostalgorithm.cpp

u/t_game_vcr_classic_hostalgorithm.s: u/t_game_vcr_classic_hostalgorithm.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_hostalgorithm.s -S u/t_game_vcr_classic_hostalgorithm.cpp

u/t_game_vcr_classic_mirroringeventlistener.lo: \
    u/t_game_vcr_classic_mirroringeventlistener.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_mirroringeventlistener.lo -c u/t_game_vcr_classic_mirroringeventlistener.cpp

u/t_game_vcr_classic_mirroringeventlistener.o: \
    u/t_game_vcr_classic_mirroringeventlistener.cpp
	@echo "        Compiling u/t_game_vcr_classic_mirroringeventlistener.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_mirroringeventlistener.o -c u/t_game_vcr_classic_mirroringeventlistener.cpp

u/t_game_vcr_classic_mirroringeventlistener.s: \
    u/t_game_vcr_classic_mirroringeventlistener.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_mirroringeventlistener.s -S u/t_game_vcr_classic_mirroringeventlistener.cpp

u/t_game_vcr_classic_nullvisualizer.lo: \
    u/t_game_vcr_classic_nullvisualizer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_nullvisualizer.lo -c u/t_game_vcr_classic_nullvisualizer.cpp

u/t_game_vcr_classic_nullvisualizer.o: \
    u/t_game_vcr_classic_nullvisualizer.cpp
	@echo "        Compiling u/t_game_vcr_classic_nullvisualizer.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_nullvisualizer.o -c u/t_game_vcr_classic_nullvisualizer.cpp

u/t_game_vcr_classic_nullvisualizer.s: \
    u/t_game_vcr_classic_nullvisualizer.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_nullvisualizer.s -S u/t_game_vcr_classic_nullvisualizer.cpp

u/t_game_vcr_classic_pvcralgorithm.lo: \
    u/t_game_vcr_classic_pvcralgorithm.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_pvcralgorithm.lo -c u/t_game_vcr_classic_pvcralgorithm.cpp

u/t_game_vcr_classic_pvcralgorithm.o: u/t_game_vcr_classic_pvcralgorithm.cpp
	@echo "        Compiling u/t_game_vcr_classic_pvcralgorithm.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_pvcralgorithm.o -c u/t_game_vcr_classic_pvcralgorithm.cpp

u/t_game_vcr_classic_pvcralgorithm.s: u/t_game_vcr_classic_pvcralgorithm.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_pvcralgorithm.s -S u/t_game_vcr_classic_pvcralgorithm.cpp

u/t_game_vcr_classic_statustoken.lo: u/t_game_vcr_classic_statustoken.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_statustoken.lo -c u/t_game_vcr_classic_statustoken.cpp

u/t_game_vcr_classic_statustoken.o: u/t_game_vcr_classic_statustoken.cpp
	@echo "        Compiling u/t_game_vcr_classic_statustoken.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_statustoken.o -c u/t_game_vcr_classic_statustoken.cpp

u/t_game_vcr_classic_statustoken.s: u/t_game_vcr_classic_statustoken.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_statustoken.s -S u/t_game_vcr_classic_statustoken.cpp

u/t_game_vcr_classic_types.lo: u/t_game_vcr_classic_types.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_types.lo -c u/t_game_vcr_classic_types.cpp

u/t_game_vcr_classic_types.o: u/t_game_vcr_classic_types.cpp
	@echo "        Compiling u/t_game_vcr_classic_types.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_types.o -c u/t_game_vcr_classic_types.cpp

u/t_game_vcr_classic_types.s: u/t_game_vcr_classic_types.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_types.s -S u/t_game_vcr_classic_types.cpp

u/t_game_vcr_classic_utils.lo: u/t_game_vcr_classic_utils.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_utils.lo -c u/t_game_vcr_classic_utils.cpp

u/t_game_vcr_classic_utils.o: u/t_game_vcr_classic_utils.cpp
	@echo "        Compiling u/t_game_vcr_classic_utils.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_utils.o -c u/t_game_vcr_classic_utils.cpp

u/t_game_vcr_classic_utils.s: u/t_game_vcr_classic_utils.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_utils.s -S u/t_game_vcr_classic_utils.cpp

u/t_game_vcr_classic_visualizer.lo: u/t_game_vcr_classic_visualizer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_visualizer.lo -c u/t_game_vcr_classic_visualizer.cpp

u/t_game_vcr_classic_visualizer.o: u/t_game_vcr_classic_visualizer.cpp
	@echo "        Compiling u/t_game_vcr_classic_visualizer.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_visualizer.o -c u/t_game_vcr_classic_visualizer.cpp

u/t_game_vcr_classic_visualizer.s: u/t_game_vcr_classic_visualizer.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_classic_visualizer.s -S u/t_game_vcr_classic_visualizer.cpp

u/t_game_vcr_database.lo: u/t_game_vcr_database.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_database.lo -c u/t_game_vcr_database.cpp

u/t_game_vcr_database.o: u/t_game_vcr_database.cpp
	@echo "        Compiling u/t_game_vcr_database.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_database.o -c u/t_game_vcr_database.cpp

u/t_game_vcr_database.s: u/t_game_vcr_database.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_database.s -S u/t_game_vcr_database.cpp

u/t_game_vcr_object.lo: u/t_game_vcr_object.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_object.lo -c u/t_game_vcr_object.cpp

u/t_game_vcr_object.o: u/t_game_vcr_object.cpp
	@echo "        Compiling u/t_game_vcr_object.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_object.o -c u/t_game_vcr_object.cpp

u/t_game_vcr_object.s: u/t_game_vcr_object.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_object.s -S u/t_game_vcr_object.cpp

u/t_game_vcr_score.lo: u/t_game_vcr_score.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_score.lo -c u/t_game_vcr_score.cpp

u/t_game_vcr_score.o: u/t_game_vcr_score.cpp
	@echo "        Compiling u/t_game_vcr_score.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_score.o -c u/t_game_vcr_score.cpp

u/t_game_vcr_score.s: u/t_game_vcr_score.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_game_vcr_score.s -S u/t_game_vcr_score.cpp

u/t_gfx_anim_controller.lo: u/t_gfx_anim_controller.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_anim_controller.lo -c u/t_gfx_anim_controller.cpp

u/t_gfx_anim_controller.o: u/t_gfx_anim_controller.cpp
	@echo "        Compiling u/t_gfx_anim_controller.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_anim_controller.o -c u/t_gfx_anim_controller.cpp

u/t_gfx_anim_controller.s: u/t_gfx_anim_controller.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_anim_controller.s -S u/t_gfx_anim_controller.cpp

u/t_gfx_anim_sprite.lo: u/t_gfx_anim_sprite.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_anim_sprite.lo -c u/t_gfx_anim_sprite.cpp

u/t_gfx_anim_sprite.o: u/t_gfx_anim_sprite.cpp
	@echo "        Compiling u/t_gfx_anim_sprite.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_anim_sprite.o -c u/t_gfx_anim_sprite.cpp

u/t_gfx_anim_sprite.s: u/t_gfx_anim_sprite.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_anim_sprite.s -S u/t_gfx_anim_sprite.cpp

u/t_gfx_basecolorscheme.lo: u/t_gfx_basecolorscheme.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_basecolorscheme.lo -c u/t_gfx_basecolorscheme.cpp

u/t_gfx_basecolorscheme.o: u/t_gfx_basecolorscheme.cpp
	@echo "        Compiling u/t_gfx_basecolorscheme.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_basecolorscheme.o -c u/t_gfx_basecolorscheme.cpp

u/t_gfx_basecolorscheme.s: u/t_gfx_basecolorscheme.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_basecolorscheme.s -S u/t_gfx_basecolorscheme.cpp

u/t_gfx_basecontext.lo: u/t_gfx_basecontext.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_basecontext.lo -c u/t_gfx_basecontext.cpp

u/t_gfx_basecontext.o: u/t_gfx_basecontext.cpp
	@echo "        Compiling u/t_gfx_basecontext.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_basecontext.o -c u/t_gfx_basecontext.cpp

u/t_gfx_basecontext.s: u/t_gfx_basecontext.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_basecontext.s -S u/t_gfx_basecontext.cpp

u/t_gfx_bitmapfont.lo: u/t_gfx_bitmapfont.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_bitmapfont.lo -c u/t_gfx_bitmapfont.cpp

u/t_gfx_bitmapfont.o: u/t_gfx_bitmapfont.cpp
	@echo "        Compiling u/t_gfx_bitmapfont.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_bitmapfont.o -c u/t_gfx_bitmapfont.cpp

u/t_gfx_bitmapfont.s: u/t_gfx_bitmapfont.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_bitmapfont.s -S u/t_gfx_bitmapfont.cpp

u/t_gfx_bitmapglyph.lo: u/t_gfx_bitmapglyph.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_bitmapglyph.lo -c u/t_gfx_bitmapglyph.cpp

u/t_gfx_bitmapglyph.o: u/t_gfx_bitmapglyph.cpp
	@echo "        Compiling u/t_gfx_bitmapglyph.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_bitmapglyph.o -c u/t_gfx_bitmapglyph.cpp

u/t_gfx_bitmapglyph.s: u/t_gfx_bitmapglyph.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_bitmapglyph.s -S u/t_gfx_bitmapglyph.cpp

u/t_gfx_canvas.lo: u/t_gfx_canvas.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_canvas.lo -c u/t_gfx_canvas.cpp

u/t_gfx_canvas.o: u/t_gfx_canvas.cpp
	@echo "        Compiling u/t_gfx_canvas.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_canvas.o -c u/t_gfx_canvas.cpp

u/t_gfx_canvas.s: u/t_gfx_canvas.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_canvas.s -S u/t_gfx_canvas.cpp

u/t_gfx_colorscheme.lo: u/t_gfx_colorscheme.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_colorscheme.lo -c u/t_gfx_colorscheme.cpp

u/t_gfx_colorscheme.o: u/t_gfx_colorscheme.cpp
	@echo "        Compiling u/t_gfx_colorscheme.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_colorscheme.o -c u/t_gfx_colorscheme.cpp

u/t_gfx_colorscheme.s: u/t_gfx_colorscheme.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_colorscheme.s -S u/t_gfx_colorscheme.cpp

u/t_gfx_context.lo: u/t_gfx_context.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_context.lo -c u/t_gfx_context.cpp

u/t_gfx_context.o: u/t_gfx_context.cpp
	@echo "        Compiling u/t_gfx_context.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_context.o -c u/t_gfx_context.cpp

u/t_gfx_context.s: u/t_gfx_context.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_context.s -S u/t_gfx_context.cpp

u/t_gfx_defaultfont.lo: u/t_gfx_defaultfont.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_defaultfont.lo -c u/t_gfx_defaultfont.cpp

u/t_gfx_defaultfont.o: u/t_gfx_defaultfont.cpp
	@echo "        Compiling u/t_gfx_defaultfont.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_defaultfont.o -c u/t_gfx_defaultfont.cpp

u/t_gfx_defaultfont.s: u/t_gfx_defaultfont.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_defaultfont.s -S u/t_gfx_defaultfont.cpp

u/t_gfx_engine.lo: u/t_gfx_engine.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_engine.lo -c u/t_gfx_engine.cpp

u/t_gfx_engine.o: u/t_gfx_engine.cpp
	@echo "        Compiling u/t_gfx_engine.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_engine.o -c u/t_gfx_engine.cpp

u/t_gfx_engine.s: u/t_gfx_engine.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_engine.s -S u/t_gfx_engine.cpp

u/t_gfx_eventconsumer.lo: u/t_gfx_eventconsumer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_eventconsumer.lo -c u/t_gfx_eventconsumer.cpp

u/t_gfx_eventconsumer.o: u/t_gfx_eventconsumer.cpp
	@echo "        Compiling u/t_gfx_eventconsumer.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_eventconsumer.o -c u/t_gfx_eventconsumer.cpp

u/t_gfx_eventconsumer.s: u/t_gfx_eventconsumer.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_eventconsumer.s -S u/t_gfx_eventconsumer.cpp

u/t_gfx_fillpattern.lo: u/t_gfx_fillpattern.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_fillpattern.lo -c u/t_gfx_fillpattern.cpp

u/t_gfx_fillpattern.o: u/t_gfx_fillpattern.cpp
	@echo "        Compiling u/t_gfx_fillpattern.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_fillpattern.o -c u/t_gfx_fillpattern.cpp

u/t_gfx_fillpattern.s: u/t_gfx_fillpattern.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_fillpattern.s -S u/t_gfx_fillpattern.cpp

u/t_gfx_filter.lo: u/t_gfx_filter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_filter.lo -c u/t_gfx_filter.cpp

u/t_gfx_filter.o: u/t_gfx_filter.cpp
	@echo "        Compiling u/t_gfx_filter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_filter.o -c u/t_gfx_filter.cpp

u/t_gfx_filter.s: u/t_gfx_filter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_filter.s -S u/t_gfx_filter.cpp

u/t_gfx_font.lo: u/t_gfx_font.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_font.lo -c u/t_gfx_font.cpp

u/t_gfx_font.o: u/t_gfx_font.cpp
	@echo "        Compiling u/t_gfx_font.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_font.o -c u/t_gfx_font.cpp

u/t_gfx_font.s: u/t_gfx_font.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_font.s -S u/t_gfx_font.cpp

u/t_gfx_fontlist.lo: u/t_gfx_fontlist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_fontlist.lo -c u/t_gfx_fontlist.cpp

u/t_gfx_fontlist.o: u/t_gfx_fontlist.cpp
	@echo "        Compiling u/t_gfx_fontlist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_fontlist.o -c u/t_gfx_fontlist.cpp

u/t_gfx_fontlist.s: u/t_gfx_fontlist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_fontlist.s -S u/t_gfx_fontlist.cpp

u/t_gfx_fontrequest.lo: u/t_gfx_fontrequest.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_fontrequest.lo -c u/t_gfx_fontrequest.cpp

u/t_gfx_fontrequest.o: u/t_gfx_fontrequest.cpp
	@echo "        Compiling u/t_gfx_fontrequest.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_fontrequest.o -c u/t_gfx_fontrequest.cpp

u/t_gfx_fontrequest.s: u/t_gfx_fontrequest.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_fontrequest.s -S u/t_gfx_fontrequest.cpp

u/t_gfx_gen_colorrange.lo: u/t_gfx_gen_colorrange.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_gen_colorrange.lo -c u/t_gfx_gen_colorrange.cpp

u/t_gfx_gen_colorrange.o: u/t_gfx_gen_colorrange.cpp
	@echo "        Compiling u/t_gfx_gen_colorrange.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_gen_colorrange.o -c u/t_gfx_gen_colorrange.cpp

u/t_gfx_gen_colorrange.s: u/t_gfx_gen_colorrange.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_gen_colorrange.s -S u/t_gfx_gen_colorrange.cpp

u/t_gfx_gen_perlinnoise.lo: u/t_gfx_gen_perlinnoise.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_gen_perlinnoise.lo -c u/t_gfx_gen_perlinnoise.cpp

u/t_gfx_gen_perlinnoise.o: u/t_gfx_gen_perlinnoise.cpp
	@echo "        Compiling u/t_gfx_gen_perlinnoise.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_gen_perlinnoise.o -c u/t_gfx_gen_perlinnoise.cpp

u/t_gfx_gen_perlinnoise.s: u/t_gfx_gen_perlinnoise.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_gen_perlinnoise.s -S u/t_gfx_gen_perlinnoise.cpp

u/t_gfx_gen_planet.lo: u/t_gfx_gen_planet.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_gen_planet.lo -c u/t_gfx_gen_planet.cpp

u/t_gfx_gen_planet.o: u/t_gfx_gen_planet.cpp
	@echo "        Compiling u/t_gfx_gen_planet.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_gen_planet.o -c u/t_gfx_gen_planet.cpp

u/t_gfx_gen_planet.s: u/t_gfx_gen_planet.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_gen_planet.s -S u/t_gfx_gen_planet.cpp

u/t_gfx_gen_planetconfig.lo: u/t_gfx_gen_planetconfig.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_gen_planetconfig.lo -c u/t_gfx_gen_planetconfig.cpp

u/t_gfx_gen_planetconfig.o: u/t_gfx_gen_planetconfig.cpp
	@echo "        Compiling u/t_gfx_gen_planetconfig.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_gen_planetconfig.o -c u/t_gfx_gen_planetconfig.cpp

u/t_gfx_gen_planetconfig.s: u/t_gfx_gen_planetconfig.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_gen_planetconfig.s -S u/t_gfx_gen_planetconfig.cpp

u/t_gfx_gen_spaceview.lo: u/t_gfx_gen_spaceview.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_gen_spaceview.lo -c u/t_gfx_gen_spaceview.cpp

u/t_gfx_gen_spaceview.o: u/t_gfx_gen_spaceview.cpp
	@echo "        Compiling u/t_gfx_gen_spaceview.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_gen_spaceview.o -c u/t_gfx_gen_spaceview.cpp

u/t_gfx_gen_spaceview.s: u/t_gfx_gen_spaceview.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_gen_spaceview.s -S u/t_gfx_gen_spaceview.cpp

u/t_gfx_gen_spaceviewconfig.lo: u/t_gfx_gen_spaceviewconfig.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_gen_spaceviewconfig.lo -c u/t_gfx_gen_spaceviewconfig.cpp

u/t_gfx_gen_spaceviewconfig.o: u/t_gfx_gen_spaceviewconfig.cpp
	@echo "        Compiling u/t_gfx_gen_spaceviewconfig.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_gen_spaceviewconfig.o -c u/t_gfx_gen_spaceviewconfig.cpp

u/t_gfx_gen_spaceviewconfig.s: u/t_gfx_gen_spaceviewconfig.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_gen_spaceviewconfig.s -S u/t_gfx_gen_spaceviewconfig.cpp

u/t_gfx_gen_vector3d.lo: u/t_gfx_gen_vector3d.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_gen_vector3d.lo -c u/t_gfx_gen_vector3d.cpp

u/t_gfx_gen_vector3d.o: u/t_gfx_gen_vector3d.cpp
	@echo "        Compiling u/t_gfx_gen_vector3d.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_gen_vector3d.o -c u/t_gfx_gen_vector3d.cpp

u/t_gfx_gen_vector3d.s: u/t_gfx_gen_vector3d.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_gen_vector3d.s -S u/t_gfx_gen_vector3d.cpp

u/t_gfx_graphicsexception.lo: u/t_gfx_graphicsexception.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_graphicsexception.lo -c u/t_gfx_graphicsexception.cpp

u/t_gfx_graphicsexception.o: u/t_gfx_graphicsexception.cpp
	@echo "        Compiling u/t_gfx_graphicsexception.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_graphicsexception.o -c u/t_gfx_graphicsexception.cpp

u/t_gfx_graphicsexception.s: u/t_gfx_graphicsexception.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_graphicsexception.s -S u/t_gfx_graphicsexception.cpp

u/t_gfx_nullcanvas.lo: u/t_gfx_nullcanvas.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_nullcanvas.lo -c u/t_gfx_nullcanvas.cpp

u/t_gfx_nullcanvas.o: u/t_gfx_nullcanvas.cpp
	@echo "        Compiling u/t_gfx_nullcanvas.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_nullcanvas.o -c u/t_gfx_nullcanvas.cpp

u/t_gfx_nullcanvas.s: u/t_gfx_nullcanvas.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_nullcanvas.s -S u/t_gfx_nullcanvas.cpp

u/t_gfx_nullcolorscheme.lo: u/t_gfx_nullcolorscheme.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_nullcolorscheme.lo -c u/t_gfx_nullcolorscheme.cpp

u/t_gfx_nullcolorscheme.o: u/t_gfx_nullcolorscheme.cpp
	@echo "        Compiling u/t_gfx_nullcolorscheme.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_nullcolorscheme.o -c u/t_gfx_nullcolorscheme.cpp

u/t_gfx_nullcolorscheme.s: u/t_gfx_nullcolorscheme.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_nullcolorscheme.s -S u/t_gfx_nullcolorscheme.cpp

u/t_gfx_nullengine.lo: u/t_gfx_nullengine.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_nullengine.lo -c u/t_gfx_nullengine.cpp

u/t_gfx_nullengine.o: u/t_gfx_nullengine.cpp
	@echo "        Compiling u/t_gfx_nullengine.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_nullengine.o -c u/t_gfx_nullengine.cpp

u/t_gfx_nullengine.s: u/t_gfx_nullengine.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_nullengine.s -S u/t_gfx_nullengine.cpp

u/t_gfx_nullresourceprovider.lo: u/t_gfx_nullresourceprovider.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_nullresourceprovider.lo -c u/t_gfx_nullresourceprovider.cpp

u/t_gfx_nullresourceprovider.o: u/t_gfx_nullresourceprovider.cpp
	@echo "        Compiling u/t_gfx_nullresourceprovider.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_nullresourceprovider.o -c u/t_gfx_nullresourceprovider.cpp

u/t_gfx_nullresourceprovider.s: u/t_gfx_nullresourceprovider.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_nullresourceprovider.s -S u/t_gfx_nullresourceprovider.cpp

u/t_gfx_palettizedpixmap.lo: u/t_gfx_palettizedpixmap.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_palettizedpixmap.lo -c u/t_gfx_palettizedpixmap.cpp

u/t_gfx_palettizedpixmap.o: u/t_gfx_palettizedpixmap.cpp
	@echo "        Compiling u/t_gfx_palettizedpixmap.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_palettizedpixmap.o -c u/t_gfx_palettizedpixmap.cpp

u/t_gfx_palettizedpixmap.s: u/t_gfx_palettizedpixmap.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_palettizedpixmap.s -S u/t_gfx_palettizedpixmap.cpp

u/t_gfx_pixmapcanvasimpl.lo: u/t_gfx_pixmapcanvasimpl.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_pixmapcanvasimpl.lo -c u/t_gfx_pixmapcanvasimpl.cpp

u/t_gfx_pixmapcanvasimpl.o: u/t_gfx_pixmapcanvasimpl.cpp
	@echo "        Compiling u/t_gfx_pixmapcanvasimpl.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_pixmapcanvasimpl.o -c u/t_gfx_pixmapcanvasimpl.cpp

u/t_gfx_pixmapcanvasimpl.s: u/t_gfx_pixmapcanvasimpl.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_pixmapcanvasimpl.s -S u/t_gfx_pixmapcanvasimpl.cpp

u/t_gfx_point.lo: u/t_gfx_point.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_point.lo -c u/t_gfx_point.cpp

u/t_gfx_point.o: u/t_gfx_point.cpp
	@echo "        Compiling u/t_gfx_point.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_point.o -c u/t_gfx_point.cpp

u/t_gfx_point.s: u/t_gfx_point.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_point.s -S u/t_gfx_point.cpp

u/t_gfx_primitives.lo: u/t_gfx_primitives.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_primitives.lo -c u/t_gfx_primitives.cpp

u/t_gfx_primitives.o: u/t_gfx_primitives.cpp
	@echo "        Compiling u/t_gfx_primitives.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_primitives.o -c u/t_gfx_primitives.cpp

u/t_gfx_primitives.s: u/t_gfx_primitives.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_primitives.s -S u/t_gfx_primitives.cpp

u/t_gfx_rectangle.lo: u/t_gfx_rectangle.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_rectangle.lo -c u/t_gfx_rectangle.cpp

u/t_gfx_rectangle.o: u/t_gfx_rectangle.cpp
	@echo "        Compiling u/t_gfx_rectangle.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_rectangle.o -c u/t_gfx_rectangle.cpp

u/t_gfx_rectangle.s: u/t_gfx_rectangle.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_rectangle.s -S u/t_gfx_rectangle.cpp

u/t_gfx_resourceprovider.lo: u/t_gfx_resourceprovider.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_resourceprovider.lo -c u/t_gfx_resourceprovider.cpp

u/t_gfx_resourceprovider.o: u/t_gfx_resourceprovider.cpp
	@echo "        Compiling u/t_gfx_resourceprovider.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_resourceprovider.o -c u/t_gfx_resourceprovider.cpp

u/t_gfx_resourceprovider.s: u/t_gfx_resourceprovider.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_resourceprovider.s -S u/t_gfx_resourceprovider.cpp

u/t_gfx_rgbapixmap.lo: u/t_gfx_rgbapixmap.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_rgbapixmap.lo -c u/t_gfx_rgbapixmap.cpp

u/t_gfx_rgbapixmap.o: u/t_gfx_rgbapixmap.cpp
	@echo "        Compiling u/t_gfx_rgbapixmap.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_rgbapixmap.o -c u/t_gfx_rgbapixmap.cpp

u/t_gfx_rgbapixmap.s: u/t_gfx_rgbapixmap.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_rgbapixmap.s -S u/t_gfx_rgbapixmap.cpp

u/t_gfx_save.lo: u/t_gfx_save.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_save.lo -c u/t_gfx_save.cpp

u/t_gfx_save.o: u/t_gfx_save.cpp
	@echo "        Compiling u/t_gfx_save.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_save.o -c u/t_gfx_save.cpp

u/t_gfx_save.s: u/t_gfx_save.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_save.s -S u/t_gfx_save.cpp

u/t_gfx_scan.lo: u/t_gfx_scan.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_scan.lo -c u/t_gfx_scan.cpp

u/t_gfx_scan.o: u/t_gfx_scan.cpp
	@echo "        Compiling u/t_gfx_scan.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_scan.o -c u/t_gfx_scan.cpp

u/t_gfx_scan.s: u/t_gfx_scan.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_scan.s -S u/t_gfx_scan.cpp

u/t_gfx_sdl_engine.lo: u/t_gfx_sdl_engine.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_sdl_engine.lo -c u/t_gfx_sdl_engine.cpp

u/t_gfx_sdl_engine.o: u/t_gfx_sdl_engine.cpp
	@echo "        Compiling u/t_gfx_sdl_engine.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_sdl_engine.o -c u/t_gfx_sdl_engine.cpp

u/t_gfx_sdl_engine.s: u/t_gfx_sdl_engine.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_sdl_engine.s -S u/t_gfx_sdl_engine.cpp

u/t_gfx_sdl_streaminterface.lo: u/t_gfx_sdl_streaminterface.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_sdl_streaminterface.lo -c u/t_gfx_sdl_streaminterface.cpp

u/t_gfx_sdl_streaminterface.o: u/t_gfx_sdl_streaminterface.cpp
	@echo "        Compiling u/t_gfx_sdl_streaminterface.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_sdl_streaminterface.o -c u/t_gfx_sdl_streaminterface.cpp

u/t_gfx_sdl_streaminterface.s: u/t_gfx_sdl_streaminterface.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_sdl_streaminterface.s -S u/t_gfx_sdl_streaminterface.cpp

u/t_gfx_timer.lo: u/t_gfx_timer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_timer.lo -c u/t_gfx_timer.cpp

u/t_gfx_timer.o: u/t_gfx_timer.cpp
	@echo "        Compiling u/t_gfx_timer.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_timer.o -c u/t_gfx_timer.cpp

u/t_gfx_timer.s: u/t_gfx_timer.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_timer.s -S u/t_gfx_timer.cpp

u/t_gfx_timerqueue.lo: u/t_gfx_timerqueue.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_timerqueue.lo -c u/t_gfx_timerqueue.cpp

u/t_gfx_timerqueue.o: u/t_gfx_timerqueue.cpp
	@echo "        Compiling u/t_gfx_timerqueue.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_timerqueue.o -c u/t_gfx_timerqueue.cpp

u/t_gfx_timerqueue.s: u/t_gfx_timerqueue.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_timerqueue.s -S u/t_gfx_timerqueue.cpp

u/t_gfx_types.lo: u/t_gfx_types.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_types.lo -c u/t_gfx_types.cpp

u/t_gfx_types.o: u/t_gfx_types.cpp
	@echo "        Compiling u/t_gfx_types.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_types.o -c u/t_gfx_types.cpp

u/t_gfx_types.s: u/t_gfx_types.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_gfx_types.s -S u/t_gfx_types.cpp

u/t_interpreter.lo: u/t_interpreter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter.lo -c u/t_interpreter.cpp

u/t_interpreter.o: u/t_interpreter.cpp
	@echo "        Compiling u/t_interpreter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter.o -c u/t_interpreter.cpp

u/t_interpreter.s: u/t_interpreter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter.s -S u/t_interpreter.cpp

u/t_interpreter_arguments.lo: u/t_interpreter_arguments.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_arguments.lo -c u/t_interpreter_arguments.cpp

u/t_interpreter_arguments.o: u/t_interpreter_arguments.cpp
	@echo "        Compiling u/t_interpreter_arguments.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_arguments.o -c u/t_interpreter_arguments.cpp

u/t_interpreter_arguments.s: u/t_interpreter_arguments.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_arguments.s -S u/t_interpreter_arguments.cpp

u/t_interpreter_arraydata.lo: u/t_interpreter_arraydata.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_arraydata.lo -c u/t_interpreter_arraydata.cpp

u/t_interpreter_arraydata.o: u/t_interpreter_arraydata.cpp
	@echo "        Compiling u/t_interpreter_arraydata.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_arraydata.o -c u/t_interpreter_arraydata.cpp

u/t_interpreter_arraydata.s: u/t_interpreter_arraydata.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_arraydata.s -S u/t_interpreter_arraydata.cpp

u/t_interpreter_arrayvalue.lo: u/t_interpreter_arrayvalue.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_arrayvalue.lo -c u/t_interpreter_arrayvalue.cpp

u/t_interpreter_arrayvalue.o: u/t_interpreter_arrayvalue.cpp
	@echo "        Compiling u/t_interpreter_arrayvalue.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_arrayvalue.o -c u/t_interpreter_arrayvalue.cpp

u/t_interpreter_arrayvalue.s: u/t_interpreter_arrayvalue.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_arrayvalue.s -S u/t_interpreter_arrayvalue.cpp

u/t_interpreter_basevalue.lo: u/t_interpreter_basevalue.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_basevalue.lo -c u/t_interpreter_basevalue.cpp

u/t_interpreter_basevalue.o: u/t_interpreter_basevalue.cpp
	@echo "        Compiling u/t_interpreter_basevalue.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_basevalue.o -c u/t_interpreter_basevalue.cpp

u/t_interpreter_basevalue.s: u/t_interpreter_basevalue.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_basevalue.s -S u/t_interpreter_basevalue.cpp

u/t_interpreter_binaryoperation.lo: u/t_interpreter_binaryoperation.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_binaryoperation.lo -c u/t_interpreter_binaryoperation.cpp

u/t_interpreter_binaryoperation.o: u/t_interpreter_binaryoperation.cpp
	@echo "        Compiling u/t_interpreter_binaryoperation.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_binaryoperation.o -c u/t_interpreter_binaryoperation.cpp

u/t_interpreter_binaryoperation.s: u/t_interpreter_binaryoperation.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_binaryoperation.s -S u/t_interpreter_binaryoperation.cpp

u/t_interpreter_blobvalue.lo: u/t_interpreter_blobvalue.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_blobvalue.lo -c u/t_interpreter_blobvalue.cpp

u/t_interpreter_blobvalue.o: u/t_interpreter_blobvalue.cpp
	@echo "        Compiling u/t_interpreter_blobvalue.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_blobvalue.o -c u/t_interpreter_blobvalue.cpp

u/t_interpreter_blobvalue.s: u/t_interpreter_blobvalue.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_blobvalue.s -S u/t_interpreter_blobvalue.cpp

u/t_interpreter_bytecodeobject.lo: u/t_interpreter_bytecodeobject.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_bytecodeobject.lo -c u/t_interpreter_bytecodeobject.cpp

u/t_interpreter_bytecodeobject.o: u/t_interpreter_bytecodeobject.cpp
	@echo "        Compiling u/t_interpreter_bytecodeobject.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_bytecodeobject.o -c u/t_interpreter_bytecodeobject.cpp

u/t_interpreter_bytecodeobject.s: u/t_interpreter_bytecodeobject.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_bytecodeobject.s -S u/t_interpreter_bytecodeobject.cpp

u/t_interpreter_callablevalue.lo: u/t_interpreter_callablevalue.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_callablevalue.lo -c u/t_interpreter_callablevalue.cpp

u/t_interpreter_callablevalue.o: u/t_interpreter_callablevalue.cpp
	@echo "        Compiling u/t_interpreter_callablevalue.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_callablevalue.o -c u/t_interpreter_callablevalue.cpp

u/t_interpreter_callablevalue.s: u/t_interpreter_callablevalue.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_callablevalue.s -S u/t_interpreter_callablevalue.cpp

u/t_interpreter_closure.lo: u/t_interpreter_closure.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_closure.lo -c u/t_interpreter_closure.cpp

u/t_interpreter_closure.o: u/t_interpreter_closure.cpp
	@echo "        Compiling u/t_interpreter_closure.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_closure.o -c u/t_interpreter_closure.cpp

u/t_interpreter_closure.s: u/t_interpreter_closure.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_closure.s -S u/t_interpreter_closure.cpp

u/t_interpreter_commandsource.lo: u/t_interpreter_commandsource.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_commandsource.lo -c u/t_interpreter_commandsource.cpp

u/t_interpreter_commandsource.o: u/t_interpreter_commandsource.cpp
	@echo "        Compiling u/t_interpreter_commandsource.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_commandsource.o -c u/t_interpreter_commandsource.cpp

u/t_interpreter_commandsource.s: u/t_interpreter_commandsource.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_commandsource.s -S u/t_interpreter_commandsource.cpp

u/t_interpreter_compilationcontext.lo: \
    u/t_interpreter_compilationcontext.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_compilationcontext.lo -c u/t_interpreter_compilationcontext.cpp

u/t_interpreter_compilationcontext.o: u/t_interpreter_compilationcontext.cpp
	@echo "        Compiling u/t_interpreter_compilationcontext.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_compilationcontext.o -c u/t_interpreter_compilationcontext.cpp

u/t_interpreter_compilationcontext.s: u/t_interpreter_compilationcontext.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_compilationcontext.s -S u/t_interpreter_compilationcontext.cpp

u/t_interpreter_context.lo: u/t_interpreter_context.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_context.lo -c u/t_interpreter_context.cpp

u/t_interpreter_context.o: u/t_interpreter_context.cpp
	@echo "        Compiling u/t_interpreter_context.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_context.o -c u/t_interpreter_context.cpp

u/t_interpreter_context.s: u/t_interpreter_context.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_context.s -S u/t_interpreter_context.cpp

u/t_interpreter_contextprovider.lo: u/t_interpreter_contextprovider.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_contextprovider.lo -c u/t_interpreter_contextprovider.cpp

u/t_interpreter_contextprovider.o: u/t_interpreter_contextprovider.cpp
	@echo "        Compiling u/t_interpreter_contextprovider.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_contextprovider.o -c u/t_interpreter_contextprovider.cpp

u/t_interpreter_contextprovider.s: u/t_interpreter_contextprovider.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_contextprovider.s -S u/t_interpreter_contextprovider.cpp

u/t_interpreter_defaultstatementcompilationcontext.lo: \
    u/t_interpreter_defaultstatementcompilationcontext.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_defaultstatementcompilationcontext.lo -c u/t_interpreter_defaultstatementcompilationcontext.cpp

u/t_interpreter_defaultstatementcompilationcontext.o: \
    u/t_interpreter_defaultstatementcompilationcontext.cpp
	@echo "        Compiling u/t_interpreter_defaultstatementcompilationcontext.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_defaultstatementcompilationcontext.o -c u/t_interpreter_defaultstatementcompilationcontext.cpp

u/t_interpreter_defaultstatementcompilationcontext.s: \
    u/t_interpreter_defaultstatementcompilationcontext.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_defaultstatementcompilationcontext.s -S u/t_interpreter_defaultstatementcompilationcontext.cpp

u/t_interpreter_error.lo: u/t_interpreter_error.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_error.lo -c u/t_interpreter_error.cpp

u/t_interpreter_error.o: u/t_interpreter_error.cpp
	@echo "        Compiling u/t_interpreter_error.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_error.o -c u/t_interpreter_error.cpp

u/t_interpreter_error.s: u/t_interpreter_error.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_error.s -S u/t_interpreter_error.cpp

u/t_interpreter_exporter_configuration.lo: \
    u/t_interpreter_exporter_configuration.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_configuration.lo -c u/t_interpreter_exporter_configuration.cpp

u/t_interpreter_exporter_configuration.o: \
    u/t_interpreter_exporter_configuration.cpp
	@echo "        Compiling u/t_interpreter_exporter_configuration.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_configuration.o -c u/t_interpreter_exporter_configuration.cpp

u/t_interpreter_exporter_configuration.s: \
    u/t_interpreter_exporter_configuration.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_configuration.s -S u/t_interpreter_exporter_configuration.cpp

u/t_interpreter_exporter_dbfexporter.lo: \
    u/t_interpreter_exporter_dbfexporter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_dbfexporter.lo -c u/t_interpreter_exporter_dbfexporter.cpp

u/t_interpreter_exporter_dbfexporter.o: \
    u/t_interpreter_exporter_dbfexporter.cpp
	@echo "        Compiling u/t_interpreter_exporter_dbfexporter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_dbfexporter.o -c u/t_interpreter_exporter_dbfexporter.cpp

u/t_interpreter_exporter_dbfexporter.s: \
    u/t_interpreter_exporter_dbfexporter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_dbfexporter.s -S u/t_interpreter_exporter_dbfexporter.cpp

u/t_interpreter_exporter_exporter.lo: u/t_interpreter_exporter_exporter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_exporter.lo -c u/t_interpreter_exporter_exporter.cpp

u/t_interpreter_exporter_exporter.o: u/t_interpreter_exporter_exporter.cpp
	@echo "        Compiling u/t_interpreter_exporter_exporter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_exporter.o -c u/t_interpreter_exporter_exporter.cpp

u/t_interpreter_exporter_exporter.s: u/t_interpreter_exporter_exporter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_exporter.s -S u/t_interpreter_exporter_exporter.cpp

u/t_interpreter_exporter_fieldlist.lo: \
    u/t_interpreter_exporter_fieldlist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_fieldlist.lo -c u/t_interpreter_exporter_fieldlist.cpp

u/t_interpreter_exporter_fieldlist.o: u/t_interpreter_exporter_fieldlist.cpp
	@echo "        Compiling u/t_interpreter_exporter_fieldlist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_fieldlist.o -c u/t_interpreter_exporter_fieldlist.cpp

u/t_interpreter_exporter_fieldlist.s: u/t_interpreter_exporter_fieldlist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_fieldlist.s -S u/t_interpreter_exporter_fieldlist.cpp

u/t_interpreter_exporter_format.lo: u/t_interpreter_exporter_format.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_format.lo -c u/t_interpreter_exporter_format.cpp

u/t_interpreter_exporter_format.o: u/t_interpreter_exporter_format.cpp
	@echo "        Compiling u/t_interpreter_exporter_format.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_format.o -c u/t_interpreter_exporter_format.cpp

u/t_interpreter_exporter_format.s: u/t_interpreter_exporter_format.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_format.s -S u/t_interpreter_exporter_format.cpp

u/t_interpreter_exporter_htmlexporter.lo: \
    u/t_interpreter_exporter_htmlexporter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_htmlexporter.lo -c u/t_interpreter_exporter_htmlexporter.cpp

u/t_interpreter_exporter_htmlexporter.o: \
    u/t_interpreter_exporter_htmlexporter.cpp
	@echo "        Compiling u/t_interpreter_exporter_htmlexporter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_htmlexporter.o -c u/t_interpreter_exporter_htmlexporter.cpp

u/t_interpreter_exporter_htmlexporter.s: \
    u/t_interpreter_exporter_htmlexporter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_htmlexporter.s -S u/t_interpreter_exporter_htmlexporter.cpp

u/t_interpreter_exporter_jsonexporter.lo: \
    u/t_interpreter_exporter_jsonexporter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_jsonexporter.lo -c u/t_interpreter_exporter_jsonexporter.cpp

u/t_interpreter_exporter_jsonexporter.o: \
    u/t_interpreter_exporter_jsonexporter.cpp
	@echo "        Compiling u/t_interpreter_exporter_jsonexporter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_jsonexporter.o -c u/t_interpreter_exporter_jsonexporter.cpp

u/t_interpreter_exporter_jsonexporter.s: \
    u/t_interpreter_exporter_jsonexporter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_jsonexporter.s -S u/t_interpreter_exporter_jsonexporter.cpp

u/t_interpreter_exporter_separatedtextexporter.lo: \
    u/t_interpreter_exporter_separatedtextexporter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_separatedtextexporter.lo -c u/t_interpreter_exporter_separatedtextexporter.cpp

u/t_interpreter_exporter_separatedtextexporter.o: \
    u/t_interpreter_exporter_separatedtextexporter.cpp
	@echo "        Compiling u/t_interpreter_exporter_separatedtextexporter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_separatedtextexporter.o -c u/t_interpreter_exporter_separatedtextexporter.cpp

u/t_interpreter_exporter_separatedtextexporter.s: \
    u/t_interpreter_exporter_separatedtextexporter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_separatedtextexporter.s -S u/t_interpreter_exporter_separatedtextexporter.cpp

u/t_interpreter_exporter_textexporter.lo: \
    u/t_interpreter_exporter_textexporter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_textexporter.lo -c u/t_interpreter_exporter_textexporter.cpp

u/t_interpreter_exporter_textexporter.o: \
    u/t_interpreter_exporter_textexporter.cpp
	@echo "        Compiling u/t_interpreter_exporter_textexporter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_textexporter.o -c u/t_interpreter_exporter_textexporter.cpp

u/t_interpreter_exporter_textexporter.s: \
    u/t_interpreter_exporter_textexporter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_exporter_textexporter.s -S u/t_interpreter_exporter_textexporter.cpp

u/t_interpreter_expr_builtinfunction.lo: \
    u/t_interpreter_expr_builtinfunction.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_expr_builtinfunction.lo -c u/t_interpreter_expr_builtinfunction.cpp

u/t_interpreter_expr_builtinfunction.o: \
    u/t_interpreter_expr_builtinfunction.cpp
	@echo "        Compiling u/t_interpreter_expr_builtinfunction.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_expr_builtinfunction.o -c u/t_interpreter_expr_builtinfunction.cpp

u/t_interpreter_expr_builtinfunction.s: \
    u/t_interpreter_expr_builtinfunction.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_expr_builtinfunction.s -S u/t_interpreter_expr_builtinfunction.cpp

u/t_interpreter_expr_parser.lo: u/t_interpreter_expr_parser.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_expr_parser.lo -c u/t_interpreter_expr_parser.cpp

u/t_interpreter_expr_parser.o: u/t_interpreter_expr_parser.cpp
	@echo "        Compiling u/t_interpreter_expr_parser.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_expr_parser.o -c u/t_interpreter_expr_parser.cpp

u/t_interpreter_expr_parser.s: u/t_interpreter_expr_parser.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_expr_parser.s -S u/t_interpreter_expr_parser.cpp

u/t_interpreter_filecommandsource.lo: u/t_interpreter_filecommandsource.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_filecommandsource.lo -c u/t_interpreter_filecommandsource.cpp

u/t_interpreter_filecommandsource.o: u/t_interpreter_filecommandsource.cpp
	@echo "        Compiling u/t_interpreter_filecommandsource.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_filecommandsource.o -c u/t_interpreter_filecommandsource.cpp

u/t_interpreter_filecommandsource.s: u/t_interpreter_filecommandsource.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_filecommandsource.s -S u/t_interpreter_filecommandsource.cpp

u/t_interpreter_filefunctions.lo: u/t_interpreter_filefunctions.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_filefunctions.lo -c u/t_interpreter_filefunctions.cpp

u/t_interpreter_filefunctions.o: u/t_interpreter_filefunctions.cpp
	@echo "        Compiling u/t_interpreter_filefunctions.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_filefunctions.o -c u/t_interpreter_filefunctions.cpp

u/t_interpreter_filefunctions.s: u/t_interpreter_filefunctions.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_filefunctions.s -S u/t_interpreter_filefunctions.cpp

u/t_interpreter_filetable.lo: u/t_interpreter_filetable.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_filetable.lo -c u/t_interpreter_filetable.cpp

u/t_interpreter_filetable.o: u/t_interpreter_filetable.cpp
	@echo "        Compiling u/t_interpreter_filetable.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_filetable.o -c u/t_interpreter_filetable.cpp

u/t_interpreter_filetable.s: u/t_interpreter_filetable.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_filetable.s -S u/t_interpreter_filetable.cpp

u/t_interpreter_filevalue.lo: u/t_interpreter_filevalue.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_filevalue.lo -c u/t_interpreter_filevalue.cpp

u/t_interpreter_filevalue.o: u/t_interpreter_filevalue.cpp
	@echo "        Compiling u/t_interpreter_filevalue.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_filevalue.o -c u/t_interpreter_filevalue.cpp

u/t_interpreter_filevalue.s: u/t_interpreter_filevalue.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_filevalue.s -S u/t_interpreter_filevalue.cpp

u/t_interpreter_fusion.lo: u/t_interpreter_fusion.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_fusion.lo -c u/t_interpreter_fusion.cpp

u/t_interpreter_fusion.o: u/t_interpreter_fusion.cpp
	@echo "        Compiling u/t_interpreter_fusion.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_fusion.o -c u/t_interpreter_fusion.cpp

u/t_interpreter_fusion.s: u/t_interpreter_fusion.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_fusion.s -S u/t_interpreter_fusion.cpp

u/t_interpreter_hashvalue.lo: u/t_interpreter_hashvalue.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_hashvalue.lo -c u/t_interpreter_hashvalue.cpp

u/t_interpreter_hashvalue.o: u/t_interpreter_hashvalue.cpp
	@echo "        Compiling u/t_interpreter_hashvalue.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_hashvalue.o -c u/t_interpreter_hashvalue.cpp

u/t_interpreter_hashvalue.s: u/t_interpreter_hashvalue.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_hashvalue.s -S u/t_interpreter_hashvalue.cpp

u/t_interpreter_keymapvalue.lo: u/t_interpreter_keymapvalue.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_keymapvalue.lo -c u/t_interpreter_keymapvalue.cpp

u/t_interpreter_keymapvalue.o: u/t_interpreter_keymapvalue.cpp
	@echo "        Compiling u/t_interpreter_keymapvalue.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_keymapvalue.o -c u/t_interpreter_keymapvalue.cpp

u/t_interpreter_keymapvalue.s: u/t_interpreter_keymapvalue.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_keymapvalue.s -S u/t_interpreter_keymapvalue.cpp

u/t_interpreter_keywords.lo: u/t_interpreter_keywords.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_keywords.lo -c u/t_interpreter_keywords.cpp

u/t_interpreter_keywords.o: u/t_interpreter_keywords.cpp
	@echo "        Compiling u/t_interpreter_keywords.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_keywords.o -c u/t_interpreter_keywords.cpp

u/t_interpreter_keywords.s: u/t_interpreter_keywords.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_keywords.s -S u/t_interpreter_keywords.cpp

u/t_interpreter_memorycommandsource.lo: \
    u/t_interpreter_memorycommandsource.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_memorycommandsource.lo -c u/t_interpreter_memorycommandsource.cpp

u/t_interpreter_memorycommandsource.o: \
    u/t_interpreter_memorycommandsource.cpp
	@echo "        Compiling u/t_interpreter_memorycommandsource.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_memorycommandsource.o -c u/t_interpreter_memorycommandsource.cpp

u/t_interpreter_memorycommandsource.s: \
    u/t_interpreter_memorycommandsource.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_memorycommandsource.s -S u/t_interpreter_memorycommandsource.cpp

u/t_interpreter_mutexlist.lo: u/t_interpreter_mutexlist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_mutexlist.lo -c u/t_interpreter_mutexlist.cpp

u/t_interpreter_mutexlist.o: u/t_interpreter_mutexlist.cpp
	@echo "        Compiling u/t_interpreter_mutexlist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_mutexlist.o -c u/t_interpreter_mutexlist.cpp

u/t_interpreter_mutexlist.s: u/t_interpreter_mutexlist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_mutexlist.s -S u/t_interpreter_mutexlist.cpp

u/t_interpreter_nametable.lo: u/t_interpreter_nametable.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_nametable.lo -c u/t_interpreter_nametable.cpp

u/t_interpreter_nametable.o: u/t_interpreter_nametable.cpp
	@echo "        Compiling u/t_interpreter_nametable.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_nametable.o -c u/t_interpreter_nametable.cpp

u/t_interpreter_nametable.s: u/t_interpreter_nametable.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_nametable.s -S u/t_interpreter_nametable.cpp

u/t_interpreter_objectpropertyvector.lo: \
    u/t_interpreter_objectpropertyvector.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_objectpropertyvector.lo -c u/t_interpreter_objectpropertyvector.cpp

u/t_interpreter_objectpropertyvector.o: \
    u/t_interpreter_objectpropertyvector.cpp
	@echo "        Compiling u/t_interpreter_objectpropertyvector.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_objectpropertyvector.o -c u/t_interpreter_objectpropertyvector.cpp

u/t_interpreter_objectpropertyvector.s: \
    u/t_interpreter_objectpropertyvector.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_objectpropertyvector.s -S u/t_interpreter_objectpropertyvector.cpp

u/t_interpreter_opcode.lo: u/t_interpreter_opcode.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_opcode.lo -c u/t_interpreter_opcode.cpp

u/t_interpreter_opcode.o: u/t_interpreter_opcode.cpp
	@echo "        Compiling u/t_interpreter_opcode.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_opcode.o -c u/t_interpreter_opcode.cpp

u/t_interpreter_opcode.s: u/t_interpreter_opcode.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_opcode.s -S u/t_interpreter_opcode.cpp

u/t_interpreter_optimizer.lo: u/t_interpreter_optimizer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_optimizer.lo -c u/t_interpreter_optimizer.cpp

u/t_interpreter_optimizer.o: u/t_interpreter_optimizer.cpp
	@echo "        Compiling u/t_interpreter_optimizer.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_optimizer.o -c u/t_interpreter_optimizer.cpp

u/t_interpreter_optimizer.s: u/t_interpreter_optimizer.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_optimizer.s -S u/t_interpreter_optimizer.cpp

u/t_interpreter_procedurevalue.lo: u/t_interpreter_procedurevalue.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_procedurevalue.lo -c u/t_interpreter_procedurevalue.cpp

u/t_interpreter_procedurevalue.o: u/t_interpreter_procedurevalue.cpp
	@echo "        Compiling u/t_interpreter_procedurevalue.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_procedurevalue.o -c u/t_interpreter_procedurevalue.cpp

u/t_interpreter_procedurevalue.s: u/t_interpreter_procedurevalue.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_procedurevalue.s -S u/t_interpreter_procedurevalue.cpp

u/t_interpreter_process.lo: u/t_interpreter_process.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_process.lo -c u/t_interpreter_process.cpp

u/t_interpreter_process.o: u/t_interpreter_process.cpp
	@echo "        Compiling u/t_interpreter_process.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_process.o -c u/t_interpreter_process.cpp

u/t_interpreter_process.s: u/t_interpreter_process.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_process.s -S u/t_interpreter_process.cpp

u/t_interpreter_processlist.lo: u/t_interpreter_processlist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_processlist.lo -c u/t_interpreter_processlist.cpp

u/t_interpreter_processlist.o: u/t_interpreter_processlist.cpp
	@echo "        Compiling u/t_interpreter_processlist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_processlist.o -c u/t_interpreter_processlist.cpp

u/t_interpreter_processlist.s: u/t_interpreter_processlist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_processlist.s -S u/t_interpreter_processlist.cpp

u/t_interpreter_propertyacceptor.lo: u/t_interpreter_propertyacceptor.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_propertyacceptor.lo -c u/t_interpreter_propertyacceptor.cpp

u/t_interpreter_propertyacceptor.o: u/t_interpreter_propertyacceptor.cpp
	@echo "        Compiling u/t_interpreter_propertyacceptor.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_propertyacceptor.o -c u/t_interpreter_propertyacceptor.cpp

u/t_interpreter_propertyacceptor.s: u/t_interpreter_propertyacceptor.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_propertyacceptor.s -S u/t_interpreter_propertyacceptor.cpp

u/t_interpreter_savecontext.lo: u/t_interpreter_savecontext.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_savecontext.lo -c u/t_interpreter_savecontext.cpp

u/t_interpreter_savecontext.o: u/t_interpreter_savecontext.cpp
	@echo "        Compiling u/t_interpreter_savecontext.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_savecontext.o -c u/t_interpreter_savecontext.cpp

u/t_interpreter_savecontext.s: u/t_interpreter_savecontext.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_savecontext.s -S u/t_interpreter_savecontext.cpp

u/t_interpreter_selectionexpression.lo: \
    u/t_interpreter_selectionexpression.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_selectionexpression.lo -c u/t_interpreter_selectionexpression.cpp

u/t_interpreter_selectionexpression.o: \
    u/t_interpreter_selectionexpression.cpp
	@echo "        Compiling u/t_interpreter_selectionexpression.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_selectionexpression.o -c u/t_interpreter_selectionexpression.cpp

u/t_interpreter_selectionexpression.s: \
    u/t_interpreter_selectionexpression.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_selectionexpression.s -S u/t_interpreter_selectionexpression.cpp

u/t_interpreter_simplespecialcommand.lo: \
    u/t_interpreter_simplespecialcommand.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_simplespecialcommand.lo -c u/t_interpreter_simplespecialcommand.cpp

u/t_interpreter_simplespecialcommand.o: \
    u/t_interpreter_simplespecialcommand.cpp
	@echo "        Compiling u/t_interpreter_simplespecialcommand.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_simplespecialcommand.o -c u/t_interpreter_simplespecialcommand.cpp

u/t_interpreter_simplespecialcommand.s: \
    u/t_interpreter_simplespecialcommand.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_simplespecialcommand.s -S u/t_interpreter_simplespecialcommand.cpp

u/t_interpreter_specialcommand.lo: u/t_interpreter_specialcommand.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_specialcommand.lo -c u/t_interpreter_specialcommand.cpp

u/t_interpreter_specialcommand.o: u/t_interpreter_specialcommand.cpp
	@echo "        Compiling u/t_interpreter_specialcommand.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_specialcommand.o -c u/t_interpreter_specialcommand.cpp

u/t_interpreter_specialcommand.s: u/t_interpreter_specialcommand.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_specialcommand.s -S u/t_interpreter_specialcommand.cpp

u/t_interpreter_statementcompiler.lo: u/t_interpreter_statementcompiler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_statementcompiler.lo -c u/t_interpreter_statementcompiler.cpp

u/t_interpreter_statementcompiler.o: u/t_interpreter_statementcompiler.cpp
	@echo "        Compiling u/t_interpreter_statementcompiler.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_statementcompiler.o -c u/t_interpreter_statementcompiler.cpp

u/t_interpreter_statementcompiler.s: u/t_interpreter_statementcompiler.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_statementcompiler.s -S u/t_interpreter_statementcompiler.cpp

u/t_interpreter_structuretype.lo: u/t_interpreter_structuretype.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_structuretype.lo -c u/t_interpreter_structuretype.cpp

u/t_interpreter_structuretype.o: u/t_interpreter_structuretype.cpp
	@echo "        Compiling u/t_interpreter_structuretype.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_structuretype.o -c u/t_interpreter_structuretype.cpp

u/t_interpreter_structuretype.s: u/t_interpreter_structuretype.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_structuretype.s -S u/t_interpreter_structuretype.cpp

u/t_interpreter_structuretypedata.lo: u/t_interpreter_structuretypedata.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_structuretypedata.lo -c u/t_interpreter_structuretypedata.cpp

u/t_interpreter_structuretypedata.o: u/t_interpreter_structuretypedata.cpp
	@echo "        Compiling u/t_interpreter_structuretypedata.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_structuretypedata.o -c u/t_interpreter_structuretypedata.cpp

u/t_interpreter_structuretypedata.s: u/t_interpreter_structuretypedata.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_structuretypedata.s -S u/t_interpreter_structuretypedata.cpp

u/t_interpreter_structurevalue.lo: u/t_interpreter_structurevalue.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_structurevalue.lo -c u/t_interpreter_structurevalue.cpp

u/t_interpreter_structurevalue.o: u/t_interpreter_structurevalue.cpp
	@echo "        Compiling u/t_interpreter_structurevalue.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_structurevalue.o -c u/t_interpreter_structurevalue.cpp

u/t_interpreter_structurevalue.s: u/t_interpreter_structurevalue.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_structurevalue.s -S u/t_interpreter_structurevalue.cpp

u/t_interpreter_structurevaluedata.lo: \
    u/t_interpreter_structurevaluedata.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_structurevaluedata.lo -c u/t_interpreter_structurevaluedata.cpp

u/t_interpreter_structurevaluedata.o: u/t_interpreter_structurevaluedata.cpp
	@echo "        Compiling u/t_interpreter_structurevaluedata.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_structurevaluedata.o -c u/t_interpreter_structurevaluedata.cpp

u/t_interpreter_structurevaluedata.s: u/t_interpreter_structurevaluedata.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_structurevaluedata.s -S u/t_interpreter_structurevaluedata.cpp

u/t_interpreter_tagnode.lo: u/t_interpreter_tagnode.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_tagnode.lo -c u/t_interpreter_tagnode.cpp

u/t_interpreter_tagnode.o: u/t_interpreter_tagnode.cpp
	@echo "        Compiling u/t_interpreter_tagnode.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_tagnode.o -c u/t_interpreter_tagnode.cpp

u/t_interpreter_tagnode.s: u/t_interpreter_tagnode.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_tagnode.s -S u/t_interpreter_tagnode.cpp

u/t_interpreter_ternaryoperation.lo: u/t_interpreter_ternaryoperation.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_ternaryoperation.lo -c u/t_interpreter_ternaryoperation.cpp

u/t_interpreter_ternaryoperation.o: u/t_interpreter_ternaryoperation.cpp
	@echo "        Compiling u/t_interpreter_ternaryoperation.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_ternaryoperation.o -c u/t_interpreter_ternaryoperation.cpp

u/t_interpreter_ternaryoperation.s: u/t_interpreter_ternaryoperation.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_ternaryoperation.s -S u/t_interpreter_ternaryoperation.cpp

u/t_interpreter_tokenizer.lo: u/t_interpreter_tokenizer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_tokenizer.lo -c u/t_interpreter_tokenizer.cpp

u/t_interpreter_tokenizer.o: u/t_interpreter_tokenizer.cpp
	@echo "        Compiling u/t_interpreter_tokenizer.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_tokenizer.o -c u/t_interpreter_tokenizer.cpp

u/t_interpreter_tokenizer.s: u/t_interpreter_tokenizer.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_tokenizer.s -S u/t_interpreter_tokenizer.cpp

u/t_interpreter_typehint.lo: u/t_interpreter_typehint.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_typehint.lo -c u/t_interpreter_typehint.cpp

u/t_interpreter_typehint.o: u/t_interpreter_typehint.cpp
	@echo "        Compiling u/t_interpreter_typehint.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_typehint.o -c u/t_interpreter_typehint.cpp

u/t_interpreter_typehint.s: u/t_interpreter_typehint.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_typehint.s -S u/t_interpreter_typehint.cpp

u/t_interpreter_unaryoperation.lo: u/t_interpreter_unaryoperation.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_unaryoperation.lo -c u/t_interpreter_unaryoperation.cpp

u/t_interpreter_unaryoperation.o: u/t_interpreter_unaryoperation.cpp
	@echo "        Compiling u/t_interpreter_unaryoperation.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_unaryoperation.o -c u/t_interpreter_unaryoperation.cpp

u/t_interpreter_unaryoperation.s: u/t_interpreter_unaryoperation.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_unaryoperation.s -S u/t_interpreter_unaryoperation.cpp

u/t_interpreter_values.lo: u/t_interpreter_values.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_values.lo -c u/t_interpreter_values.cpp

u/t_interpreter_values.o: u/t_interpreter_values.cpp
	@echo "        Compiling u/t_interpreter_values.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_values.o -c u/t_interpreter_values.cpp

u/t_interpreter_values.s: u/t_interpreter_values.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_values.s -S u/t_interpreter_values.cpp

u/t_interpreter_vmio_filesavecontext.lo: \
    u/t_interpreter_vmio_filesavecontext.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_filesavecontext.lo -c u/t_interpreter_vmio_filesavecontext.cpp

u/t_interpreter_vmio_filesavecontext.o: \
    u/t_interpreter_vmio_filesavecontext.cpp
	@echo "        Compiling u/t_interpreter_vmio_filesavecontext.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_filesavecontext.o -c u/t_interpreter_vmio_filesavecontext.cpp

u/t_interpreter_vmio_filesavecontext.s: \
    u/t_interpreter_vmio_filesavecontext.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_filesavecontext.s -S u/t_interpreter_vmio_filesavecontext.cpp

u/t_interpreter_vmio_loadcontext.lo: u/t_interpreter_vmio_loadcontext.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_loadcontext.lo -c u/t_interpreter_vmio_loadcontext.cpp

u/t_interpreter_vmio_loadcontext.o: u/t_interpreter_vmio_loadcontext.cpp
	@echo "        Compiling u/t_interpreter_vmio_loadcontext.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_loadcontext.o -c u/t_interpreter_vmio_loadcontext.cpp

u/t_interpreter_vmio_loadcontext.s: u/t_interpreter_vmio_loadcontext.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_loadcontext.s -S u/t_interpreter_vmio_loadcontext.cpp

u/t_interpreter_vmio_nullloadcontext.lo: \
    u/t_interpreter_vmio_nullloadcontext.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_nullloadcontext.lo -c u/t_interpreter_vmio_nullloadcontext.cpp

u/t_interpreter_vmio_nullloadcontext.o: \
    u/t_interpreter_vmio_nullloadcontext.cpp
	@echo "        Compiling u/t_interpreter_vmio_nullloadcontext.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_nullloadcontext.o -c u/t_interpreter_vmio_nullloadcontext.cpp

u/t_interpreter_vmio_nullloadcontext.s: \
    u/t_interpreter_vmio_nullloadcontext.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_nullloadcontext.s -S u/t_interpreter_vmio_nullloadcontext.cpp

u/t_interpreter_vmio_nullsavecontext.lo: \
    u/t_interpreter_vmio_nullsavecontext.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_nullsavecontext.lo -c u/t_interpreter_vmio_nullsavecontext.cpp

u/t_interpreter_vmio_nullsavecontext.o: \
    u/t_interpreter_vmio_nullsavecontext.cpp
	@echo "        Compiling u/t_interpreter_vmio_nullsavecontext.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_nullsavecontext.o -c u/t_interpreter_vmio_nullsavecontext.cpp

u/t_interpreter_vmio_nullsavecontext.s: \
    u/t_interpreter_vmio_nullsavecontext.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_nullsavecontext.s -S u/t_interpreter_vmio_nullsavecontext.cpp

u/t_interpreter_vmio_objectloader.lo: u/t_interpreter_vmio_objectloader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_objectloader.lo -c u/t_interpreter_vmio_objectloader.cpp

u/t_interpreter_vmio_objectloader.o: u/t_interpreter_vmio_objectloader.cpp
	@echo "        Compiling u/t_interpreter_vmio_objectloader.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_objectloader.o -c u/t_interpreter_vmio_objectloader.cpp

u/t_interpreter_vmio_objectloader.s: u/t_interpreter_vmio_objectloader.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_objectloader.s -S u/t_interpreter_vmio_objectloader.cpp

u/t_interpreter_vmio_processloadcontext.lo: \
    u/t_interpreter_vmio_processloadcontext.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_processloadcontext.lo -c u/t_interpreter_vmio_processloadcontext.cpp

u/t_interpreter_vmio_processloadcontext.o: \
    u/t_interpreter_vmio_processloadcontext.cpp
	@echo "        Compiling u/t_interpreter_vmio_processloadcontext.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_processloadcontext.o -c u/t_interpreter_vmio_processloadcontext.cpp

u/t_interpreter_vmio_processloadcontext.s: \
    u/t_interpreter_vmio_processloadcontext.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_processloadcontext.s -S u/t_interpreter_vmio_processloadcontext.cpp

u/t_interpreter_vmio_processsavecontext.lo: \
    u/t_interpreter_vmio_processsavecontext.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_processsavecontext.lo -c u/t_interpreter_vmio_processsavecontext.cpp

u/t_interpreter_vmio_processsavecontext.o: \
    u/t_interpreter_vmio_processsavecontext.cpp
	@echo "        Compiling u/t_interpreter_vmio_processsavecontext.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_processsavecontext.o -c u/t_interpreter_vmio_processsavecontext.cpp

u/t_interpreter_vmio_processsavecontext.s: \
    u/t_interpreter_vmio_processsavecontext.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_processsavecontext.s -S u/t_interpreter_vmio_processsavecontext.cpp

u/t_interpreter_vmio_structures.lo: u/t_interpreter_vmio_structures.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_structures.lo -c u/t_interpreter_vmio_structures.cpp

u/t_interpreter_vmio_structures.o: u/t_interpreter_vmio_structures.cpp
	@echo "        Compiling u/t_interpreter_vmio_structures.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_structures.o -c u/t_interpreter_vmio_structures.cpp

u/t_interpreter_vmio_structures.s: u/t_interpreter_vmio_structures.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_structures.s -S u/t_interpreter_vmio_structures.cpp

u/t_interpreter_vmio_valueloader.lo: u/t_interpreter_vmio_valueloader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_valueloader.lo -c u/t_interpreter_vmio_valueloader.cpp

u/t_interpreter_vmio_valueloader.o: u/t_interpreter_vmio_valueloader.cpp
	@echo "        Compiling u/t_interpreter_vmio_valueloader.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_valueloader.o -c u/t_interpreter_vmio_valueloader.cpp

u/t_interpreter_vmio_valueloader.s: u/t_interpreter_vmio_valueloader.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_vmio_valueloader.s -S u/t_interpreter_vmio_valueloader.cpp

u/t_interpreter_world.lo: u/t_interpreter_world.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_world.lo -c u/t_interpreter_world.cpp

u/t_interpreter_world.o: u/t_interpreter_world.cpp
	@echo "        Compiling u/t_interpreter_world.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_world.o -c u/t_interpreter_world.cpp

u/t_interpreter_world.s: u/t_interpreter_world.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_interpreter_world.s -S u/t_interpreter_world.cpp

u/t_server_application.lo: u/t_server_application.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_application.lo -c u/t_server_application.cpp

u/t_server_application.o: u/t_server_application.cpp
	@echo "        Compiling u/t_server_application.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_application.o -c u/t_server_application.cpp

u/t_server_application.s: u/t_server_application.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_application.s -S u/t_server_application.cpp

u/t_server_common_racenames.lo: u/t_server_common_racenames.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_common_racenames.lo -c u/t_server_common_racenames.cpp

u/t_server_common_racenames.o: u/t_server_common_racenames.cpp
	@echo "        Compiling u/t_server_common_racenames.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_common_racenames.o -c u/t_server_common_racenames.cpp

u/t_server_common_racenames.s: u/t_server_common_racenames.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_common_racenames.s -S u/t_server_common_racenames.cpp

u/t_server_common_root.lo: u/t_server_common_root.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_common_root.lo -c u/t_server_common_root.cpp

u/t_server_common_root.o: u/t_server_common_root.cpp
	@echo "        Compiling u/t_server_common_root.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_common_root.o -c u/t_server_common_root.cpp

u/t_server_common_root.s: u/t_server_common_root.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_common_root.s -S u/t_server_common_root.cpp

u/t_server_common_session.lo: u/t_server_common_session.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_common_session.lo -c u/t_server_common_session.cpp

u/t_server_common_session.o: u/t_server_common_session.cpp
	@echo "        Compiling u/t_server_common_session.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_common_session.o -c u/t_server_common_session.cpp

u/t_server_common_session.s: u/t_server_common_session.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_common_session.s -S u/t_server_common_session.cpp

u/t_server_common_sessionprotocolhandler.lo: \
    u/t_server_common_sessionprotocolhandler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_common_sessionprotocolhandler.lo -c u/t_server_common_sessionprotocolhandler.cpp

u/t_server_common_sessionprotocolhandler.o: \
    u/t_server_common_sessionprotocolhandler.cpp
	@echo "        Compiling u/t_server_common_sessionprotocolhandler.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_common_sessionprotocolhandler.o -c u/t_server_common_sessionprotocolhandler.cpp

u/t_server_common_sessionprotocolhandler.s: \
    u/t_server_common_sessionprotocolhandler.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_common_sessionprotocolhandler.s -S u/t_server_common_sessionprotocolhandler.cpp

u/t_server_common_sessionprotocolhandlerfactory.lo: \
    u/t_server_common_sessionprotocolhandlerfactory.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_common_sessionprotocolhandlerfactory.lo -c u/t_server_common_sessionprotocolhandlerfactory.cpp

u/t_server_common_sessionprotocolhandlerfactory.o: \
    u/t_server_common_sessionprotocolhandlerfactory.cpp
	@echo "        Compiling u/t_server_common_sessionprotocolhandlerfactory.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_common_sessionprotocolhandlerfactory.o -c u/t_server_common_sessionprotocolhandlerfactory.cpp

u/t_server_common_sessionprotocolhandlerfactory.s: \
    u/t_server_common_sessionprotocolhandlerfactory.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_common_sessionprotocolhandlerfactory.s -S u/t_server_common_sessionprotocolhandlerfactory.cpp

u/t_server_common_user.lo: u/t_server_common_user.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_common_user.lo -c u/t_server_common_user.cpp

u/t_server_common_user.o: u/t_server_common_user.cpp
	@echo "        Compiling u/t_server_common_user.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_common_user.o -c u/t_server_common_user.cpp

u/t_server_common_user.s: u/t_server_common_user.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_common_user.s -S u/t_server_common_user.cpp

u/t_server_configurationhandler.lo: u/t_server_configurationhandler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_configurationhandler.lo -c u/t_server_configurationhandler.cpp

u/t_server_configurationhandler.o: u/t_server_configurationhandler.cpp
	@echo "        Compiling u/t_server_configurationhandler.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_configurationhandler.o -c u/t_server_configurationhandler.cpp

u/t_server_configurationhandler.s: u/t_server_configurationhandler.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_configurationhandler.s -S u/t_server_configurationhandler.cpp

u/t_server_console_colorterminal.lo: u/t_server_console_colorterminal.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_colorterminal.lo -c u/t_server_console_colorterminal.cpp

u/t_server_console_colorterminal.o: u/t_server_console_colorterminal.cpp
	@echo "        Compiling u/t_server_console_colorterminal.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_colorterminal.o -c u/t_server_console_colorterminal.cpp

u/t_server_console_colorterminal.s: u/t_server_console_colorterminal.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_colorterminal.s -S u/t_server_console_colorterminal.cpp

u/t_server_console_commandhandler.lo: u/t_server_console_commandhandler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_commandhandler.lo -c u/t_server_console_commandhandler.cpp

u/t_server_console_commandhandler.o: u/t_server_console_commandhandler.cpp
	@echo "        Compiling u/t_server_console_commandhandler.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_commandhandler.o -c u/t_server_console_commandhandler.cpp

u/t_server_console_commandhandler.s: u/t_server_console_commandhandler.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_commandhandler.s -S u/t_server_console_commandhandler.cpp

u/t_server_console_context.lo: u/t_server_console_context.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_context.lo -c u/t_server_console_context.cpp

u/t_server_console_context.o: u/t_server_console_context.cpp
	@echo "        Compiling u/t_server_console_context.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_context.o -c u/t_server_console_context.cpp

u/t_server_console_context.s: u/t_server_console_context.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_context.s -S u/t_server_console_context.cpp

u/t_server_console_contextfactory.lo: u/t_server_console_contextfactory.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_contextfactory.lo -c u/t_server_console_contextfactory.cpp

u/t_server_console_contextfactory.o: u/t_server_console_contextfactory.cpp
	@echo "        Compiling u/t_server_console_contextfactory.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_contextfactory.o -c u/t_server_console_contextfactory.cpp

u/t_server_console_contextfactory.s: u/t_server_console_contextfactory.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_contextfactory.s -S u/t_server_console_contextfactory.cpp

u/t_server_console_dumbterminal.lo: u/t_server_console_dumbterminal.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_dumbterminal.lo -c u/t_server_console_dumbterminal.cpp

u/t_server_console_dumbterminal.o: u/t_server_console_dumbterminal.cpp
	@echo "        Compiling u/t_server_console_dumbterminal.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_dumbterminal.o -c u/t_server_console_dumbterminal.cpp

u/t_server_console_dumbterminal.s: u/t_server_console_dumbterminal.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_dumbterminal.s -S u/t_server_console_dumbterminal.cpp

u/t_server_console_environment.lo: u/t_server_console_environment.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_environment.lo -c u/t_server_console_environment.cpp

u/t_server_console_environment.o: u/t_server_console_environment.cpp
	@echo "        Compiling u/t_server_console_environment.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_environment.o -c u/t_server_console_environment.cpp

u/t_server_console_environment.s: u/t_server_console_environment.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_environment.s -S u/t_server_console_environment.cpp

u/t_server_console_fundamentalcommandhandler.lo: \
    u/t_server_console_fundamentalcommandhandler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_fundamentalcommandhandler.lo -c u/t_server_console_fundamentalcommandhandler.cpp

u/t_server_console_fundamentalcommandhandler.o: \
    u/t_server_console_fundamentalcommandhandler.cpp
	@echo "        Compiling u/t_server_console_fundamentalcommandhandler.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_fundamentalcommandhandler.o -c u/t_server_console_fundamentalcommandhandler.cpp

u/t_server_console_fundamentalcommandhandler.s: \
    u/t_server_console_fundamentalcommandhandler.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_fundamentalcommandhandler.s -S u/t_server_console_fundamentalcommandhandler.cpp

u/t_server_console_integercommandhandler.lo: \
    u/t_server_console_integercommandhandler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_integercommandhandler.lo -c u/t_server_console_integercommandhandler.cpp

u/t_server_console_integercommandhandler.o: \
    u/t_server_console_integercommandhandler.cpp
	@echo "        Compiling u/t_server_console_integercommandhandler.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_integercommandhandler.o -c u/t_server_console_integercommandhandler.cpp

u/t_server_console_integercommandhandler.s: \
    u/t_server_console_integercommandhandler.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_integercommandhandler.s -S u/t_server_console_integercommandhandler.cpp

u/t_server_console_nullterminal.lo: u/t_server_console_nullterminal.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_nullterminal.lo -c u/t_server_console_nullterminal.cpp

u/t_server_console_nullterminal.o: u/t_server_console_nullterminal.cpp
	@echo "        Compiling u/t_server_console_nullterminal.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_nullterminal.o -c u/t_server_console_nullterminal.cpp

u/t_server_console_nullterminal.s: u/t_server_console_nullterminal.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_nullterminal.s -S u/t_server_console_nullterminal.cpp

u/t_server_console_parser.lo: u/t_server_console_parser.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_parser.lo -c u/t_server_console_parser.cpp

u/t_server_console_parser.o: u/t_server_console_parser.cpp
	@echo "        Compiling u/t_server_console_parser.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_parser.o -c u/t_server_console_parser.cpp

u/t_server_console_parser.s: u/t_server_console_parser.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_parser.s -S u/t_server_console_parser.cpp

u/t_server_console_pipeterminal.lo: u/t_server_console_pipeterminal.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_pipeterminal.lo -c u/t_server_console_pipeterminal.cpp

u/t_server_console_pipeterminal.o: u/t_server_console_pipeterminal.cpp
	@echo "        Compiling u/t_server_console_pipeterminal.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_pipeterminal.o -c u/t_server_console_pipeterminal.cpp

u/t_server_console_pipeterminal.s: u/t_server_console_pipeterminal.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_pipeterminal.s -S u/t_server_console_pipeterminal.cpp

u/t_server_console_routercontextfactory.lo: \
    u/t_server_console_routercontextfactory.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_routercontextfactory.lo -c u/t_server_console_routercontextfactory.cpp

u/t_server_console_routercontextfactory.o: \
    u/t_server_console_routercontextfactory.cpp
	@echo "        Compiling u/t_server_console_routercontextfactory.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_routercontextfactory.o -c u/t_server_console_routercontextfactory.cpp

u/t_server_console_routercontextfactory.s: \
    u/t_server_console_routercontextfactory.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_routercontextfactory.s -S u/t_server_console_routercontextfactory.cpp

u/t_server_console_stringcommandhandler.lo: \
    u/t_server_console_stringcommandhandler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_stringcommandhandler.lo -c u/t_server_console_stringcommandhandler.cpp

u/t_server_console_stringcommandhandler.o: \
    u/t_server_console_stringcommandhandler.cpp
	@echo "        Compiling u/t_server_console_stringcommandhandler.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_stringcommandhandler.o -c u/t_server_console_stringcommandhandler.cpp

u/t_server_console_stringcommandhandler.s: \
    u/t_server_console_stringcommandhandler.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_stringcommandhandler.s -S u/t_server_console_stringcommandhandler.cpp

u/t_server_console_terminal.lo: u/t_server_console_terminal.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_terminal.lo -c u/t_server_console_terminal.cpp

u/t_server_console_terminal.o: u/t_server_console_terminal.cpp
	@echo "        Compiling u/t_server_console_terminal.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_terminal.o -c u/t_server_console_terminal.cpp

u/t_server_console_terminal.s: u/t_server_console_terminal.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_console_terminal.s -S u/t_server_console_terminal.cpp

u/t_server_dbexport_dbexporter.lo: u/t_server_dbexport_dbexporter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_dbexport_dbexporter.lo -c u/t_server_dbexport_dbexporter.cpp

u/t_server_dbexport_dbexporter.o: u/t_server_dbexport_dbexporter.cpp
	@echo "        Compiling u/t_server_dbexport_dbexporter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_dbexport_dbexporter.o -c u/t_server_dbexport_dbexporter.cpp

u/t_server_dbexport_dbexporter.s: u/t_server_dbexport_dbexporter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_dbexport_dbexporter.s -S u/t_server_dbexport_dbexporter.cpp

u/t_server_errors.lo: u/t_server_errors.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_errors.lo -c u/t_server_errors.cpp

u/t_server_errors.o: u/t_server_errors.cpp
	@echo "        Compiling u/t_server_errors.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_errors.o -c u/t_server_errors.cpp

u/t_server_errors.s: u/t_server_errors.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_errors.s -S u/t_server_errors.cpp

u/t_server_file_ca_commit.lo: u/t_server_file_ca_commit.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_commit.lo -c u/t_server_file_ca_commit.cpp

u/t_server_file_ca_commit.o: u/t_server_file_ca_commit.cpp
	@echo "        Compiling u/t_server_file_ca_commit.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_commit.o -c u/t_server_file_ca_commit.cpp

u/t_server_file_ca_commit.s: u/t_server_file_ca_commit.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_commit.s -S u/t_server_file_ca_commit.cpp

u/t_server_file_ca_directoryentry.lo: u/t_server_file_ca_directoryentry.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_directoryentry.lo -c u/t_server_file_ca_directoryentry.cpp

u/t_server_file_ca_directoryentry.o: u/t_server_file_ca_directoryentry.cpp
	@echo "        Compiling u/t_server_file_ca_directoryentry.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_directoryentry.o -c u/t_server_file_ca_directoryentry.cpp

u/t_server_file_ca_directoryentry.s: u/t_server_file_ca_directoryentry.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_directoryentry.s -S u/t_server_file_ca_directoryentry.cpp

u/t_server_file_ca_directoryhandler.lo: \
    u/t_server_file_ca_directoryhandler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_directoryhandler.lo -c u/t_server_file_ca_directoryhandler.cpp

u/t_server_file_ca_directoryhandler.o: \
    u/t_server_file_ca_directoryhandler.cpp
	@echo "        Compiling u/t_server_file_ca_directoryhandler.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_directoryhandler.o -c u/t_server_file_ca_directoryhandler.cpp

u/t_server_file_ca_directoryhandler.s: \
    u/t_server_file_ca_directoryhandler.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_directoryhandler.s -S u/t_server_file_ca_directoryhandler.cpp

u/t_server_file_ca_internalobjectcache.lo: \
    u/t_server_file_ca_internalobjectcache.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_internalobjectcache.lo -c u/t_server_file_ca_internalobjectcache.cpp

u/t_server_file_ca_internalobjectcache.o: \
    u/t_server_file_ca_internalobjectcache.cpp
	@echo "        Compiling u/t_server_file_ca_internalobjectcache.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_internalobjectcache.o -c u/t_server_file_ca_internalobjectcache.cpp

u/t_server_file_ca_internalobjectcache.s: \
    u/t_server_file_ca_internalobjectcache.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_internalobjectcache.s -S u/t_server_file_ca_internalobjectcache.cpp

u/t_server_file_ca_internalreferencecounter.lo: \
    u/t_server_file_ca_internalreferencecounter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_internalreferencecounter.lo -c u/t_server_file_ca_internalreferencecounter.cpp

u/t_server_file_ca_internalreferencecounter.o: \
    u/t_server_file_ca_internalreferencecounter.cpp
	@echo "        Compiling u/t_server_file_ca_internalreferencecounter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_internalreferencecounter.o -c u/t_server_file_ca_internalreferencecounter.cpp

u/t_server_file_ca_internalreferencecounter.s: \
    u/t_server_file_ca_internalreferencecounter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_internalreferencecounter.s -S u/t_server_file_ca_internalreferencecounter.cpp

u/t_server_file_ca_objectcache.lo: u/t_server_file_ca_objectcache.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_objectcache.lo -c u/t_server_file_ca_objectcache.cpp

u/t_server_file_ca_objectcache.o: u/t_server_file_ca_objectcache.cpp
	@echo "        Compiling u/t_server_file_ca_objectcache.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_objectcache.o -c u/t_server_file_ca_objectcache.cpp

u/t_server_file_ca_objectcache.s: u/t_server_file_ca_objectcache.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_objectcache.s -S u/t_server_file_ca_objectcache.cpp

u/t_server_file_ca_objectid.lo: u/t_server_file_ca_objectid.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_objectid.lo -c u/t_server_file_ca_objectid.cpp

u/t_server_file_ca_objectid.o: u/t_server_file_ca_objectid.cpp
	@echo "        Compiling u/t_server_file_ca_objectid.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_objectid.o -c u/t_server_file_ca_objectid.cpp

u/t_server_file_ca_objectid.s: u/t_server_file_ca_objectid.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_objectid.s -S u/t_server_file_ca_objectid.cpp

u/t_server_file_ca_objectstore.lo: u/t_server_file_ca_objectstore.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_objectstore.lo -c u/t_server_file_ca_objectstore.cpp

u/t_server_file_ca_objectstore.o: u/t_server_file_ca_objectstore.cpp
	@echo "        Compiling u/t_server_file_ca_objectstore.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_objectstore.o -c u/t_server_file_ca_objectstore.cpp

u/t_server_file_ca_objectstore.s: u/t_server_file_ca_objectstore.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_objectstore.s -S u/t_server_file_ca_objectstore.cpp

u/t_server_file_ca_referencecounter.lo: \
    u/t_server_file_ca_referencecounter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_referencecounter.lo -c u/t_server_file_ca_referencecounter.cpp

u/t_server_file_ca_referencecounter.o: \
    u/t_server_file_ca_referencecounter.cpp
	@echo "        Compiling u/t_server_file_ca_referencecounter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_referencecounter.o -c u/t_server_file_ca_referencecounter.cpp

u/t_server_file_ca_referencecounter.s: \
    u/t_server_file_ca_referencecounter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_referencecounter.s -S u/t_server_file_ca_referencecounter.cpp

u/t_server_file_ca_referenceupdater.lo: \
    u/t_server_file_ca_referenceupdater.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_referenceupdater.lo -c u/t_server_file_ca_referenceupdater.cpp

u/t_server_file_ca_referenceupdater.o: \
    u/t_server_file_ca_referenceupdater.cpp
	@echo "        Compiling u/t_server_file_ca_referenceupdater.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_referenceupdater.o -c u/t_server_file_ca_referenceupdater.cpp

u/t_server_file_ca_referenceupdater.s: \
    u/t_server_file_ca_referenceupdater.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_referenceupdater.s -S u/t_server_file_ca_referenceupdater.cpp

u/t_server_file_ca_root.lo: u/t_server_file_ca_root.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_root.lo -c u/t_server_file_ca_root.cpp

u/t_server_file_ca_root.o: u/t_server_file_ca_root.cpp
	@echo "        Compiling u/t_server_file_ca_root.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_root.o -c u/t_server_file_ca_root.cpp

u/t_server_file_ca_root.s: u/t_server_file_ca_root.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_ca_root.s -S u/t_server_file_ca_root.cpp

u/t_server_file_clientdirectory.lo: u/t_server_file_clientdirectory.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_clientdirectory.lo -c u/t_server_file_clientdirectory.cpp

u/t_server_file_clientdirectory.o: u/t_server_file_clientdirectory.cpp
	@echo "        Compiling u/t_server_file_clientdirectory.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_clientdirectory.o -c u/t_server_file_clientdirectory.cpp

u/t_server_file_clientdirectory.s: u/t_server_file_clientdirectory.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_clientdirectory.s -S u/t_server_file_clientdirectory.cpp

u/t_server_file_clientdirectoryhandler.lo: \
    u/t_server_file_clientdirectoryhandler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_clientdirectoryhandler.lo -c u/t_server_file_clientdirectoryhandler.cpp

u/t_server_file_clientdirectoryhandler.o: \
    u/t_server_file_clientdirectoryhandler.cpp
	@echo "        Compiling u/t_server_file_clientdirectoryhandler.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_clientdirectoryhandler.o -c u/t_server_file_clientdirectoryhandler.cpp

u/t_server_file_clientdirectoryhandler.s: \
    u/t_server_file_clientdirectoryhandler.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_clientdirectoryhandler.s -S u/t_server_file_clientdirectoryhandler.cpp

u/t_server_file_commandhandler.lo: u/t_server_file_commandhandler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_commandhandler.lo -c u/t_server_file_commandhandler.cpp

u/t_server_file_commandhandler.o: u/t_server_file_commandhandler.cpp
	@echo "        Compiling u/t_server_file_commandhandler.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_commandhandler.o -c u/t_server_file_commandhandler.cpp

u/t_server_file_commandhandler.s: u/t_server_file_commandhandler.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_commandhandler.s -S u/t_server_file_commandhandler.cpp

u/t_server_file_directoryhandler.lo: u/t_server_file_directoryhandler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_directoryhandler.lo -c u/t_server_file_directoryhandler.cpp

u/t_server_file_directoryhandler.o: u/t_server_file_directoryhandler.cpp
	@echo "        Compiling u/t_server_file_directoryhandler.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_directoryhandler.o -c u/t_server_file_directoryhandler.cpp

u/t_server_file_directoryhandler.s: u/t_server_file_directoryhandler.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_directoryhandler.s -S u/t_server_file_directoryhandler.cpp

u/t_server_file_directoryhandlerfactory.lo: \
    u/t_server_file_directoryhandlerfactory.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_directoryhandlerfactory.lo -c u/t_server_file_directoryhandlerfactory.cpp

u/t_server_file_directoryhandlerfactory.o: \
    u/t_server_file_directoryhandlerfactory.cpp
	@echo "        Compiling u/t_server_file_directoryhandlerfactory.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_directoryhandlerfactory.o -c u/t_server_file_directoryhandlerfactory.cpp

u/t_server_file_directoryhandlerfactory.s: \
    u/t_server_file_directoryhandlerfactory.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_directoryhandlerfactory.s -S u/t_server_file_directoryhandlerfactory.cpp

u/t_server_file_directorywrapper.lo: u/t_server_file_directorywrapper.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_directorywrapper.lo -c u/t_server_file_directorywrapper.cpp

u/t_server_file_directorywrapper.o: u/t_server_file_directorywrapper.cpp
	@echo "        Compiling u/t_server_file_directorywrapper.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_directorywrapper.o -c u/t_server_file_directorywrapper.cpp

u/t_server_file_directorywrapper.s: u/t_server_file_directorywrapper.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_directorywrapper.s -S u/t_server_file_directorywrapper.cpp

u/t_server_file_filebase.lo: u/t_server_file_filebase.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_filebase.lo -c u/t_server_file_filebase.cpp

u/t_server_file_filebase.o: u/t_server_file_filebase.cpp
	@echo "        Compiling u/t_server_file_filebase.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_filebase.o -c u/t_server_file_filebase.cpp

u/t_server_file_filebase.s: u/t_server_file_filebase.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_filebase.s -S u/t_server_file_filebase.cpp

u/t_server_file_filegame.lo: u/t_server_file_filegame.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_filegame.lo -c u/t_server_file_filegame.cpp

u/t_server_file_filegame.o: u/t_server_file_filegame.cpp
	@echo "        Compiling u/t_server_file_filegame.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_filegame.o -c u/t_server_file_filegame.cpp

u/t_server_file_filegame.s: u/t_server_file_filegame.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_filegame.s -S u/t_server_file_filegame.cpp

u/t_server_file_gamestatus.lo: u/t_server_file_gamestatus.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_gamestatus.lo -c u/t_server_file_gamestatus.cpp

u/t_server_file_gamestatus.o: u/t_server_file_gamestatus.cpp
	@echo "        Compiling u/t_server_file_gamestatus.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_gamestatus.o -c u/t_server_file_gamestatus.cpp

u/t_server_file_gamestatus.s: u/t_server_file_gamestatus.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_gamestatus.s -S u/t_server_file_gamestatus.cpp

u/t_server_file_internalfileserver.lo: \
    u/t_server_file_internalfileserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_internalfileserver.lo -c u/t_server_file_internalfileserver.cpp

u/t_server_file_internalfileserver.o: u/t_server_file_internalfileserver.cpp
	@echo "        Compiling u/t_server_file_internalfileserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_internalfileserver.o -c u/t_server_file_internalfileserver.cpp

u/t_server_file_internalfileserver.s: u/t_server_file_internalfileserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_internalfileserver.s -S u/t_server_file_internalfileserver.cpp

u/t_server_file_item.lo: u/t_server_file_item.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_item.lo -c u/t_server_file_item.cpp

u/t_server_file_item.o: u/t_server_file_item.cpp
	@echo "        Compiling u/t_server_file_item.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_item.o -c u/t_server_file_item.cpp

u/t_server_file_item.s: u/t_server_file_item.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_item.s -S u/t_server_file_item.cpp

u/t_server_file_racenames.lo: u/t_server_file_racenames.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_racenames.lo -c u/t_server_file_racenames.cpp

u/t_server_file_racenames.o: u/t_server_file_racenames.cpp
	@echo "        Compiling u/t_server_file_racenames.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_racenames.o -c u/t_server_file_racenames.cpp

u/t_server_file_racenames.s: u/t_server_file_racenames.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_racenames.s -S u/t_server_file_racenames.cpp

u/t_server_file_root.lo: u/t_server_file_root.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_root.lo -c u/t_server_file_root.cpp

u/t_server_file_root.o: u/t_server_file_root.cpp
	@echo "        Compiling u/t_server_file_root.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_root.o -c u/t_server_file_root.cpp

u/t_server_file_root.s: u/t_server_file_root.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_root.s -S u/t_server_file_root.cpp

u/t_server_file_session.lo: u/t_server_file_session.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_session.lo -c u/t_server_file_session.cpp

u/t_server_file_session.o: u/t_server_file_session.cpp
	@echo "        Compiling u/t_server_file_session.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_session.o -c u/t_server_file_session.cpp

u/t_server_file_session.s: u/t_server_file_session.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_session.s -S u/t_server_file_session.cpp

u/t_server_file_utils.lo: u/t_server_file_utils.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_utils.lo -c u/t_server_file_utils.cpp

u/t_server_file_utils.o: u/t_server_file_utils.cpp
	@echo "        Compiling u/t_server_file_utils.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_utils.o -c u/t_server_file_utils.cpp

u/t_server_file_utils.s: u/t_server_file_utils.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_file_utils.s -S u/t_server_file_utils.cpp

u/t_server_format_beampacker.lo: u/t_server_format_beampacker.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_beampacker.lo -c u/t_server_format_beampacker.cpp

u/t_server_format_beampacker.o: u/t_server_format_beampacker.cpp
	@echo "        Compiling u/t_server_format_beampacker.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_beampacker.o -c u/t_server_format_beampacker.cpp

u/t_server_format_beampacker.s: u/t_server_format_beampacker.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_beampacker.s -S u/t_server_format_beampacker.cpp

u/t_server_format_enginepacker.lo: u/t_server_format_enginepacker.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_enginepacker.lo -c u/t_server_format_enginepacker.cpp

u/t_server_format_enginepacker.o: u/t_server_format_enginepacker.cpp
	@echo "        Compiling u/t_server_format_enginepacker.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_enginepacker.o -c u/t_server_format_enginepacker.cpp

u/t_server_format_enginepacker.s: u/t_server_format_enginepacker.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_enginepacker.s -S u/t_server_format_enginepacker.cpp

u/t_server_format_format.lo: u/t_server_format_format.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_format.lo -c u/t_server_format_format.cpp

u/t_server_format_format.o: u/t_server_format_format.cpp
	@echo "        Compiling u/t_server_format_format.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_format.o -c u/t_server_format_format.cpp

u/t_server_format_format.s: u/t_server_format_format.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_format.s -S u/t_server_format_format.cpp

u/t_server_format_hullpacker.lo: u/t_server_format_hullpacker.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_hullpacker.lo -c u/t_server_format_hullpacker.cpp

u/t_server_format_hullpacker.o: u/t_server_format_hullpacker.cpp
	@echo "        Compiling u/t_server_format_hullpacker.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_hullpacker.o -c u/t_server_format_hullpacker.cpp

u/t_server_format_hullpacker.s: u/t_server_format_hullpacker.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_hullpacker.s -S u/t_server_format_hullpacker.cpp

u/t_server_format_packer.lo: u/t_server_format_packer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_packer.lo -c u/t_server_format_packer.cpp

u/t_server_format_packer.o: u/t_server_format_packer.cpp
	@echo "        Compiling u/t_server_format_packer.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_packer.o -c u/t_server_format_packer.cpp

u/t_server_format_packer.s: u/t_server_format_packer.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_packer.s -S u/t_server_format_packer.cpp

u/t_server_format_simpacker.lo: u/t_server_format_simpacker.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_simpacker.lo -c u/t_server_format_simpacker.cpp

u/t_server_format_simpacker.o: u/t_server_format_simpacker.cpp
	@echo "        Compiling u/t_server_format_simpacker.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_simpacker.o -c u/t_server_format_simpacker.cpp

u/t_server_format_simpacker.s: u/t_server_format_simpacker.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_simpacker.s -S u/t_server_format_simpacker.cpp

u/t_server_format_stringpacker.lo: u/t_server_format_stringpacker.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_stringpacker.lo -c u/t_server_format_stringpacker.cpp

u/t_server_format_stringpacker.o: u/t_server_format_stringpacker.cpp
	@echo "        Compiling u/t_server_format_stringpacker.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_stringpacker.o -c u/t_server_format_stringpacker.cpp

u/t_server_format_stringpacker.s: u/t_server_format_stringpacker.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_stringpacker.s -S u/t_server_format_stringpacker.cpp

u/t_server_format_torpedopacker.lo: u/t_server_format_torpedopacker.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_torpedopacker.lo -c u/t_server_format_torpedopacker.cpp

u/t_server_format_torpedopacker.o: u/t_server_format_torpedopacker.cpp
	@echo "        Compiling u/t_server_format_torpedopacker.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_torpedopacker.o -c u/t_server_format_torpedopacker.cpp

u/t_server_format_torpedopacker.s: u/t_server_format_torpedopacker.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_torpedopacker.s -S u/t_server_format_torpedopacker.cpp

u/t_server_format_truehullpacker.lo: u/t_server_format_truehullpacker.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_truehullpacker.lo -c u/t_server_format_truehullpacker.cpp

u/t_server_format_truehullpacker.o: u/t_server_format_truehullpacker.cpp
	@echo "        Compiling u/t_server_format_truehullpacker.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_truehullpacker.o -c u/t_server_format_truehullpacker.cpp

u/t_server_format_truehullpacker.s: u/t_server_format_truehullpacker.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_truehullpacker.s -S u/t_server_format_truehullpacker.cpp

u/t_server_format_utils.lo: u/t_server_format_utils.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_utils.lo -c u/t_server_format_utils.cpp

u/t_server_format_utils.o: u/t_server_format_utils.cpp
	@echo "        Compiling u/t_server_format_utils.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_utils.o -c u/t_server_format_utils.cpp

u/t_server_format_utils.s: u/t_server_format_utils.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_format_utils.s -S u/t_server_format_utils.cpp

u/t_server_host_commandhandler.lo: u/t_server_host_commandhandler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_commandhandler.lo -c u/t_server_host_commandhandler.cpp

u/t_server_host_commandhandler.o: u/t_server_host_commandhandler.cpp
	@echo "        Compiling u/t_server_host_commandhandler.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_commandhandler.o -c u/t_server_host_commandhandler.cpp

u/t_server_host_commandhandler.s: u/t_server_host_commandhandler.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_commandhandler.s -S u/t_server_host_commandhandler.cpp

u/t_server_host_configuration.lo: u/t_server_host_configuration.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_configuration.lo -c u/t_server_host_configuration.cpp

u/t_server_host_configuration.o: u/t_server_host_configuration.cpp
	@echo "        Compiling u/t_server_host_configuration.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_configuration.o -c u/t_server_host_configuration.cpp

u/t_server_host_configuration.s: u/t_server_host_configuration.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_configuration.s -S u/t_server_host_configuration.cpp

u/t_server_host_configurationbuilder.lo: \
    u/t_server_host_configurationbuilder.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_configurationbuilder.lo -c u/t_server_host_configurationbuilder.cpp

u/t_server_host_configurationbuilder.o: \
    u/t_server_host_configurationbuilder.cpp
	@echo "        Compiling u/t_server_host_configurationbuilder.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_configurationbuilder.o -c u/t_server_host_configurationbuilder.cpp

u/t_server_host_configurationbuilder.s: \
    u/t_server_host_configurationbuilder.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_configurationbuilder.s -S u/t_server_host_configurationbuilder.cpp

u/t_server_host_cron.lo: u/t_server_host_cron.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_cron.lo -c u/t_server_host_cron.cpp

u/t_server_host_cron.o: u/t_server_host_cron.cpp
	@echo "        Compiling u/t_server_host_cron.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_cron.o -c u/t_server_host_cron.cpp

u/t_server_host_cron.s: u/t_server_host_cron.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_cron.s -S u/t_server_host_cron.cpp

u/t_server_host_cronimpl.lo: u/t_server_host_cronimpl.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_cronimpl.lo -c u/t_server_host_cronimpl.cpp

u/t_server_host_cronimpl.o: u/t_server_host_cronimpl.cpp
	@echo "        Compiling u/t_server_host_cronimpl.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_cronimpl.o -c u/t_server_host_cronimpl.cpp

u/t_server_host_cronimpl.s: u/t_server_host_cronimpl.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_cronimpl.s -S u/t_server_host_cronimpl.cpp

u/t_server_host_exporter.lo: u/t_server_host_exporter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_exporter.lo -c u/t_server_host_exporter.cpp

u/t_server_host_exporter.o: u/t_server_host_exporter.cpp
	@echo "        Compiling u/t_server_host_exporter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_exporter.o -c u/t_server_host_exporter.cpp

u/t_server_host_exporter.s: u/t_server_host_exporter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_exporter.s -S u/t_server_host_exporter.cpp

u/t_server_host_file_fileitem.lo: u/t_server_host_file_fileitem.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_file_fileitem.lo -c u/t_server_host_file_fileitem.cpp

u/t_server_host_file_fileitem.o: u/t_server_host_file_fileitem.cpp
	@echo "        Compiling u/t_server_host_file_fileitem.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_file_fileitem.o -c u/t_server_host_file_fileitem.cpp

u/t_server_host_file_fileitem.s: u/t_server_host_file_fileitem.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_file_fileitem.s -S u/t_server_host_file_fileitem.cpp

u/t_server_host_file_gamerootitem.lo: u/t_server_host_file_gamerootitem.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_file_gamerootitem.lo -c u/t_server_host_file_gamerootitem.cpp

u/t_server_host_file_gamerootitem.o: u/t_server_host_file_gamerootitem.cpp
	@echo "        Compiling u/t_server_host_file_gamerootitem.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_file_gamerootitem.o -c u/t_server_host_file_gamerootitem.cpp

u/t_server_host_file_gamerootitem.s: u/t_server_host_file_gamerootitem.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_file_gamerootitem.s -S u/t_server_host_file_gamerootitem.cpp

u/t_server_host_file_item.lo: u/t_server_host_file_item.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_file_item.lo -c u/t_server_host_file_item.cpp

u/t_server_host_file_item.o: u/t_server_host_file_item.cpp
	@echo "        Compiling u/t_server_host_file_item.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_file_item.o -c u/t_server_host_file_item.cpp

u/t_server_host_file_item.s: u/t_server_host_file_item.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_file_item.s -S u/t_server_host_file_item.cpp

u/t_server_host_file_rootitem.lo: u/t_server_host_file_rootitem.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_file_rootitem.lo -c u/t_server_host_file_rootitem.cpp

u/t_server_host_file_rootitem.o: u/t_server_host_file_rootitem.cpp
	@echo "        Compiling u/t_server_host_file_rootitem.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_file_rootitem.o -c u/t_server_host_file_rootitem.cpp

u/t_server_host_file_rootitem.s: u/t_server_host_file_rootitem.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_file_rootitem.s -S u/t_server_host_file_rootitem.cpp

u/t_server_host_file_toolitem.lo: u/t_server_host_file_toolitem.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_file_toolitem.lo -c u/t_server_host_file_toolitem.cpp

u/t_server_host_file_toolitem.o: u/t_server_host_file_toolitem.cpp
	@echo "        Compiling u/t_server_host_file_toolitem.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_file_toolitem.o -c u/t_server_host_file_toolitem.cpp

u/t_server_host_file_toolitem.s: u/t_server_host_file_toolitem.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_file_toolitem.s -S u/t_server_host_file_toolitem.cpp

u/t_server_host_game.lo: u/t_server_host_game.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_game.lo -c u/t_server_host_game.cpp

u/t_server_host_game.o: u/t_server_host_game.cpp
	@echo "        Compiling u/t_server_host_game.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_game.o -c u/t_server_host_game.cpp

u/t_server_host_game.s: u/t_server_host_game.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_game.s -S u/t_server_host_game.cpp

u/t_server_host_gamearbiter.lo: u/t_server_host_gamearbiter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_gamearbiter.lo -c u/t_server_host_gamearbiter.cpp

u/t_server_host_gamearbiter.o: u/t_server_host_gamearbiter.cpp
	@echo "        Compiling u/t_server_host_gamearbiter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_gamearbiter.o -c u/t_server_host_gamearbiter.cpp

u/t_server_host_gamearbiter.s: u/t_server_host_gamearbiter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_gamearbiter.s -S u/t_server_host_gamearbiter.cpp

u/t_server_host_gamecreator.lo: u/t_server_host_gamecreator.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_gamecreator.lo -c u/t_server_host_gamecreator.cpp

u/t_server_host_gamecreator.o: u/t_server_host_gamecreator.cpp
	@echo "        Compiling u/t_server_host_gamecreator.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_gamecreator.o -c u/t_server_host_gamecreator.cpp

u/t_server_host_gamecreator.s: u/t_server_host_gamecreator.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_gamecreator.s -S u/t_server_host_gamecreator.cpp

u/t_server_host_hostcron.lo: u/t_server_host_hostcron.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_hostcron.lo -c u/t_server_host_hostcron.cpp

u/t_server_host_hostcron.o: u/t_server_host_hostcron.cpp
	@echo "        Compiling u/t_server_host_hostcron.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_hostcron.o -c u/t_server_host_hostcron.cpp

u/t_server_host_hostcron.s: u/t_server_host_hostcron.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_hostcron.s -S u/t_server_host_hostcron.cpp

u/t_server_host_hostfile.lo: u/t_server_host_hostfile.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_hostfile.lo -c u/t_server_host_hostfile.cpp

u/t_server_host_hostfile.o: u/t_server_host_hostfile.cpp
	@echo "        Compiling u/t_server_host_hostfile.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_hostfile.o -c u/t_server_host_hostfile.cpp

u/t_server_host_hostfile.s: u/t_server_host_hostfile.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_hostfile.s -S u/t_server_host_hostfile.cpp

u/t_server_host_hostgame.lo: u/t_server_host_hostgame.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_hostgame.lo -c u/t_server_host_hostgame.cpp

u/t_server_host_hostgame.o: u/t_server_host_hostgame.cpp
	@echo "        Compiling u/t_server_host_hostgame.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_hostgame.o -c u/t_server_host_hostgame.cpp

u/t_server_host_hostgame.s: u/t_server_host_hostgame.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_hostgame.s -S u/t_server_host_hostgame.cpp

u/t_server_host_hostplayer.lo: u/t_server_host_hostplayer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_hostplayer.lo -c u/t_server_host_hostplayer.cpp

u/t_server_host_hostplayer.o: u/t_server_host_hostplayer.cpp
	@echo "        Compiling u/t_server_host_hostplayer.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_hostplayer.o -c u/t_server_host_hostplayer.cpp

u/t_server_host_hostplayer.s: u/t_server_host_hostplayer.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_hostplayer.s -S u/t_server_host_hostplayer.cpp

u/t_server_host_hostschedule.lo: u/t_server_host_hostschedule.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_hostschedule.lo -c u/t_server_host_hostschedule.cpp

u/t_server_host_hostschedule.o: u/t_server_host_hostschedule.cpp
	@echo "        Compiling u/t_server_host_hostschedule.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_hostschedule.o -c u/t_server_host_hostschedule.cpp

u/t_server_host_hostschedule.s: u/t_server_host_hostschedule.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_hostschedule.s -S u/t_server_host_hostschedule.cpp

u/t_server_host_hosttool.lo: u/t_server_host_hosttool.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_hosttool.lo -c u/t_server_host_hosttool.cpp

u/t_server_host_hosttool.o: u/t_server_host_hosttool.cpp
	@echo "        Compiling u/t_server_host_hosttool.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_hosttool.o -c u/t_server_host_hosttool.cpp

u/t_server_host_hosttool.s: u/t_server_host_hosttool.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_hosttool.s -S u/t_server_host_hosttool.cpp

u/t_server_host_hostturn.lo: u/t_server_host_hostturn.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_hostturn.lo -c u/t_server_host_hostturn.cpp

u/t_server_host_hostturn.o: u/t_server_host_hostturn.cpp
	@echo "        Compiling u/t_server_host_hostturn.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_hostturn.o -c u/t_server_host_hostturn.cpp

u/t_server_host_hostturn.s: u/t_server_host_hostturn.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_hostturn.s -S u/t_server_host_hostturn.cpp

u/t_server_host_installer.lo: u/t_server_host_installer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_installer.lo -c u/t_server_host_installer.cpp

u/t_server_host_installer.o: u/t_server_host_installer.cpp
	@echo "        Compiling u/t_server_host_installer.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_installer.o -c u/t_server_host_installer.cpp

u/t_server_host_installer.s: u/t_server_host_installer.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_installer.s -S u/t_server_host_installer.cpp

u/t_server_host_rank_levelhandler.lo: u/t_server_host_rank_levelhandler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_rank_levelhandler.lo -c u/t_server_host_rank_levelhandler.cpp

u/t_server_host_rank_levelhandler.o: u/t_server_host_rank_levelhandler.cpp
	@echo "        Compiling u/t_server_host_rank_levelhandler.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_rank_levelhandler.o -c u/t_server_host_rank_levelhandler.cpp

u/t_server_host_rank_levelhandler.s: u/t_server_host_rank_levelhandler.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_rank_levelhandler.s -S u/t_server_host_rank_levelhandler.cpp

u/t_server_host_rank_rank.lo: u/t_server_host_rank_rank.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_rank_rank.lo -c u/t_server_host_rank_rank.cpp

u/t_server_host_rank_rank.o: u/t_server_host_rank_rank.cpp
	@echo "        Compiling u/t_server_host_rank_rank.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_rank_rank.o -c u/t_server_host_rank_rank.cpp

u/t_server_host_rank_rank.s: u/t_server_host_rank_rank.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_rank_rank.s -S u/t_server_host_rank_rank.cpp

u/t_server_host_rank_refereefilereader.lo: \
    u/t_server_host_rank_refereefilereader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_rank_refereefilereader.lo -c u/t_server_host_rank_refereefilereader.cpp

u/t_server_host_rank_refereefilereader.o: \
    u/t_server_host_rank_refereefilereader.cpp
	@echo "        Compiling u/t_server_host_rank_refereefilereader.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_rank_refereefilereader.o -c u/t_server_host_rank_refereefilereader.cpp

u/t_server_host_rank_refereefilereader.s: \
    u/t_server_host_rank_refereefilereader.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_rank_refereefilereader.s -S u/t_server_host_rank_refereefilereader.cpp

u/t_server_host_rank_scorefilereader.lo: \
    u/t_server_host_rank_scorefilereader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_rank_scorefilereader.lo -c u/t_server_host_rank_scorefilereader.cpp

u/t_server_host_rank_scorefilereader.o: \
    u/t_server_host_rank_scorefilereader.cpp
	@echo "        Compiling u/t_server_host_rank_scorefilereader.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_rank_scorefilereader.o -c u/t_server_host_rank_scorefilereader.cpp

u/t_server_host_rank_scorefilereader.s: \
    u/t_server_host_rank_scorefilereader.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_rank_scorefilereader.s -S u/t_server_host_rank_scorefilereader.cpp

u/t_server_host_rank_victory.lo: u/t_server_host_rank_victory.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_rank_victory.lo -c u/t_server_host_rank_victory.cpp

u/t_server_host_rank_victory.o: u/t_server_host_rank_victory.cpp
	@echo "        Compiling u/t_server_host_rank_victory.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_rank_victory.o -c u/t_server_host_rank_victory.cpp

u/t_server_host_rank_victory.s: u/t_server_host_rank_victory.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_rank_victory.s -S u/t_server_host_rank_victory.cpp

u/t_server_host_resultsender.lo: u/t_server_host_resultsender.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_resultsender.lo -c u/t_server_host_resultsender.cpp

u/t_server_host_resultsender.o: u/t_server_host_resultsender.cpp
	@echo "        Compiling u/t_server_host_resultsender.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_resultsender.o -c u/t_server_host_resultsender.cpp

u/t_server_host_resultsender.s: u/t_server_host_resultsender.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_resultsender.s -S u/t_server_host_resultsender.cpp

u/t_server_host_schedule.lo: u/t_server_host_schedule.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_schedule.lo -c u/t_server_host_schedule.cpp

u/t_server_host_schedule.o: u/t_server_host_schedule.cpp
	@echo "        Compiling u/t_server_host_schedule.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_schedule.o -c u/t_server_host_schedule.cpp

u/t_server_host_schedule.s: u/t_server_host_schedule.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_schedule.s -S u/t_server_host_schedule.cpp

u/t_server_host_session.lo: u/t_server_host_session.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_session.lo -c u/t_server_host_session.cpp

u/t_server_host_session.o: u/t_server_host_session.cpp
	@echo "        Compiling u/t_server_host_session.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_session.o -c u/t_server_host_session.cpp

u/t_server_host_session.s: u/t_server_host_session.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_session.s -S u/t_server_host_session.cpp

u/t_server_host_talkadapter.lo: u/t_server_host_talkadapter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_talkadapter.lo -c u/t_server_host_talkadapter.cpp

u/t_server_host_talkadapter.o: u/t_server_host_talkadapter.cpp
	@echo "        Compiling u/t_server_host_talkadapter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_talkadapter.o -c u/t_server_host_talkadapter.cpp

u/t_server_host_talkadapter.s: u/t_server_host_talkadapter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_talkadapter.s -S u/t_server_host_talkadapter.cpp

u/t_server_host_talklistener.lo: u/t_server_host_talklistener.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_talklistener.lo -c u/t_server_host_talklistener.cpp

u/t_server_host_talklistener.o: u/t_server_host_talklistener.cpp
	@echo "        Compiling u/t_server_host_talklistener.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_talklistener.o -c u/t_server_host_talklistener.cpp

u/t_server_host_talklistener.s: u/t_server_host_talklistener.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_host_talklistener.s -S u/t_server_host_talklistener.cpp

u/t_server_interface_base.lo: u/t_server_interface_base.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_base.lo -c u/t_server_interface_base.cpp

u/t_server_interface_base.o: u/t_server_interface_base.cpp
	@echo "        Compiling u/t_server_interface_base.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_base.o -c u/t_server_interface_base.cpp

u/t_server_interface_base.s: u/t_server_interface_base.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_base.s -S u/t_server_interface_base.cpp

u/t_server_interface_baseclient.lo: u/t_server_interface_baseclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_baseclient.lo -c u/t_server_interface_baseclient.cpp

u/t_server_interface_baseclient.o: u/t_server_interface_baseclient.cpp
	@echo "        Compiling u/t_server_interface_baseclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_baseclient.o -c u/t_server_interface_baseclient.cpp

u/t_server_interface_baseclient.s: u/t_server_interface_baseclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_baseclient.s -S u/t_server_interface_baseclient.cpp

u/t_server_interface_composablecommandhandler.lo: \
    u/t_server_interface_composablecommandhandler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_composablecommandhandler.lo -c u/t_server_interface_composablecommandhandler.cpp

u/t_server_interface_composablecommandhandler.o: \
    u/t_server_interface_composablecommandhandler.cpp
	@echo "        Compiling u/t_server_interface_composablecommandhandler.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_composablecommandhandler.o -c u/t_server_interface_composablecommandhandler.cpp

u/t_server_interface_composablecommandhandler.s: \
    u/t_server_interface_composablecommandhandler.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_composablecommandhandler.s -S u/t_server_interface_composablecommandhandler.cpp

u/t_server_interface_filebase.lo: u/t_server_interface_filebase.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_filebase.lo -c u/t_server_interface_filebase.cpp

u/t_server_interface_filebase.o: u/t_server_interface_filebase.cpp
	@echo "        Compiling u/t_server_interface_filebase.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_filebase.o -c u/t_server_interface_filebase.cpp

u/t_server_interface_filebase.s: u/t_server_interface_filebase.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_filebase.s -S u/t_server_interface_filebase.cpp

u/t_server_interface_filebaseclient.lo: \
    u/t_server_interface_filebaseclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_filebaseclient.lo -c u/t_server_interface_filebaseclient.cpp

u/t_server_interface_filebaseclient.o: \
    u/t_server_interface_filebaseclient.cpp
	@echo "        Compiling u/t_server_interface_filebaseclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_filebaseclient.o -c u/t_server_interface_filebaseclient.cpp

u/t_server_interface_filebaseclient.s: \
    u/t_server_interface_filebaseclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_filebaseclient.s -S u/t_server_interface_filebaseclient.cpp

u/t_server_interface_filebaseserver.lo: \
    u/t_server_interface_filebaseserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_filebaseserver.lo -c u/t_server_interface_filebaseserver.cpp

u/t_server_interface_filebaseserver.o: \
    u/t_server_interface_filebaseserver.cpp
	@echo "        Compiling u/t_server_interface_filebaseserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_filebaseserver.o -c u/t_server_interface_filebaseserver.cpp

u/t_server_interface_filebaseserver.s: \
    u/t_server_interface_filebaseserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_filebaseserver.s -S u/t_server_interface_filebaseserver.cpp

u/t_server_interface_filegame.lo: u/t_server_interface_filegame.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_filegame.lo -c u/t_server_interface_filegame.cpp

u/t_server_interface_filegame.o: u/t_server_interface_filegame.cpp
	@echo "        Compiling u/t_server_interface_filegame.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_filegame.o -c u/t_server_interface_filegame.cpp

u/t_server_interface_filegame.s: u/t_server_interface_filegame.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_filegame.s -S u/t_server_interface_filegame.cpp

u/t_server_interface_filegameclient.lo: \
    u/t_server_interface_filegameclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_filegameclient.lo -c u/t_server_interface_filegameclient.cpp

u/t_server_interface_filegameclient.o: \
    u/t_server_interface_filegameclient.cpp
	@echo "        Compiling u/t_server_interface_filegameclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_filegameclient.o -c u/t_server_interface_filegameclient.cpp

u/t_server_interface_filegameclient.s: \
    u/t_server_interface_filegameclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_filegameclient.s -S u/t_server_interface_filegameclient.cpp

u/t_server_interface_filegameserver.lo: \
    u/t_server_interface_filegameserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_filegameserver.lo -c u/t_server_interface_filegameserver.cpp

u/t_server_interface_filegameserver.o: \
    u/t_server_interface_filegameserver.cpp
	@echo "        Compiling u/t_server_interface_filegameserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_filegameserver.o -c u/t_server_interface_filegameserver.cpp

u/t_server_interface_filegameserver.s: \
    u/t_server_interface_filegameserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_filegameserver.s -S u/t_server_interface_filegameserver.cpp

u/t_server_interface_format.lo: u/t_server_interface_format.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_format.lo -c u/t_server_interface_format.cpp

u/t_server_interface_format.o: u/t_server_interface_format.cpp
	@echo "        Compiling u/t_server_interface_format.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_format.o -c u/t_server_interface_format.cpp

u/t_server_interface_format.s: u/t_server_interface_format.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_format.s -S u/t_server_interface_format.cpp

u/t_server_interface_formatclient.lo: u/t_server_interface_formatclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_formatclient.lo -c u/t_server_interface_formatclient.cpp

u/t_server_interface_formatclient.o: u/t_server_interface_formatclient.cpp
	@echo "        Compiling u/t_server_interface_formatclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_formatclient.o -c u/t_server_interface_formatclient.cpp

u/t_server_interface_formatclient.s: u/t_server_interface_formatclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_formatclient.s -S u/t_server_interface_formatclient.cpp

u/t_server_interface_formatserver.lo: u/t_server_interface_formatserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_formatserver.lo -c u/t_server_interface_formatserver.cpp

u/t_server_interface_formatserver.o: u/t_server_interface_formatserver.cpp
	@echo "        Compiling u/t_server_interface_formatserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_formatserver.o -c u/t_server_interface_formatserver.cpp

u/t_server_interface_formatserver.s: u/t_server_interface_formatserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_formatserver.s -S u/t_server_interface_formatserver.cpp

u/t_server_interface_hostcron.lo: u/t_server_interface_hostcron.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostcron.lo -c u/t_server_interface_hostcron.cpp

u/t_server_interface_hostcron.o: u/t_server_interface_hostcron.cpp
	@echo "        Compiling u/t_server_interface_hostcron.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostcron.o -c u/t_server_interface_hostcron.cpp

u/t_server_interface_hostcron.s: u/t_server_interface_hostcron.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostcron.s -S u/t_server_interface_hostcron.cpp

u/t_server_interface_hostcronclient.lo: \
    u/t_server_interface_hostcronclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostcronclient.lo -c u/t_server_interface_hostcronclient.cpp

u/t_server_interface_hostcronclient.o: \
    u/t_server_interface_hostcronclient.cpp
	@echo "        Compiling u/t_server_interface_hostcronclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostcronclient.o -c u/t_server_interface_hostcronclient.cpp

u/t_server_interface_hostcronclient.s: \
    u/t_server_interface_hostcronclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostcronclient.s -S u/t_server_interface_hostcronclient.cpp

u/t_server_interface_hostcronserver.lo: \
    u/t_server_interface_hostcronserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostcronserver.lo -c u/t_server_interface_hostcronserver.cpp

u/t_server_interface_hostcronserver.o: \
    u/t_server_interface_hostcronserver.cpp
	@echo "        Compiling u/t_server_interface_hostcronserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostcronserver.o -c u/t_server_interface_hostcronserver.cpp

u/t_server_interface_hostcronserver.s: \
    u/t_server_interface_hostcronserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostcronserver.s -S u/t_server_interface_hostcronserver.cpp

u/t_server_interface_hostfile.lo: u/t_server_interface_hostfile.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostfile.lo -c u/t_server_interface_hostfile.cpp

u/t_server_interface_hostfile.o: u/t_server_interface_hostfile.cpp
	@echo "        Compiling u/t_server_interface_hostfile.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostfile.o -c u/t_server_interface_hostfile.cpp

u/t_server_interface_hostfile.s: u/t_server_interface_hostfile.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostfile.s -S u/t_server_interface_hostfile.cpp

u/t_server_interface_hostfileclient.lo: \
    u/t_server_interface_hostfileclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostfileclient.lo -c u/t_server_interface_hostfileclient.cpp

u/t_server_interface_hostfileclient.o: \
    u/t_server_interface_hostfileclient.cpp
	@echo "        Compiling u/t_server_interface_hostfileclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostfileclient.o -c u/t_server_interface_hostfileclient.cpp

u/t_server_interface_hostfileclient.s: \
    u/t_server_interface_hostfileclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostfileclient.s -S u/t_server_interface_hostfileclient.cpp

u/t_server_interface_hostfileserver.lo: \
    u/t_server_interface_hostfileserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostfileserver.lo -c u/t_server_interface_hostfileserver.cpp

u/t_server_interface_hostfileserver.o: \
    u/t_server_interface_hostfileserver.cpp
	@echo "        Compiling u/t_server_interface_hostfileserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostfileserver.o -c u/t_server_interface_hostfileserver.cpp

u/t_server_interface_hostfileserver.s: \
    u/t_server_interface_hostfileserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostfileserver.s -S u/t_server_interface_hostfileserver.cpp

u/t_server_interface_hostgame.lo: u/t_server_interface_hostgame.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostgame.lo -c u/t_server_interface_hostgame.cpp

u/t_server_interface_hostgame.o: u/t_server_interface_hostgame.cpp
	@echo "        Compiling u/t_server_interface_hostgame.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostgame.o -c u/t_server_interface_hostgame.cpp

u/t_server_interface_hostgame.s: u/t_server_interface_hostgame.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostgame.s -S u/t_server_interface_hostgame.cpp

u/t_server_interface_hostgameclient.lo: \
    u/t_server_interface_hostgameclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostgameclient.lo -c u/t_server_interface_hostgameclient.cpp

u/t_server_interface_hostgameclient.o: \
    u/t_server_interface_hostgameclient.cpp
	@echo "        Compiling u/t_server_interface_hostgameclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostgameclient.o -c u/t_server_interface_hostgameclient.cpp

u/t_server_interface_hostgameclient.s: \
    u/t_server_interface_hostgameclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostgameclient.s -S u/t_server_interface_hostgameclient.cpp

u/t_server_interface_hostgameserver.lo: \
    u/t_server_interface_hostgameserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostgameserver.lo -c u/t_server_interface_hostgameserver.cpp

u/t_server_interface_hostgameserver.o: \
    u/t_server_interface_hostgameserver.cpp
	@echo "        Compiling u/t_server_interface_hostgameserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostgameserver.o -c u/t_server_interface_hostgameserver.cpp

u/t_server_interface_hostgameserver.s: \
    u/t_server_interface_hostgameserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostgameserver.s -S u/t_server_interface_hostgameserver.cpp

u/t_server_interface_hostplayer.lo: u/t_server_interface_hostplayer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostplayer.lo -c u/t_server_interface_hostplayer.cpp

u/t_server_interface_hostplayer.o: u/t_server_interface_hostplayer.cpp
	@echo "        Compiling u/t_server_interface_hostplayer.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostplayer.o -c u/t_server_interface_hostplayer.cpp

u/t_server_interface_hostplayer.s: u/t_server_interface_hostplayer.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostplayer.s -S u/t_server_interface_hostplayer.cpp

u/t_server_interface_hostplayerclient.lo: \
    u/t_server_interface_hostplayerclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostplayerclient.lo -c u/t_server_interface_hostplayerclient.cpp

u/t_server_interface_hostplayerclient.o: \
    u/t_server_interface_hostplayerclient.cpp
	@echo "        Compiling u/t_server_interface_hostplayerclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostplayerclient.o -c u/t_server_interface_hostplayerclient.cpp

u/t_server_interface_hostplayerclient.s: \
    u/t_server_interface_hostplayerclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostplayerclient.s -S u/t_server_interface_hostplayerclient.cpp

u/t_server_interface_hostplayerserver.lo: \
    u/t_server_interface_hostplayerserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostplayerserver.lo -c u/t_server_interface_hostplayerserver.cpp

u/t_server_interface_hostplayerserver.o: \
    u/t_server_interface_hostplayerserver.cpp
	@echo "        Compiling u/t_server_interface_hostplayerserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostplayerserver.o -c u/t_server_interface_hostplayerserver.cpp

u/t_server_interface_hostplayerserver.s: \
    u/t_server_interface_hostplayerserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostplayerserver.s -S u/t_server_interface_hostplayerserver.cpp

u/t_server_interface_hostschedule.lo: u/t_server_interface_hostschedule.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostschedule.lo -c u/t_server_interface_hostschedule.cpp

u/t_server_interface_hostschedule.o: u/t_server_interface_hostschedule.cpp
	@echo "        Compiling u/t_server_interface_hostschedule.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostschedule.o -c u/t_server_interface_hostschedule.cpp

u/t_server_interface_hostschedule.s: u/t_server_interface_hostschedule.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostschedule.s -S u/t_server_interface_hostschedule.cpp

u/t_server_interface_hostscheduleclient.lo: \
    u/t_server_interface_hostscheduleclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostscheduleclient.lo -c u/t_server_interface_hostscheduleclient.cpp

u/t_server_interface_hostscheduleclient.o: \
    u/t_server_interface_hostscheduleclient.cpp
	@echo "        Compiling u/t_server_interface_hostscheduleclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostscheduleclient.o -c u/t_server_interface_hostscheduleclient.cpp

u/t_server_interface_hostscheduleclient.s: \
    u/t_server_interface_hostscheduleclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostscheduleclient.s -S u/t_server_interface_hostscheduleclient.cpp

u/t_server_interface_hostscheduleserver.lo: \
    u/t_server_interface_hostscheduleserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostscheduleserver.lo -c u/t_server_interface_hostscheduleserver.cpp

u/t_server_interface_hostscheduleserver.o: \
    u/t_server_interface_hostscheduleserver.cpp
	@echo "        Compiling u/t_server_interface_hostscheduleserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostscheduleserver.o -c u/t_server_interface_hostscheduleserver.cpp

u/t_server_interface_hostscheduleserver.s: \
    u/t_server_interface_hostscheduleserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostscheduleserver.s -S u/t_server_interface_hostscheduleserver.cpp

u/t_server_interface_hosttool.lo: u/t_server_interface_hosttool.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hosttool.lo -c u/t_server_interface_hosttool.cpp

u/t_server_interface_hosttool.o: u/t_server_interface_hosttool.cpp
	@echo "        Compiling u/t_server_interface_hosttool.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hosttool.o -c u/t_server_interface_hosttool.cpp

u/t_server_interface_hosttool.s: u/t_server_interface_hosttool.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hosttool.s -S u/t_server_interface_hosttool.cpp

u/t_server_interface_hosttoolclient.lo: \
    u/t_server_interface_hosttoolclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hosttoolclient.lo -c u/t_server_interface_hosttoolclient.cpp

u/t_server_interface_hosttoolclient.o: \
    u/t_server_interface_hosttoolclient.cpp
	@echo "        Compiling u/t_server_interface_hosttoolclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hosttoolclient.o -c u/t_server_interface_hosttoolclient.cpp

u/t_server_interface_hosttoolclient.s: \
    u/t_server_interface_hosttoolclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hosttoolclient.s -S u/t_server_interface_hosttoolclient.cpp

u/t_server_interface_hosttoolserver.lo: \
    u/t_server_interface_hosttoolserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hosttoolserver.lo -c u/t_server_interface_hosttoolserver.cpp

u/t_server_interface_hosttoolserver.o: \
    u/t_server_interface_hosttoolserver.cpp
	@echo "        Compiling u/t_server_interface_hosttoolserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hosttoolserver.o -c u/t_server_interface_hosttoolserver.cpp

u/t_server_interface_hosttoolserver.s: \
    u/t_server_interface_hosttoolserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hosttoolserver.s -S u/t_server_interface_hosttoolserver.cpp

u/t_server_interface_hostturn.lo: u/t_server_interface_hostturn.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostturn.lo -c u/t_server_interface_hostturn.cpp

u/t_server_interface_hostturn.o: u/t_server_interface_hostturn.cpp
	@echo "        Compiling u/t_server_interface_hostturn.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostturn.o -c u/t_server_interface_hostturn.cpp

u/t_server_interface_hostturn.s: u/t_server_interface_hostturn.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostturn.s -S u/t_server_interface_hostturn.cpp

u/t_server_interface_hostturnclient.lo: \
    u/t_server_interface_hostturnclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostturnclient.lo -c u/t_server_interface_hostturnclient.cpp

u/t_server_interface_hostturnclient.o: \
    u/t_server_interface_hostturnclient.cpp
	@echo "        Compiling u/t_server_interface_hostturnclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostturnclient.o -c u/t_server_interface_hostturnclient.cpp

u/t_server_interface_hostturnclient.s: \
    u/t_server_interface_hostturnclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostturnclient.s -S u/t_server_interface_hostturnclient.cpp

u/t_server_interface_hostturnserver.lo: \
    u/t_server_interface_hostturnserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostturnserver.lo -c u/t_server_interface_hostturnserver.cpp

u/t_server_interface_hostturnserver.o: \
    u/t_server_interface_hostturnserver.cpp
	@echo "        Compiling u/t_server_interface_hostturnserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostturnserver.o -c u/t_server_interface_hostturnserver.cpp

u/t_server_interface_hostturnserver.s: \
    u/t_server_interface_hostturnserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_hostturnserver.s -S u/t_server_interface_hostturnserver.cpp

u/t_server_interface_mailqueue.lo: u/t_server_interface_mailqueue.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_mailqueue.lo -c u/t_server_interface_mailqueue.cpp

u/t_server_interface_mailqueue.o: u/t_server_interface_mailqueue.cpp
	@echo "        Compiling u/t_server_interface_mailqueue.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_mailqueue.o -c u/t_server_interface_mailqueue.cpp

u/t_server_interface_mailqueue.s: u/t_server_interface_mailqueue.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_mailqueue.s -S u/t_server_interface_mailqueue.cpp

u/t_server_interface_mailqueueclient.lo: \
    u/t_server_interface_mailqueueclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_mailqueueclient.lo -c u/t_server_interface_mailqueueclient.cpp

u/t_server_interface_mailqueueclient.o: \
    u/t_server_interface_mailqueueclient.cpp
	@echo "        Compiling u/t_server_interface_mailqueueclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_mailqueueclient.o -c u/t_server_interface_mailqueueclient.cpp

u/t_server_interface_mailqueueclient.s: \
    u/t_server_interface_mailqueueclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_mailqueueclient.s -S u/t_server_interface_mailqueueclient.cpp

u/t_server_interface_mailqueueserver.lo: \
    u/t_server_interface_mailqueueserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_mailqueueserver.lo -c u/t_server_interface_mailqueueserver.cpp

u/t_server_interface_mailqueueserver.o: \
    u/t_server_interface_mailqueueserver.cpp
	@echo "        Compiling u/t_server_interface_mailqueueserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_mailqueueserver.o -c u/t_server_interface_mailqueueserver.cpp

u/t_server_interface_mailqueueserver.s: \
    u/t_server_interface_mailqueueserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_mailqueueserver.s -S u/t_server_interface_mailqueueserver.cpp

u/t_server_interface_sessionrouter.lo: \
    u/t_server_interface_sessionrouter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_sessionrouter.lo -c u/t_server_interface_sessionrouter.cpp

u/t_server_interface_sessionrouter.o: u/t_server_interface_sessionrouter.cpp
	@echo "        Compiling u/t_server_interface_sessionrouter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_sessionrouter.o -c u/t_server_interface_sessionrouter.cpp

u/t_server_interface_sessionrouter.s: u/t_server_interface_sessionrouter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_sessionrouter.s -S u/t_server_interface_sessionrouter.cpp

u/t_server_interface_talkfolder.lo: u/t_server_interface_talkfolder.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkfolder.lo -c u/t_server_interface_talkfolder.cpp

u/t_server_interface_talkfolder.o: u/t_server_interface_talkfolder.cpp
	@echo "        Compiling u/t_server_interface_talkfolder.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkfolder.o -c u/t_server_interface_talkfolder.cpp

u/t_server_interface_talkfolder.s: u/t_server_interface_talkfolder.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkfolder.s -S u/t_server_interface_talkfolder.cpp

u/t_server_interface_talkfolderclient.lo: \
    u/t_server_interface_talkfolderclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkfolderclient.lo -c u/t_server_interface_talkfolderclient.cpp

u/t_server_interface_talkfolderclient.o: \
    u/t_server_interface_talkfolderclient.cpp
	@echo "        Compiling u/t_server_interface_talkfolderclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkfolderclient.o -c u/t_server_interface_talkfolderclient.cpp

u/t_server_interface_talkfolderclient.s: \
    u/t_server_interface_talkfolderclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkfolderclient.s -S u/t_server_interface_talkfolderclient.cpp

u/t_server_interface_talkfolderserver.lo: \
    u/t_server_interface_talkfolderserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkfolderserver.lo -c u/t_server_interface_talkfolderserver.cpp

u/t_server_interface_talkfolderserver.o: \
    u/t_server_interface_talkfolderserver.cpp
	@echo "        Compiling u/t_server_interface_talkfolderserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkfolderserver.o -c u/t_server_interface_talkfolderserver.cpp

u/t_server_interface_talkfolderserver.s: \
    u/t_server_interface_talkfolderserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkfolderserver.s -S u/t_server_interface_talkfolderserver.cpp

u/t_server_interface_talkforum.lo: u/t_server_interface_talkforum.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkforum.lo -c u/t_server_interface_talkforum.cpp

u/t_server_interface_talkforum.o: u/t_server_interface_talkforum.cpp
	@echo "        Compiling u/t_server_interface_talkforum.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkforum.o -c u/t_server_interface_talkforum.cpp

u/t_server_interface_talkforum.s: u/t_server_interface_talkforum.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkforum.s -S u/t_server_interface_talkforum.cpp

u/t_server_interface_talkforumclient.lo: \
    u/t_server_interface_talkforumclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkforumclient.lo -c u/t_server_interface_talkforumclient.cpp

u/t_server_interface_talkforumclient.o: \
    u/t_server_interface_talkforumclient.cpp
	@echo "        Compiling u/t_server_interface_talkforumclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkforumclient.o -c u/t_server_interface_talkforumclient.cpp

u/t_server_interface_talkforumclient.s: \
    u/t_server_interface_talkforumclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkforumclient.s -S u/t_server_interface_talkforumclient.cpp

u/t_server_interface_talkforumserver.lo: \
    u/t_server_interface_talkforumserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkforumserver.lo -c u/t_server_interface_talkforumserver.cpp

u/t_server_interface_talkforumserver.o: \
    u/t_server_interface_talkforumserver.cpp
	@echo "        Compiling u/t_server_interface_talkforumserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkforumserver.o -c u/t_server_interface_talkforumserver.cpp

u/t_server_interface_talkforumserver.s: \
    u/t_server_interface_talkforumserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkforumserver.s -S u/t_server_interface_talkforumserver.cpp

u/t_server_interface_talkgroup.lo: u/t_server_interface_talkgroup.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkgroup.lo -c u/t_server_interface_talkgroup.cpp

u/t_server_interface_talkgroup.o: u/t_server_interface_talkgroup.cpp
	@echo "        Compiling u/t_server_interface_talkgroup.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkgroup.o -c u/t_server_interface_talkgroup.cpp

u/t_server_interface_talkgroup.s: u/t_server_interface_talkgroup.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkgroup.s -S u/t_server_interface_talkgroup.cpp

u/t_server_interface_talkgroupclient.lo: \
    u/t_server_interface_talkgroupclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkgroupclient.lo -c u/t_server_interface_talkgroupclient.cpp

u/t_server_interface_talkgroupclient.o: \
    u/t_server_interface_talkgroupclient.cpp
	@echo "        Compiling u/t_server_interface_talkgroupclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkgroupclient.o -c u/t_server_interface_talkgroupclient.cpp

u/t_server_interface_talkgroupclient.s: \
    u/t_server_interface_talkgroupclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkgroupclient.s -S u/t_server_interface_talkgroupclient.cpp

u/t_server_interface_talkgroupserver.lo: \
    u/t_server_interface_talkgroupserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkgroupserver.lo -c u/t_server_interface_talkgroupserver.cpp

u/t_server_interface_talkgroupserver.o: \
    u/t_server_interface_talkgroupserver.cpp
	@echo "        Compiling u/t_server_interface_talkgroupserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkgroupserver.o -c u/t_server_interface_talkgroupserver.cpp

u/t_server_interface_talkgroupserver.s: \
    u/t_server_interface_talkgroupserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkgroupserver.s -S u/t_server_interface_talkgroupserver.cpp

u/t_server_interface_talknntp.lo: u/t_server_interface_talknntp.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talknntp.lo -c u/t_server_interface_talknntp.cpp

u/t_server_interface_talknntp.o: u/t_server_interface_talknntp.cpp
	@echo "        Compiling u/t_server_interface_talknntp.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talknntp.o -c u/t_server_interface_talknntp.cpp

u/t_server_interface_talknntp.s: u/t_server_interface_talknntp.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talknntp.s -S u/t_server_interface_talknntp.cpp

u/t_server_interface_talknntpclient.lo: \
    u/t_server_interface_talknntpclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talknntpclient.lo -c u/t_server_interface_talknntpclient.cpp

u/t_server_interface_talknntpclient.o: \
    u/t_server_interface_talknntpclient.cpp
	@echo "        Compiling u/t_server_interface_talknntpclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talknntpclient.o -c u/t_server_interface_talknntpclient.cpp

u/t_server_interface_talknntpclient.s: \
    u/t_server_interface_talknntpclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talknntpclient.s -S u/t_server_interface_talknntpclient.cpp

u/t_server_interface_talknntpserver.lo: \
    u/t_server_interface_talknntpserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talknntpserver.lo -c u/t_server_interface_talknntpserver.cpp

u/t_server_interface_talknntpserver.o: \
    u/t_server_interface_talknntpserver.cpp
	@echo "        Compiling u/t_server_interface_talknntpserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talknntpserver.o -c u/t_server_interface_talknntpserver.cpp

u/t_server_interface_talknntpserver.s: \
    u/t_server_interface_talknntpserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talknntpserver.s -S u/t_server_interface_talknntpserver.cpp

u/t_server_interface_talkpm.lo: u/t_server_interface_talkpm.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkpm.lo -c u/t_server_interface_talkpm.cpp

u/t_server_interface_talkpm.o: u/t_server_interface_talkpm.cpp
	@echo "        Compiling u/t_server_interface_talkpm.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkpm.o -c u/t_server_interface_talkpm.cpp

u/t_server_interface_talkpm.s: u/t_server_interface_talkpm.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkpm.s -S u/t_server_interface_talkpm.cpp

u/t_server_interface_talkpmclient.lo: u/t_server_interface_talkpmclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkpmclient.lo -c u/t_server_interface_talkpmclient.cpp

u/t_server_interface_talkpmclient.o: u/t_server_interface_talkpmclient.cpp
	@echo "        Compiling u/t_server_interface_talkpmclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkpmclient.o -c u/t_server_interface_talkpmclient.cpp

u/t_server_interface_talkpmclient.s: u/t_server_interface_talkpmclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkpmclient.s -S u/t_server_interface_talkpmclient.cpp

u/t_server_interface_talkpmserver.lo: u/t_server_interface_talkpmserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkpmserver.lo -c u/t_server_interface_talkpmserver.cpp

u/t_server_interface_talkpmserver.o: u/t_server_interface_talkpmserver.cpp
	@echo "        Compiling u/t_server_interface_talkpmserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkpmserver.o -c u/t_server_interface_talkpmserver.cpp

u/t_server_interface_talkpmserver.s: u/t_server_interface_talkpmserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkpmserver.s -S u/t_server_interface_talkpmserver.cpp

u/t_server_interface_talkpost.lo: u/t_server_interface_talkpost.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkpost.lo -c u/t_server_interface_talkpost.cpp

u/t_server_interface_talkpost.o: u/t_server_interface_talkpost.cpp
	@echo "        Compiling u/t_server_interface_talkpost.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkpost.o -c u/t_server_interface_talkpost.cpp

u/t_server_interface_talkpost.s: u/t_server_interface_talkpost.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkpost.s -S u/t_server_interface_talkpost.cpp

u/t_server_interface_talkpostclient.lo: \
    u/t_server_interface_talkpostclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkpostclient.lo -c u/t_server_interface_talkpostclient.cpp

u/t_server_interface_talkpostclient.o: \
    u/t_server_interface_talkpostclient.cpp
	@echo "        Compiling u/t_server_interface_talkpostclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkpostclient.o -c u/t_server_interface_talkpostclient.cpp

u/t_server_interface_talkpostclient.s: \
    u/t_server_interface_talkpostclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkpostclient.s -S u/t_server_interface_talkpostclient.cpp

u/t_server_interface_talkpostserver.lo: \
    u/t_server_interface_talkpostserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkpostserver.lo -c u/t_server_interface_talkpostserver.cpp

u/t_server_interface_talkpostserver.o: \
    u/t_server_interface_talkpostserver.cpp
	@echo "        Compiling u/t_server_interface_talkpostserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkpostserver.o -c u/t_server_interface_talkpostserver.cpp

u/t_server_interface_talkpostserver.s: \
    u/t_server_interface_talkpostserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkpostserver.s -S u/t_server_interface_talkpostserver.cpp

u/t_server_interface_talkrender.lo: u/t_server_interface_talkrender.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkrender.lo -c u/t_server_interface_talkrender.cpp

u/t_server_interface_talkrender.o: u/t_server_interface_talkrender.cpp
	@echo "        Compiling u/t_server_interface_talkrender.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkrender.o -c u/t_server_interface_talkrender.cpp

u/t_server_interface_talkrender.s: u/t_server_interface_talkrender.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkrender.s -S u/t_server_interface_talkrender.cpp

u/t_server_interface_talkrenderclient.lo: \
    u/t_server_interface_talkrenderclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkrenderclient.lo -c u/t_server_interface_talkrenderclient.cpp

u/t_server_interface_talkrenderclient.o: \
    u/t_server_interface_talkrenderclient.cpp
	@echo "        Compiling u/t_server_interface_talkrenderclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkrenderclient.o -c u/t_server_interface_talkrenderclient.cpp

u/t_server_interface_talkrenderclient.s: \
    u/t_server_interface_talkrenderclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkrenderclient.s -S u/t_server_interface_talkrenderclient.cpp

u/t_server_interface_talkrenderserver.lo: \
    u/t_server_interface_talkrenderserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkrenderserver.lo -c u/t_server_interface_talkrenderserver.cpp

u/t_server_interface_talkrenderserver.o: \
    u/t_server_interface_talkrenderserver.cpp
	@echo "        Compiling u/t_server_interface_talkrenderserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkrenderserver.o -c u/t_server_interface_talkrenderserver.cpp

u/t_server_interface_talkrenderserver.s: \
    u/t_server_interface_talkrenderserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkrenderserver.s -S u/t_server_interface_talkrenderserver.cpp

u/t_server_interface_talksyntax.lo: u/t_server_interface_talksyntax.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talksyntax.lo -c u/t_server_interface_talksyntax.cpp

u/t_server_interface_talksyntax.o: u/t_server_interface_talksyntax.cpp
	@echo "        Compiling u/t_server_interface_talksyntax.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talksyntax.o -c u/t_server_interface_talksyntax.cpp

u/t_server_interface_talksyntax.s: u/t_server_interface_talksyntax.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talksyntax.s -S u/t_server_interface_talksyntax.cpp

u/t_server_interface_talksyntaxclient.lo: \
    u/t_server_interface_talksyntaxclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talksyntaxclient.lo -c u/t_server_interface_talksyntaxclient.cpp

u/t_server_interface_talksyntaxclient.o: \
    u/t_server_interface_talksyntaxclient.cpp
	@echo "        Compiling u/t_server_interface_talksyntaxclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talksyntaxclient.o -c u/t_server_interface_talksyntaxclient.cpp

u/t_server_interface_talksyntaxclient.s: \
    u/t_server_interface_talksyntaxclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talksyntaxclient.s -S u/t_server_interface_talksyntaxclient.cpp

u/t_server_interface_talksyntaxserver.lo: \
    u/t_server_interface_talksyntaxserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talksyntaxserver.lo -c u/t_server_interface_talksyntaxserver.cpp

u/t_server_interface_talksyntaxserver.o: \
    u/t_server_interface_talksyntaxserver.cpp
	@echo "        Compiling u/t_server_interface_talksyntaxserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talksyntaxserver.o -c u/t_server_interface_talksyntaxserver.cpp

u/t_server_interface_talksyntaxserver.s: \
    u/t_server_interface_talksyntaxserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talksyntaxserver.s -S u/t_server_interface_talksyntaxserver.cpp

u/t_server_interface_talkthread.lo: u/t_server_interface_talkthread.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkthread.lo -c u/t_server_interface_talkthread.cpp

u/t_server_interface_talkthread.o: u/t_server_interface_talkthread.cpp
	@echo "        Compiling u/t_server_interface_talkthread.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkthread.o -c u/t_server_interface_talkthread.cpp

u/t_server_interface_talkthread.s: u/t_server_interface_talkthread.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkthread.s -S u/t_server_interface_talkthread.cpp

u/t_server_interface_talkthreadclient.lo: \
    u/t_server_interface_talkthreadclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkthreadclient.lo -c u/t_server_interface_talkthreadclient.cpp

u/t_server_interface_talkthreadclient.o: \
    u/t_server_interface_talkthreadclient.cpp
	@echo "        Compiling u/t_server_interface_talkthreadclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkthreadclient.o -c u/t_server_interface_talkthreadclient.cpp

u/t_server_interface_talkthreadclient.s: \
    u/t_server_interface_talkthreadclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkthreadclient.s -S u/t_server_interface_talkthreadclient.cpp

u/t_server_interface_talkthreadserver.lo: \
    u/t_server_interface_talkthreadserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkthreadserver.lo -c u/t_server_interface_talkthreadserver.cpp

u/t_server_interface_talkthreadserver.o: \
    u/t_server_interface_talkthreadserver.cpp
	@echo "        Compiling u/t_server_interface_talkthreadserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkthreadserver.o -c u/t_server_interface_talkthreadserver.cpp

u/t_server_interface_talkthreadserver.s: \
    u/t_server_interface_talkthreadserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkthreadserver.s -S u/t_server_interface_talkthreadserver.cpp

u/t_server_interface_talkuser.lo: u/t_server_interface_talkuser.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkuser.lo -c u/t_server_interface_talkuser.cpp

u/t_server_interface_talkuser.o: u/t_server_interface_talkuser.cpp
	@echo "        Compiling u/t_server_interface_talkuser.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkuser.o -c u/t_server_interface_talkuser.cpp

u/t_server_interface_talkuser.s: u/t_server_interface_talkuser.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkuser.s -S u/t_server_interface_talkuser.cpp

u/t_server_interface_talkuserclient.lo: \
    u/t_server_interface_talkuserclient.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkuserclient.lo -c u/t_server_interface_talkuserclient.cpp

u/t_server_interface_talkuserclient.o: \
    u/t_server_interface_talkuserclient.cpp
	@echo "        Compiling u/t_server_interface_talkuserclient.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkuserclient.o -c u/t_server_interface_talkuserclient.cpp

u/t_server_interface_talkuserclient.s: \
    u/t_server_interface_talkuserclient.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkuserclient.s -S u/t_server_interface_talkuserclient.cpp

u/t_server_interface_talkuserserver.lo: \
    u/t_server_interface_talkuserserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkuserserver.lo -c u/t_server_interface_talkuserserver.cpp

u/t_server_interface_talkuserserver.o: \
    u/t_server_interface_talkuserserver.cpp
	@echo "        Compiling u/t_server_interface_talkuserserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkuserserver.o -c u/t_server_interface_talkuserserver.cpp

u/t_server_interface_talkuserserver.s: \
    u/t_server_interface_talkuserserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_interface_talkuserserver.s -S u/t_server_interface_talkuserserver.cpp

u/t_server_mailin_mailinapplication.lo: \
    u/t_server_mailin_mailinapplication.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailin_mailinapplication.lo -c u/t_server_mailin_mailinapplication.cpp

u/t_server_mailin_mailinapplication.o: \
    u/t_server_mailin_mailinapplication.cpp
	@echo "        Compiling u/t_server_mailin_mailinapplication.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailin_mailinapplication.o -c u/t_server_mailin_mailinapplication.cpp

u/t_server_mailin_mailinapplication.s: \
    u/t_server_mailin_mailinapplication.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailin_mailinapplication.s -S u/t_server_mailin_mailinapplication.cpp

u/t_server_mailin_mailprocessor.lo: u/t_server_mailin_mailprocessor.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailin_mailprocessor.lo -c u/t_server_mailin_mailprocessor.cpp

u/t_server_mailin_mailprocessor.o: u/t_server_mailin_mailprocessor.cpp
	@echo "        Compiling u/t_server_mailin_mailprocessor.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailin_mailprocessor.o -c u/t_server_mailin_mailprocessor.cpp

u/t_server_mailin_mailprocessor.s: u/t_server_mailin_mailprocessor.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailin_mailprocessor.s -S u/t_server_mailin_mailprocessor.cpp

u/t_server_mailout_commandhandler.lo: u/t_server_mailout_commandhandler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_commandhandler.lo -c u/t_server_mailout_commandhandler.cpp

u/t_server_mailout_commandhandler.o: u/t_server_mailout_commandhandler.cpp
	@echo "        Compiling u/t_server_mailout_commandhandler.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_commandhandler.o -c u/t_server_mailout_commandhandler.cpp

u/t_server_mailout_commandhandler.s: u/t_server_mailout_commandhandler.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_commandhandler.s -S u/t_server_mailout_commandhandler.cpp

u/t_server_mailout_configuration.lo: u/t_server_mailout_configuration.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_configuration.lo -c u/t_server_mailout_configuration.cpp

u/t_server_mailout_configuration.o: u/t_server_mailout_configuration.cpp
	@echo "        Compiling u/t_server_mailout_configuration.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_configuration.o -c u/t_server_mailout_configuration.cpp

u/t_server_mailout_configuration.s: u/t_server_mailout_configuration.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_configuration.s -S u/t_server_mailout_configuration.cpp

u/t_server_mailout_mailqueue.lo: u/t_server_mailout_mailqueue.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_mailqueue.lo -c u/t_server_mailout_mailqueue.cpp

u/t_server_mailout_mailqueue.o: u/t_server_mailout_mailqueue.cpp
	@echo "        Compiling u/t_server_mailout_mailqueue.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_mailqueue.o -c u/t_server_mailout_mailqueue.cpp

u/t_server_mailout_mailqueue.s: u/t_server_mailout_mailqueue.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_mailqueue.s -S u/t_server_mailout_mailqueue.cpp

u/t_server_mailout_message.lo: u/t_server_mailout_message.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_message.lo -c u/t_server_mailout_message.cpp

u/t_server_mailout_message.o: u/t_server_mailout_message.cpp
	@echo "        Compiling u/t_server_mailout_message.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_message.o -c u/t_server_mailout_message.cpp

u/t_server_mailout_message.s: u/t_server_mailout_message.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_message.s -S u/t_server_mailout_message.cpp

u/t_server_mailout_root.lo: u/t_server_mailout_root.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_root.lo -c u/t_server_mailout_root.cpp

u/t_server_mailout_root.o: u/t_server_mailout_root.cpp
	@echo "        Compiling u/t_server_mailout_root.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_root.o -c u/t_server_mailout_root.cpp

u/t_server_mailout_root.s: u/t_server_mailout_root.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_root.s -S u/t_server_mailout_root.cpp

u/t_server_mailout_session.lo: u/t_server_mailout_session.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_session.lo -c u/t_server_mailout_session.cpp

u/t_server_mailout_session.o: u/t_server_mailout_session.cpp
	@echo "        Compiling u/t_server_mailout_session.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_session.o -c u/t_server_mailout_session.cpp

u/t_server_mailout_session.s: u/t_server_mailout_session.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_session.s -S u/t_server_mailout_session.cpp

u/t_server_mailout_template.lo: u/t_server_mailout_template.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_template.lo -c u/t_server_mailout_template.cpp

u/t_server_mailout_template.o: u/t_server_mailout_template.cpp
	@echo "        Compiling u/t_server_mailout_template.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_template.o -c u/t_server_mailout_template.cpp

u/t_server_mailout_template.s: u/t_server_mailout_template.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_template.s -S u/t_server_mailout_template.cpp

u/t_server_mailout_transmitter.lo: u/t_server_mailout_transmitter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_transmitter.lo -c u/t_server_mailout_transmitter.cpp

u/t_server_mailout_transmitter.o: u/t_server_mailout_transmitter.cpp
	@echo "        Compiling u/t_server_mailout_transmitter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_transmitter.o -c u/t_server_mailout_transmitter.cpp

u/t_server_mailout_transmitter.s: u/t_server_mailout_transmitter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_transmitter.s -S u/t_server_mailout_transmitter.cpp

u/t_server_mailout_transmitterimpl.lo: \
    u/t_server_mailout_transmitterimpl.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_transmitterimpl.lo -c u/t_server_mailout_transmitterimpl.cpp

u/t_server_mailout_transmitterimpl.o: u/t_server_mailout_transmitterimpl.cpp
	@echo "        Compiling u/t_server_mailout_transmitterimpl.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_transmitterimpl.o -c u/t_server_mailout_transmitterimpl.cpp

u/t_server_mailout_transmitterimpl.s: u/t_server_mailout_transmitterimpl.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_mailout_transmitterimpl.s -S u/t_server_mailout_transmitterimpl.cpp

u/t_server_monitor_badnessfileobserver.lo: \
    u/t_server_monitor_badnessfileobserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_monitor_badnessfileobserver.lo -c u/t_server_monitor_badnessfileobserver.cpp

u/t_server_monitor_badnessfileobserver.o: \
    u/t_server_monitor_badnessfileobserver.cpp
	@echo "        Compiling u/t_server_monitor_badnessfileobserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_monitor_badnessfileobserver.o -c u/t_server_monitor_badnessfileobserver.cpp

u/t_server_monitor_badnessfileobserver.s: \
    u/t_server_monitor_badnessfileobserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_monitor_badnessfileobserver.s -S u/t_server_monitor_badnessfileobserver.cpp

u/t_server_monitor_observer.lo: u/t_server_monitor_observer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_monitor_observer.lo -c u/t_server_monitor_observer.cpp

u/t_server_monitor_observer.o: u/t_server_monitor_observer.cpp
	@echo "        Compiling u/t_server_monitor_observer.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_monitor_observer.o -c u/t_server_monitor_observer.cpp

u/t_server_monitor_observer.s: u/t_server_monitor_observer.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_monitor_observer.s -S u/t_server_monitor_observer.cpp

u/t_server_monitor_status.lo: u/t_server_monitor_status.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_monitor_status.lo -c u/t_server_monitor_status.cpp

u/t_server_monitor_status.o: u/t_server_monitor_status.cpp
	@echo "        Compiling u/t_server_monitor_status.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_monitor_status.o -c u/t_server_monitor_status.cpp

u/t_server_monitor_status.s: u/t_server_monitor_status.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_monitor_status.s -S u/t_server_monitor_status.cpp

u/t_server_monitor_statusobserver.lo: u/t_server_monitor_statusobserver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_monitor_statusobserver.lo -c u/t_server_monitor_statusobserver.cpp

u/t_server_monitor_statusobserver.o: u/t_server_monitor_statusobserver.cpp
	@echo "        Compiling u/t_server_monitor_statusobserver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_monitor_statusobserver.o -c u/t_server_monitor_statusobserver.cpp

u/t_server_monitor_statusobserver.s: u/t_server_monitor_statusobserver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_monitor_statusobserver.s -S u/t_server_monitor_statusobserver.cpp

u/t_server_monitor_timeseries.lo: u/t_server_monitor_timeseries.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_monitor_timeseries.lo -c u/t_server_monitor_timeseries.cpp

u/t_server_monitor_timeseries.o: u/t_server_monitor_timeseries.cpp
	@echo "        Compiling u/t_server_monitor_timeseries.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_monitor_timeseries.o -c u/t_server_monitor_timeseries.cpp

u/t_server_monitor_timeseries.s: u/t_server_monitor_timeseries.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_monitor_timeseries.s -S u/t_server_monitor_timeseries.cpp

u/t_server_monitor_timeseriesloader.lo: \
    u/t_server_monitor_timeseriesloader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_monitor_timeseriesloader.lo -c u/t_server_monitor_timeseriesloader.cpp

u/t_server_monitor_timeseriesloader.o: \
    u/t_server_monitor_timeseriesloader.cpp
	@echo "        Compiling u/t_server_monitor_timeseriesloader.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_monitor_timeseriesloader.o -c u/t_server_monitor_timeseriesloader.cpp

u/t_server_monitor_timeseriesloader.s: \
    u/t_server_monitor_timeseriesloader.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_monitor_timeseriesloader.s -S u/t_server_monitor_timeseriesloader.cpp

u/t_server_monitor_timeserieswriter.lo: \
    u/t_server_monitor_timeserieswriter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_monitor_timeserieswriter.lo -c u/t_server_monitor_timeserieswriter.cpp

u/t_server_monitor_timeserieswriter.o: \
    u/t_server_monitor_timeserieswriter.cpp
	@echo "        Compiling u/t_server_monitor_timeserieswriter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_monitor_timeserieswriter.o -c u/t_server_monitor_timeserieswriter.cpp

u/t_server_monitor_timeserieswriter.s: \
    u/t_server_monitor_timeserieswriter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_monitor_timeserieswriter.s -S u/t_server_monitor_timeserieswriter.cpp

u/t_server_nntp_root.lo: u/t_server_nntp_root.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_nntp_root.lo -c u/t_server_nntp_root.cpp

u/t_server_nntp_root.o: u/t_server_nntp_root.cpp
	@echo "        Compiling u/t_server_nntp_root.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_nntp_root.o -c u/t_server_nntp_root.cpp

u/t_server_nntp_root.s: u/t_server_nntp_root.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_nntp_root.s -S u/t_server_nntp_root.cpp

u/t_server_talk_accesschecker.lo: u/t_server_talk_accesschecker.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_accesschecker.lo -c u/t_server_talk_accesschecker.cpp

u/t_server_talk_accesschecker.o: u/t_server_talk_accesschecker.cpp
	@echo "        Compiling u/t_server_talk_accesschecker.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_accesschecker.o -c u/t_server_talk_accesschecker.cpp

u/t_server_talk_accesschecker.s: u/t_server_talk_accesschecker.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_accesschecker.s -S u/t_server_talk_accesschecker.cpp

u/t_server_talk_commandhandler.lo: u/t_server_talk_commandhandler.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_commandhandler.lo -c u/t_server_talk_commandhandler.cpp

u/t_server_talk_commandhandler.o: u/t_server_talk_commandhandler.cpp
	@echo "        Compiling u/t_server_talk_commandhandler.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_commandhandler.o -c u/t_server_talk_commandhandler.cpp

u/t_server_talk_commandhandler.s: u/t_server_talk_commandhandler.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_commandhandler.s -S u/t_server_talk_commandhandler.cpp

u/t_server_talk_configuration.lo: u/t_server_talk_configuration.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_configuration.lo -c u/t_server_talk_configuration.cpp

u/t_server_talk_configuration.o: u/t_server_talk_configuration.cpp
	@echo "        Compiling u/t_server_talk_configuration.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_configuration.o -c u/t_server_talk_configuration.cpp

u/t_server_talk_configuration.s: u/t_server_talk_configuration.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_configuration.s -S u/t_server_talk_configuration.cpp

u/t_server_talk_forum.lo: u/t_server_talk_forum.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_forum.lo -c u/t_server_talk_forum.cpp

u/t_server_talk_forum.o: u/t_server_talk_forum.cpp
	@echo "        Compiling u/t_server_talk_forum.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_forum.o -c u/t_server_talk_forum.cpp

u/t_server_talk_forum.s: u/t_server_talk_forum.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_forum.s -S u/t_server_talk_forum.cpp

u/t_server_talk_group.lo: u/t_server_talk_group.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_group.lo -c u/t_server_talk_group.cpp

u/t_server_talk_group.o: u/t_server_talk_group.cpp
	@echo "        Compiling u/t_server_talk_group.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_group.o -c u/t_server_talk_group.cpp

u/t_server_talk_group.s: u/t_server_talk_group.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_group.s -S u/t_server_talk_group.cpp

u/t_server_talk_inlinerecognizer.lo: u/t_server_talk_inlinerecognizer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_inlinerecognizer.lo -c u/t_server_talk_inlinerecognizer.cpp

u/t_server_talk_inlinerecognizer.o: u/t_server_talk_inlinerecognizer.cpp
	@echo "        Compiling u/t_server_talk_inlinerecognizer.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_inlinerecognizer.o -c u/t_server_talk_inlinerecognizer.cpp

u/t_server_talk_inlinerecognizer.s: u/t_server_talk_inlinerecognizer.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_inlinerecognizer.s -S u/t_server_talk_inlinerecognizer.cpp

u/t_server_talk_linkformatter.lo: u/t_server_talk_linkformatter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_linkformatter.lo -c u/t_server_talk_linkformatter.cpp

u/t_server_talk_linkformatter.o: u/t_server_talk_linkformatter.cpp
	@echo "        Compiling u/t_server_talk_linkformatter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_linkformatter.o -c u/t_server_talk_linkformatter.cpp

u/t_server_talk_linkformatter.s: u/t_server_talk_linkformatter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_linkformatter.s -S u/t_server_talk_linkformatter.cpp

u/t_server_talk_message.lo: u/t_server_talk_message.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_message.lo -c u/t_server_talk_message.cpp

u/t_server_talk_message.o: u/t_server_talk_message.cpp
	@echo "        Compiling u/t_server_talk_message.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_message.o -c u/t_server_talk_message.cpp

u/t_server_talk_message.s: u/t_server_talk_message.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_message.s -S u/t_server_talk_message.cpp

u/t_server_talk_newsrc.lo: u/t_server_talk_newsrc.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_newsrc.lo -c u/t_server_talk_newsrc.cpp

u/t_server_talk_newsrc.o: u/t_server_talk_newsrc.cpp
	@echo "        Compiling u/t_server_talk_newsrc.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_newsrc.o -c u/t_server_talk_newsrc.cpp

u/t_server_talk_newsrc.s: u/t_server_talk_newsrc.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_newsrc.s -S u/t_server_talk_newsrc.cpp

u/t_server_talk_parse_bblexer.lo: u/t_server_talk_parse_bblexer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_parse_bblexer.lo -c u/t_server_talk_parse_bblexer.cpp

u/t_server_talk_parse_bblexer.o: u/t_server_talk_parse_bblexer.cpp
	@echo "        Compiling u/t_server_talk_parse_bblexer.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_parse_bblexer.o -c u/t_server_talk_parse_bblexer.cpp

u/t_server_talk_parse_bblexer.s: u/t_server_talk_parse_bblexer.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_parse_bblexer.s -S u/t_server_talk_parse_bblexer.cpp

u/t_server_talk_parse_bbparser.lo: u/t_server_talk_parse_bbparser.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_parse_bbparser.lo -c u/t_server_talk_parse_bbparser.cpp

u/t_server_talk_parse_bbparser.o: u/t_server_talk_parse_bbparser.cpp
	@echo "        Compiling u/t_server_talk_parse_bbparser.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_parse_bbparser.o -c u/t_server_talk_parse_bbparser.cpp

u/t_server_talk_parse_bbparser.s: u/t_server_talk_parse_bbparser.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_parse_bbparser.s -S u/t_server_talk_parse_bbparser.cpp

u/t_server_talk_render_bbrenderer.lo: u/t_server_talk_render_bbrenderer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_render_bbrenderer.lo -c u/t_server_talk_render_bbrenderer.cpp

u/t_server_talk_render_bbrenderer.o: u/t_server_talk_render_bbrenderer.cpp
	@echo "        Compiling u/t_server_talk_render_bbrenderer.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_render_bbrenderer.o -c u/t_server_talk_render_bbrenderer.cpp

u/t_server_talk_render_bbrenderer.s: u/t_server_talk_render_bbrenderer.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_render_bbrenderer.s -S u/t_server_talk_render_bbrenderer.cpp

u/t_server_talk_render_context.lo: u/t_server_talk_render_context.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_render_context.lo -c u/t_server_talk_render_context.cpp

u/t_server_talk_render_context.o: u/t_server_talk_render_context.cpp
	@echo "        Compiling u/t_server_talk_render_context.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_render_context.o -c u/t_server_talk_render_context.cpp

u/t_server_talk_render_context.s: u/t_server_talk_render_context.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_render_context.s -S u/t_server_talk_render_context.cpp

u/t_server_talk_render_htmlrenderer.lo: \
    u/t_server_talk_render_htmlrenderer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_render_htmlrenderer.lo -c u/t_server_talk_render_htmlrenderer.cpp

u/t_server_talk_render_htmlrenderer.o: \
    u/t_server_talk_render_htmlrenderer.cpp
	@echo "        Compiling u/t_server_talk_render_htmlrenderer.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_render_htmlrenderer.o -c u/t_server_talk_render_htmlrenderer.cpp

u/t_server_talk_render_htmlrenderer.s: \
    u/t_server_talk_render_htmlrenderer.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_render_htmlrenderer.s -S u/t_server_talk_render_htmlrenderer.cpp

u/t_server_talk_render_options.lo: u/t_server_talk_render_options.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_render_options.lo -c u/t_server_talk_render_options.cpp

u/t_server_talk_render_options.o: u/t_server_talk_render_options.cpp
	@echo "        Compiling u/t_server_talk_render_options.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_render_options.o -c u/t_server_talk_render_options.cpp

u/t_server_talk_render_options.s: u/t_server_talk_render_options.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_render_options.s -S u/t_server_talk_render_options.cpp

u/t_server_talk_root.lo: u/t_server_talk_root.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_root.lo -c u/t_server_talk_root.cpp

u/t_server_talk_root.o: u/t_server_talk_root.cpp
	@echo "        Compiling u/t_server_talk_root.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_root.o -c u/t_server_talk_root.cpp

u/t_server_talk_root.s: u/t_server_talk_root.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_root.s -S u/t_server_talk_root.cpp

u/t_server_talk_session.lo: u/t_server_talk_session.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_session.lo -c u/t_server_talk_session.cpp

u/t_server_talk_session.o: u/t_server_talk_session.cpp
	@echo "        Compiling u/t_server_talk_session.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_session.o -c u/t_server_talk_session.cpp

u/t_server_talk_session.s: u/t_server_talk_session.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_session.s -S u/t_server_talk_session.cpp

u/t_server_talk_sorter.lo: u/t_server_talk_sorter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_sorter.lo -c u/t_server_talk_sorter.cpp

u/t_server_talk_sorter.o: u/t_server_talk_sorter.cpp
	@echo "        Compiling u/t_server_talk_sorter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_sorter.o -c u/t_server_talk_sorter.cpp

u/t_server_talk_sorter.s: u/t_server_talk_sorter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_sorter.s -S u/t_server_talk_sorter.cpp

u/t_server_talk_spam.lo: u/t_server_talk_spam.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_spam.lo -c u/t_server_talk_spam.cpp

u/t_server_talk_spam.o: u/t_server_talk_spam.cpp
	@echo "        Compiling u/t_server_talk_spam.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_spam.o -c u/t_server_talk_spam.cpp

u/t_server_talk_spam.s: u/t_server_talk_spam.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_spam.s -S u/t_server_talk_spam.cpp

u/t_server_talk_talkfolder.lo: u/t_server_talk_talkfolder.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkfolder.lo -c u/t_server_talk_talkfolder.cpp

u/t_server_talk_talkfolder.o: u/t_server_talk_talkfolder.cpp
	@echo "        Compiling u/t_server_talk_talkfolder.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkfolder.o -c u/t_server_talk_talkfolder.cpp

u/t_server_talk_talkfolder.s: u/t_server_talk_talkfolder.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkfolder.s -S u/t_server_talk_talkfolder.cpp

u/t_server_talk_talkforum.lo: u/t_server_talk_talkforum.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkforum.lo -c u/t_server_talk_talkforum.cpp

u/t_server_talk_talkforum.o: u/t_server_talk_talkforum.cpp
	@echo "        Compiling u/t_server_talk_talkforum.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkforum.o -c u/t_server_talk_talkforum.cpp

u/t_server_talk_talkforum.s: u/t_server_talk_talkforum.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkforum.s -S u/t_server_talk_talkforum.cpp

u/t_server_talk_talkgroup.lo: u/t_server_talk_talkgroup.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkgroup.lo -c u/t_server_talk_talkgroup.cpp

u/t_server_talk_talkgroup.o: u/t_server_talk_talkgroup.cpp
	@echo "        Compiling u/t_server_talk_talkgroup.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkgroup.o -c u/t_server_talk_talkgroup.cpp

u/t_server_talk_talkgroup.s: u/t_server_talk_talkgroup.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkgroup.s -S u/t_server_talk_talkgroup.cpp

u/t_server_talk_talknntp.lo: u/t_server_talk_talknntp.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talknntp.lo -c u/t_server_talk_talknntp.cpp

u/t_server_talk_talknntp.o: u/t_server_talk_talknntp.cpp
	@echo "        Compiling u/t_server_talk_talknntp.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talknntp.o -c u/t_server_talk_talknntp.cpp

u/t_server_talk_talknntp.s: u/t_server_talk_talknntp.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talknntp.s -S u/t_server_talk_talknntp.cpp

u/t_server_talk_talkpm.lo: u/t_server_talk_talkpm.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkpm.lo -c u/t_server_talk_talkpm.cpp

u/t_server_talk_talkpm.o: u/t_server_talk_talkpm.cpp
	@echo "        Compiling u/t_server_talk_talkpm.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkpm.o -c u/t_server_talk_talkpm.cpp

u/t_server_talk_talkpm.s: u/t_server_talk_talkpm.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkpm.s -S u/t_server_talk_talkpm.cpp

u/t_server_talk_talkpost.lo: u/t_server_talk_talkpost.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkpost.lo -c u/t_server_talk_talkpost.cpp

u/t_server_talk_talkpost.o: u/t_server_talk_talkpost.cpp
	@echo "        Compiling u/t_server_talk_talkpost.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkpost.o -c u/t_server_talk_talkpost.cpp

u/t_server_talk_talkpost.s: u/t_server_talk_talkpost.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkpost.s -S u/t_server_talk_talkpost.cpp

u/t_server_talk_talkrender.lo: u/t_server_talk_talkrender.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkrender.lo -c u/t_server_talk_talkrender.cpp

u/t_server_talk_talkrender.o: u/t_server_talk_talkrender.cpp
	@echo "        Compiling u/t_server_talk_talkrender.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkrender.o -c u/t_server_talk_talkrender.cpp

u/t_server_talk_talkrender.s: u/t_server_talk_talkrender.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkrender.s -S u/t_server_talk_talkrender.cpp

u/t_server_talk_talksyntax.lo: u/t_server_talk_talksyntax.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talksyntax.lo -c u/t_server_talk_talksyntax.cpp

u/t_server_talk_talksyntax.o: u/t_server_talk_talksyntax.cpp
	@echo "        Compiling u/t_server_talk_talksyntax.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talksyntax.o -c u/t_server_talk_talksyntax.cpp

u/t_server_talk_talksyntax.s: u/t_server_talk_talksyntax.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talksyntax.s -S u/t_server_talk_talksyntax.cpp

u/t_server_talk_talkthread.lo: u/t_server_talk_talkthread.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkthread.lo -c u/t_server_talk_talkthread.cpp

u/t_server_talk_talkthread.o: u/t_server_talk_talkthread.cpp
	@echo "        Compiling u/t_server_talk_talkthread.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkthread.o -c u/t_server_talk_talkthread.cpp

u/t_server_talk_talkthread.s: u/t_server_talk_talkthread.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkthread.s -S u/t_server_talk_talkthread.cpp

u/t_server_talk_talkuser.lo: u/t_server_talk_talkuser.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkuser.lo -c u/t_server_talk_talkuser.cpp

u/t_server_talk_talkuser.o: u/t_server_talk_talkuser.cpp
	@echo "        Compiling u/t_server_talk_talkuser.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkuser.o -c u/t_server_talk_talkuser.cpp

u/t_server_talk_talkuser.s: u/t_server_talk_talkuser.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_talkuser.s -S u/t_server_talk_talkuser.cpp

u/t_server_talk_textnode.lo: u/t_server_talk_textnode.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_textnode.lo -c u/t_server_talk_textnode.cpp

u/t_server_talk_textnode.o: u/t_server_talk_textnode.cpp
	@echo "        Compiling u/t_server_talk_textnode.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_textnode.o -c u/t_server_talk_textnode.cpp

u/t_server_talk_textnode.s: u/t_server_talk_textnode.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_textnode.s -S u/t_server_talk_textnode.cpp

u/t_server_talk_topic.lo: u/t_server_talk_topic.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_topic.lo -c u/t_server_talk_topic.cpp

u/t_server_talk_topic.o: u/t_server_talk_topic.cpp
	@echo "        Compiling u/t_server_talk_topic.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_topic.o -c u/t_server_talk_topic.cpp

u/t_server_talk_topic.s: u/t_server_talk_topic.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_topic.s -S u/t_server_talk_topic.cpp

u/t_server_talk_user.lo: u/t_server_talk_user.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_user.lo -c u/t_server_talk_user.cpp

u/t_server_talk_user.o: u/t_server_talk_user.cpp
	@echo "        Compiling u/t_server_talk_user.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_user.o -c u/t_server_talk_user.cpp

u/t_server_talk_user.s: u/t_server_talk_user.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_user.s -S u/t_server_talk_user.cpp

u/t_server_talk_userfolder.lo: u/t_server_talk_userfolder.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_userfolder.lo -c u/t_server_talk_userfolder.cpp

u/t_server_talk_userfolder.o: u/t_server_talk_userfolder.cpp
	@echo "        Compiling u/t_server_talk_userfolder.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_userfolder.o -c u/t_server_talk_userfolder.cpp

u/t_server_talk_userfolder.s: u/t_server_talk_userfolder.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_userfolder.s -S u/t_server_talk_userfolder.cpp

u/t_server_talk_userpm.lo: u/t_server_talk_userpm.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_userpm.lo -c u/t_server_talk_userpm.cpp

u/t_server_talk_userpm.o: u/t_server_talk_userpm.cpp
	@echo "        Compiling u/t_server_talk_userpm.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_userpm.o -c u/t_server_talk_userpm.cpp

u/t_server_talk_userpm.s: u/t_server_talk_userpm.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_userpm.s -S u/t_server_talk_userpm.cpp

u/t_server_talk_util.lo: u/t_server_talk_util.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_util.lo -c u/t_server_talk_util.cpp

u/t_server_talk_util.o: u/t_server_talk_util.cpp
	@echo "        Compiling u/t_server_talk_util.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_util.o -c u/t_server_talk_util.cpp

u/t_server_talk_util.s: u/t_server_talk_util.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_talk_util.s -S u/t_server_talk_util.cpp

u/t_server_types.lo: u/t_server_types.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_types.lo -c u/t_server_types.cpp

u/t_server_types.o: u/t_server_types.cpp
	@echo "        Compiling u/t_server_types.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_types.o -c u/t_server_types.cpp

u/t_server_types.s: u/t_server_types.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_server_types.s -S u/t_server_types.cpp

u/t_ui_colorscheme.lo: u/t_ui_colorscheme.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_colorscheme.lo -c u/t_ui_colorscheme.cpp

u/t_ui_colorscheme.o: u/t_ui_colorscheme.cpp
	@echo "        Compiling u/t_ui_colorscheme.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_colorscheme.o -c u/t_ui_colorscheme.cpp

u/t_ui_colorscheme.s: u/t_ui_colorscheme.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_colorscheme.s -S u/t_ui_colorscheme.cpp

u/t_ui_group.lo: u/t_ui_group.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_group.lo -c u/t_ui_group.cpp

u/t_ui_group.o: u/t_ui_group.cpp
	@echo "        Compiling u/t_ui_group.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_group.o -c u/t_ui_group.cpp

u/t_ui_group.s: u/t_ui_group.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_group.s -S u/t_ui_group.cpp

u/t_ui_invisiblewidget.lo: u/t_ui_invisiblewidget.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_invisiblewidget.lo -c u/t_ui_invisiblewidget.cpp

u/t_ui_invisiblewidget.o: u/t_ui_invisiblewidget.cpp
	@echo "        Compiling u/t_ui_invisiblewidget.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_invisiblewidget.o -c u/t_ui_invisiblewidget.cpp

u/t_ui_invisiblewidget.s: u/t_ui_invisiblewidget.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_invisiblewidget.s -S u/t_ui_invisiblewidget.cpp

u/t_ui_layout_grid.lo: u/t_ui_layout_grid.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_layout_grid.lo -c u/t_ui_layout_grid.cpp

u/t_ui_layout_grid.o: u/t_ui_layout_grid.cpp
	@echo "        Compiling u/t_ui_layout_grid.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_layout_grid.o -c u/t_ui_layout_grid.cpp

u/t_ui_layout_grid.s: u/t_ui_layout_grid.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_layout_grid.s -S u/t_ui_layout_grid.cpp

u/t_ui_prefixargument.lo: u/t_ui_prefixargument.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_prefixargument.lo -c u/t_ui_prefixargument.cpp

u/t_ui_prefixargument.o: u/t_ui_prefixargument.cpp
	@echo "        Compiling u/t_ui_prefixargument.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_prefixargument.o -c u/t_ui_prefixargument.cpp

u/t_ui_prefixargument.s: u/t_ui_prefixargument.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_prefixargument.s -S u/t_ui_prefixargument.cpp

u/t_ui_res_ccimageloader.lo: u/t_ui_res_ccimageloader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_res_ccimageloader.lo -c u/t_ui_res_ccimageloader.cpp

u/t_ui_res_ccimageloader.o: u/t_ui_res_ccimageloader.cpp
	@echo "        Compiling u/t_ui_res_ccimageloader.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_res_ccimageloader.o -c u/t_ui_res_ccimageloader.cpp

u/t_ui_res_ccimageloader.s: u/t_ui_res_ccimageloader.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_res_ccimageloader.s -S u/t_ui_res_ccimageloader.cpp

u/t_ui_res_engineimageloader.lo: u/t_ui_res_engineimageloader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_res_engineimageloader.lo -c u/t_ui_res_engineimageloader.cpp

u/t_ui_res_engineimageloader.o: u/t_ui_res_engineimageloader.cpp
	@echo "        Compiling u/t_ui_res_engineimageloader.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_res_engineimageloader.o -c u/t_ui_res_engineimageloader.cpp

u/t_ui_res_engineimageloader.s: u/t_ui_res_engineimageloader.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_res_engineimageloader.s -S u/t_ui_res_engineimageloader.cpp

u/t_ui_res_imageloader.lo: u/t_ui_res_imageloader.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_res_imageloader.lo -c u/t_ui_res_imageloader.cpp

u/t_ui_res_imageloader.o: u/t_ui_res_imageloader.cpp
	@echo "        Compiling u/t_ui_res_imageloader.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_res_imageloader.o -c u/t_ui_res_imageloader.cpp

u/t_ui_res_imageloader.s: u/t_ui_res_imageloader.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_res_imageloader.s -S u/t_ui_res_imageloader.cpp

u/t_ui_res_manager.lo: u/t_ui_res_manager.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_res_manager.lo -c u/t_ui_res_manager.cpp

u/t_ui_res_manager.o: u/t_ui_res_manager.cpp
	@echo "        Compiling u/t_ui_res_manager.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_res_manager.o -c u/t_ui_res_manager.cpp

u/t_ui_res_manager.s: u/t_ui_res_manager.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_res_manager.s -S u/t_ui_res_manager.cpp

u/t_ui_res_provider.lo: u/t_ui_res_provider.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_res_provider.lo -c u/t_ui_res_provider.cpp

u/t_ui_res_provider.o: u/t_ui_res_provider.cpp
	@echo "        Compiling u/t_ui_res_provider.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_res_provider.o -c u/t_ui_res_provider.cpp

u/t_ui_res_provider.s: u/t_ui_res_provider.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_res_provider.s -S u/t_ui_res_provider.cpp

u/t_ui_res_resid.lo: u/t_ui_res_resid.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_res_resid.lo -c u/t_ui_res_resid.cpp

u/t_ui_res_resid.o: u/t_ui_res_resid.cpp
	@echo "        Compiling u/t_ui_res_resid.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_res_resid.o -c u/t_ui_res_resid.cpp

u/t_ui_res_resid.s: u/t_ui_res_resid.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_res_resid.s -S u/t_ui_res_resid.cpp

u/t_ui_rich_blockobject.lo: u/t_ui_rich_blockobject.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_rich_blockobject.lo -c u/t_ui_rich_blockobject.cpp

u/t_ui_rich_blockobject.o: u/t_ui_rich_blockobject.cpp
	@echo "        Compiling u/t_ui_rich_blockobject.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_rich_blockobject.o -c u/t_ui_rich_blockobject.cpp

u/t_ui_rich_blockobject.s: u/t_ui_rich_blockobject.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_rich_blockobject.s -S u/t_ui_rich_blockobject.cpp

u/t_ui_rich_imageobject.lo: u/t_ui_rich_imageobject.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_rich_imageobject.lo -c u/t_ui_rich_imageobject.cpp

u/t_ui_rich_imageobject.o: u/t_ui_rich_imageobject.cpp
	@echo "        Compiling u/t_ui_rich_imageobject.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_rich_imageobject.o -c u/t_ui_rich_imageobject.cpp

u/t_ui_rich_imageobject.s: u/t_ui_rich_imageobject.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_rich_imageobject.s -S u/t_ui_rich_imageobject.cpp

u/t_ui_root.lo: u/t_ui_root.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_root.lo -c u/t_ui_root.cpp

u/t_ui_root.o: u/t_ui_root.cpp
	@echo "        Compiling u/t_ui_root.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_root.o -c u/t_ui_root.cpp

u/t_ui_root.s: u/t_ui_root.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_root.s -S u/t_ui_root.cpp

u/t_ui_widget.lo: u/t_ui_widget.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_widget.lo -c u/t_ui_widget.cpp

u/t_ui_widget.o: u/t_ui_widget.cpp
	@echo "        Compiling u/t_ui_widget.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_widget.o -c u/t_ui_widget.cpp

u/t_ui_widget.s: u/t_ui_widget.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_widget.s -S u/t_ui_widget.cpp

u/t_ui_widgets_abstractbutton.lo: u/t_ui_widgets_abstractbutton.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_widgets_abstractbutton.lo -c u/t_ui_widgets_abstractbutton.cpp

u/t_ui_widgets_abstractbutton.o: u/t_ui_widgets_abstractbutton.cpp
	@echo "        Compiling u/t_ui_widgets_abstractbutton.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_widgets_abstractbutton.o -c u/t_ui_widgets_abstractbutton.cpp

u/t_ui_widgets_abstractbutton.s: u/t_ui_widgets_abstractbutton.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_widgets_abstractbutton.s -S u/t_ui_widgets_abstractbutton.cpp

u/t_ui_widgets_checkbox.lo: u/t_ui_widgets_checkbox.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_widgets_checkbox.lo -c u/t_ui_widgets_checkbox.cpp

u/t_ui_widgets_checkbox.o: u/t_ui_widgets_checkbox.cpp
	@echo "        Compiling u/t_ui_widgets_checkbox.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_widgets_checkbox.o -c u/t_ui_widgets_checkbox.cpp

u/t_ui_widgets_checkbox.s: u/t_ui_widgets_checkbox.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_widgets_checkbox.s -S u/t_ui_widgets_checkbox.cpp

u/t_ui_widgets_focusiterator.lo: u/t_ui_widgets_focusiterator.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_widgets_focusiterator.lo -c u/t_ui_widgets_focusiterator.cpp

u/t_ui_widgets_focusiterator.o: u/t_ui_widgets_focusiterator.cpp
	@echo "        Compiling u/t_ui_widgets_focusiterator.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_widgets_focusiterator.o -c u/t_ui_widgets_focusiterator.cpp

u/t_ui_widgets_focusiterator.s: u/t_ui_widgets_focusiterator.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_widgets_focusiterator.s -S u/t_ui_widgets_focusiterator.cpp

u/t_ui_widgets_inputline.lo: u/t_ui_widgets_inputline.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_widgets_inputline.lo -c u/t_ui_widgets_inputline.cpp

u/t_ui_widgets_inputline.o: u/t_ui_widgets_inputline.cpp
	@echo "        Compiling u/t_ui_widgets_inputline.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_widgets_inputline.o -c u/t_ui_widgets_inputline.cpp

u/t_ui_widgets_inputline.s: u/t_ui_widgets_inputline.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_widgets_inputline.s -S u/t_ui_widgets_inputline.cpp

u/t_ui_widgets_radiobutton.lo: u/t_ui_widgets_radiobutton.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_widgets_radiobutton.lo -c u/t_ui_widgets_radiobutton.cpp

u/t_ui_widgets_radiobutton.o: u/t_ui_widgets_radiobutton.cpp
	@echo "        Compiling u/t_ui_widgets_radiobutton.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_widgets_radiobutton.o -c u/t_ui_widgets_radiobutton.cpp

u/t_ui_widgets_radiobutton.s: u/t_ui_widgets_radiobutton.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_ui_widgets_radiobutton.s -S u/t_ui_widgets_radiobutton.cpp

u/t_util_answerprovider.lo: u/t_util_answerprovider.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_answerprovider.lo -c u/t_util_answerprovider.cpp

u/t_util_answerprovider.o: u/t_util_answerprovider.cpp
	@echo "        Compiling u/t_util_answerprovider.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_answerprovider.o -c u/t_util_answerprovider.cpp

u/t_util_answerprovider.s: u/t_util_answerprovider.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_answerprovider.s -S u/t_util_answerprovider.cpp

u/t_util_application.lo: u/t_util_application.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_application.lo -c u/t_util_application.cpp

u/t_util_application.o: u/t_util_application.cpp
	@echo "        Compiling u/t_util_application.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_application.o -c u/t_util_application.cpp

u/t_util_application.s: u/t_util_application.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_application.s -S u/t_util_application.cpp

u/t_util_atomtable.lo: u/t_util_atomtable.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_atomtable.lo -c u/t_util_atomtable.cpp

u/t_util_atomtable.o: u/t_util_atomtable.cpp
	@echo "        Compiling u/t_util_atomtable.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_atomtable.o -c u/t_util_atomtable.cpp

u/t_util_atomtable.s: u/t_util_atomtable.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_atomtable.s -S u/t_util_atomtable.cpp

u/t_util_backupfile.lo: u/t_util_backupfile.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_backupfile.lo -c u/t_util_backupfile.cpp

u/t_util_backupfile.o: u/t_util_backupfile.cpp
	@echo "        Compiling u/t_util_backupfile.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_backupfile.o -c u/t_util_backupfile.cpp

u/t_util_backupfile.s: u/t_util_backupfile.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_backupfile.s -S u/t_util_backupfile.cpp

u/t_util_baseslaverequest.lo: u/t_util_baseslaverequest.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_baseslaverequest.lo -c u/t_util_baseslaverequest.cpp

u/t_util_baseslaverequest.o: u/t_util_baseslaverequest.cpp
	@echo "        Compiling u/t_util_baseslaverequest.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_baseslaverequest.o -c u/t_util_baseslaverequest.cpp

u/t_util_baseslaverequest.s: u/t_util_baseslaverequest.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_baseslaverequest.s -S u/t_util_baseslaverequest.cpp

u/t_util_baseslaverequestsender.lo: u/t_util_baseslaverequestsender.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_baseslaverequestsender.lo -c u/t_util_baseslaverequestsender.cpp

u/t_util_baseslaverequestsender.o: u/t_util_baseslaverequestsender.cpp
	@echo "        Compiling u/t_util_baseslaverequestsender.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_baseslaverequestsender.o -c u/t_util_baseslaverequestsender.cpp

u/t_util_baseslaverequestsender.s: u/t_util_baseslaverequestsender.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_baseslaverequestsender.s -S u/t_util_baseslaverequestsender.cpp

u/t_util_charsetfactory.lo: u/t_util_charsetfactory.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_charsetfactory.lo -c u/t_util_charsetfactory.cpp

u/t_util_charsetfactory.o: u/t_util_charsetfactory.cpp
	@echo "        Compiling u/t_util_charsetfactory.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_charsetfactory.o -c u/t_util_charsetfactory.cpp

u/t_util_charsetfactory.s: u/t_util_charsetfactory.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_charsetfactory.s -S u/t_util_charsetfactory.cpp

u/t_util_configurationfile.lo: u/t_util_configurationfile.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_configurationfile.lo -c u/t_util_configurationfile.cpp

u/t_util_configurationfile.o: u/t_util_configurationfile.cpp
	@echo "        Compiling u/t_util_configurationfile.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_configurationfile.o -c u/t_util_configurationfile.cpp

u/t_util_configurationfile.s: u/t_util_configurationfile.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_configurationfile.s -S u/t_util_configurationfile.cpp

u/t_util_configurationfileparser.lo: u/t_util_configurationfileparser.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_configurationfileparser.lo -c u/t_util_configurationfileparser.cpp

u/t_util_configurationfileparser.o: u/t_util_configurationfileparser.cpp
	@echo "        Compiling u/t_util_configurationfileparser.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_configurationfileparser.o -c u/t_util_configurationfileparser.cpp

u/t_util_configurationfileparser.s: u/t_util_configurationfileparser.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_configurationfileparser.s -S u/t_util_configurationfileparser.cpp

u/t_util_constantanswerprovider.lo: u/t_util_constantanswerprovider.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_constantanswerprovider.lo -c u/t_util_constantanswerprovider.cpp

u/t_util_constantanswerprovider.o: u/t_util_constantanswerprovider.cpp
	@echo "        Compiling u/t_util_constantanswerprovider.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_constantanswerprovider.o -c u/t_util_constantanswerprovider.cpp

u/t_util_constantanswerprovider.s: u/t_util_constantanswerprovider.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_constantanswerprovider.s -S u/t_util_constantanswerprovider.cpp

u/t_util_digest.lo: u/t_util_digest.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_digest.lo -c u/t_util_digest.cpp

u/t_util_digest.o: u/t_util_digest.cpp
	@echo "        Compiling u/t_util_digest.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_digest.o -c u/t_util_digest.cpp

u/t_util_digest.s: u/t_util_digest.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_digest.s -S u/t_util_digest.cpp

u/t_util_filenamepattern.lo: u/t_util_filenamepattern.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_filenamepattern.lo -c u/t_util_filenamepattern.cpp

u/t_util_filenamepattern.o: u/t_util_filenamepattern.cpp
	@echo "        Compiling u/t_util_filenamepattern.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_filenamepattern.o -c u/t_util_filenamepattern.cpp

u/t_util_filenamepattern.s: u/t_util_filenamepattern.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_filenamepattern.s -S u/t_util_filenamepattern.cpp

u/t_util_fileparser.lo: u/t_util_fileparser.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_fileparser.lo -c u/t_util_fileparser.cpp

u/t_util_fileparser.o: u/t_util_fileparser.cpp
	@echo "        Compiling u/t_util_fileparser.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_fileparser.o -c u/t_util_fileparser.cpp

u/t_util_fileparser.s: u/t_util_fileparser.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_fileparser.s -S u/t_util_fileparser.cpp

u/t_util_helpindex.lo: u/t_util_helpindex.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_helpindex.lo -c u/t_util_helpindex.cpp

u/t_util_helpindex.o: u/t_util_helpindex.cpp
	@echo "        Compiling u/t_util_helpindex.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_helpindex.o -c u/t_util_helpindex.cpp

u/t_util_helpindex.s: u/t_util_helpindex.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_helpindex.s -S u/t_util_helpindex.cpp

u/t_util_instructionlist.lo: u/t_util_instructionlist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_instructionlist.lo -c u/t_util_instructionlist.cpp

u/t_util_instructionlist.o: u/t_util_instructionlist.cpp
	@echo "        Compiling u/t_util_instructionlist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_instructionlist.o -c u/t_util_instructionlist.cpp

u/t_util_instructionlist.s: u/t_util_instructionlist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_instructionlist.s -S u/t_util_instructionlist.cpp

u/t_util_io.lo: u/t_util_io.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_io.lo -c u/t_util_io.cpp

u/t_util_io.o: u/t_util_io.cpp
	@echo "        Compiling u/t_util_io.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_io.o -c u/t_util_io.cpp

u/t_util_io.s: u/t_util_io.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_io.s -S u/t_util_io.cpp

u/t_util_key.lo: u/t_util_key.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_key.lo -c u/t_util_key.cpp

u/t_util_key.o: u/t_util_key.cpp
	@echo "        Compiling u/t_util_key.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_key.o -c u/t_util_key.cpp

u/t_util_key.s: u/t_util_key.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_key.s -S u/t_util_key.cpp

u/t_util_keymap.lo: u/t_util_keymap.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_keymap.lo -c u/t_util_keymap.cpp

u/t_util_keymap.o: u/t_util_keymap.cpp
	@echo "        Compiling u/t_util_keymap.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_keymap.o -c u/t_util_keymap.cpp

u/t_util_keymap.s: u/t_util_keymap.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_keymap.s -S u/t_util_keymap.cpp

u/t_util_keymaptable.lo: u/t_util_keymaptable.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_keymaptable.lo -c u/t_util_keymaptable.cpp

u/t_util_keymaptable.o: u/t_util_keymaptable.cpp
	@echo "        Compiling u/t_util_keymaptable.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_keymaptable.o -c u/t_util_keymaptable.cpp

u/t_util_keymaptable.s: u/t_util_keymaptable.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_keymaptable.s -S u/t_util_keymaptable.cpp

u/t_util_keystring.lo: u/t_util_keystring.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_keystring.lo -c u/t_util_keystring.cpp

u/t_util_keystring.o: u/t_util_keystring.cpp
	@echo "        Compiling u/t_util_keystring.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_keystring.o -c u/t_util_keystring.cpp

u/t_util_keystring.s: u/t_util_keystring.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_keystring.s -S u/t_util_keystring.cpp

u/t_util_math.lo: u/t_util_math.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_math.lo -c u/t_util_math.cpp

u/t_util_math.o: u/t_util_math.cpp
	@echo "        Compiling u/t_util_math.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_math.o -c u/t_util_math.cpp

u/t_util_math.s: u/t_util_math.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_math.s -S u/t_util_math.cpp

u/t_util_messagecollector.lo: u/t_util_messagecollector.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_messagecollector.lo -c u/t_util_messagecollector.cpp

u/t_util_messagecollector.o: u/t_util_messagecollector.cpp
	@echo "        Compiling u/t_util_messagecollector.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_messagecollector.o -c u/t_util_messagecollector.cpp

u/t_util_messagecollector.s: u/t_util_messagecollector.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_messagecollector.s -S u/t_util_messagecollector.cpp

u/t_util_messagematcher.lo: u/t_util_messagematcher.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_messagematcher.lo -c u/t_util_messagematcher.cpp

u/t_util_messagematcher.o: u/t_util_messagematcher.cpp
	@echo "        Compiling u/t_util_messagematcher.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_messagematcher.o -c u/t_util_messagematcher.cpp

u/t_util_messagematcher.s: u/t_util_messagematcher.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_messagematcher.s -S u/t_util_messagematcher.cpp

u/t_util_messagenotifier.lo: u/t_util_messagenotifier.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_messagenotifier.lo -c u/t_util_messagenotifier.cpp

u/t_util_messagenotifier.o: u/t_util_messagenotifier.cpp
	@echo "        Compiling u/t_util_messagenotifier.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_messagenotifier.o -c u/t_util_messagenotifier.cpp

u/t_util_messagenotifier.s: u/t_util_messagenotifier.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_messagenotifier.s -S u/t_util_messagenotifier.cpp

u/t_util_plugin_plugin.lo: u/t_util_plugin_plugin.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_plugin_plugin.lo -c u/t_util_plugin_plugin.cpp

u/t_util_plugin_plugin.o: u/t_util_plugin_plugin.cpp
	@echo "        Compiling u/t_util_plugin_plugin.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_plugin_plugin.o -c u/t_util_plugin_plugin.cpp

u/t_util_plugin_plugin.s: u/t_util_plugin_plugin.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_plugin_plugin.s -S u/t_util_plugin_plugin.cpp

u/t_util_prefixargument.lo: u/t_util_prefixargument.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_prefixargument.lo -c u/t_util_prefixargument.cpp

u/t_util_prefixargument.o: u/t_util_prefixargument.cpp
	@echo "        Compiling u/t_util_prefixargument.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_prefixargument.o -c u/t_util_prefixargument.cpp

u/t_util_prefixargument.s: u/t_util_prefixargument.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_prefixargument.s -S u/t_util_prefixargument.cpp

u/t_util_processrunner.lo: u/t_util_processrunner.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_processrunner.lo -c u/t_util_processrunner.cpp

u/t_util_processrunner.o: u/t_util_processrunner.cpp
	@echo "        Compiling u/t_util_processrunner.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_processrunner.o -c u/t_util_processrunner.cpp

u/t_util_processrunner.s: u/t_util_processrunner.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_processrunner.s -S u/t_util_processrunner.cpp

u/t_util_randomnumbergenerator.lo: u/t_util_randomnumbergenerator.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_randomnumbergenerator.lo -c u/t_util_randomnumbergenerator.cpp

u/t_util_randomnumbergenerator.o: u/t_util_randomnumbergenerator.cpp
	@echo "        Compiling u/t_util_randomnumbergenerator.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_randomnumbergenerator.o -c u/t_util_randomnumbergenerator.cpp

u/t_util_randomnumbergenerator.s: u/t_util_randomnumbergenerator.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_randomnumbergenerator.s -S u/t_util_randomnumbergenerator.cpp

u/t_util_request.lo: u/t_util_request.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_request.lo -c u/t_util_request.cpp

u/t_util_request.o: u/t_util_request.cpp
	@echo "        Compiling u/t_util_request.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_request.o -c u/t_util_request.cpp

u/t_util_request.s: u/t_util_request.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_request.s -S u/t_util_request.cpp

u/t_util_requestdispatcher.lo: u/t_util_requestdispatcher.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_requestdispatcher.lo -c u/t_util_requestdispatcher.cpp

u/t_util_requestdispatcher.o: u/t_util_requestdispatcher.cpp
	@echo "        Compiling u/t_util_requestdispatcher.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_requestdispatcher.o -c u/t_util_requestdispatcher.cpp

u/t_util_requestdispatcher.s: u/t_util_requestdispatcher.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_requestdispatcher.s -S u/t_util_requestdispatcher.cpp

u/t_util_requestreceiver.lo: u/t_util_requestreceiver.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_requestreceiver.lo -c u/t_util_requestreceiver.cpp

u/t_util_requestreceiver.o: u/t_util_requestreceiver.cpp
	@echo "        Compiling u/t_util_requestreceiver.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_requestreceiver.o -c u/t_util_requestreceiver.cpp

u/t_util_requestreceiver.s: u/t_util_requestreceiver.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_requestreceiver.s -S u/t_util_requestreceiver.cpp

u/t_util_requestthread.lo: u/t_util_requestthread.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_requestthread.lo -c u/t_util_requestthread.cpp

u/t_util_requestthread.o: u/t_util_requestthread.cpp
	@echo "        Compiling u/t_util_requestthread.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_requestthread.o -c u/t_util_requestthread.cpp

u/t_util_requestthread.s: u/t_util_requestthread.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_requestthread.s -S u/t_util_requestthread.cpp

u/t_util_rich_alignmentattribute.lo: u/t_util_rich_alignmentattribute.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_alignmentattribute.lo -c u/t_util_rich_alignmentattribute.cpp

u/t_util_rich_alignmentattribute.o: u/t_util_rich_alignmentattribute.cpp
	@echo "        Compiling u/t_util_rich_alignmentattribute.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_alignmentattribute.o -c u/t_util_rich_alignmentattribute.cpp

u/t_util_rich_alignmentattribute.s: u/t_util_rich_alignmentattribute.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_alignmentattribute.s -S u/t_util_rich_alignmentattribute.cpp

u/t_util_rich_attribute.lo: u/t_util_rich_attribute.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_attribute.lo -c u/t_util_rich_attribute.cpp

u/t_util_rich_attribute.o: u/t_util_rich_attribute.cpp
	@echo "        Compiling u/t_util_rich_attribute.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_attribute.o -c u/t_util_rich_attribute.cpp

u/t_util_rich_attribute.s: u/t_util_rich_attribute.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_attribute.s -S u/t_util_rich_attribute.cpp

u/t_util_rich_colorattribute.lo: u/t_util_rich_colorattribute.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_colorattribute.lo -c u/t_util_rich_colorattribute.cpp

u/t_util_rich_colorattribute.o: u/t_util_rich_colorattribute.cpp
	@echo "        Compiling u/t_util_rich_colorattribute.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_colorattribute.o -c u/t_util_rich_colorattribute.cpp

u/t_util_rich_colorattribute.s: u/t_util_rich_colorattribute.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_colorattribute.s -S u/t_util_rich_colorattribute.cpp

u/t_util_rich_linkattribute.lo: u/t_util_rich_linkattribute.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_linkattribute.lo -c u/t_util_rich_linkattribute.cpp

u/t_util_rich_linkattribute.o: u/t_util_rich_linkattribute.cpp
	@echo "        Compiling u/t_util_rich_linkattribute.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_linkattribute.o -c u/t_util_rich_linkattribute.cpp

u/t_util_rich_linkattribute.s: u/t_util_rich_linkattribute.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_linkattribute.s -S u/t_util_rich_linkattribute.cpp

u/t_util_rich_parser.lo: u/t_util_rich_parser.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_parser.lo -c u/t_util_rich_parser.cpp

u/t_util_rich_parser.o: u/t_util_rich_parser.cpp
	@echo "        Compiling u/t_util_rich_parser.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_parser.o -c u/t_util_rich_parser.cpp

u/t_util_rich_parser.s: u/t_util_rich_parser.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_parser.s -S u/t_util_rich_parser.cpp

u/t_util_rich_styleattribute.lo: u/t_util_rich_styleattribute.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_styleattribute.lo -c u/t_util_rich_styleattribute.cpp

u/t_util_rich_styleattribute.o: u/t_util_rich_styleattribute.cpp
	@echo "        Compiling u/t_util_rich_styleattribute.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_styleattribute.o -c u/t_util_rich_styleattribute.cpp

u/t_util_rich_styleattribute.s: u/t_util_rich_styleattribute.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_styleattribute.s -S u/t_util_rich_styleattribute.cpp

u/t_util_rich_text.lo: u/t_util_rich_text.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_text.lo -c u/t_util_rich_text.cpp

u/t_util_rich_text.o: u/t_util_rich_text.cpp
	@echo "        Compiling u/t_util_rich_text.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_text.o -c u/t_util_rich_text.cpp

u/t_util_rich_text.s: u/t_util_rich_text.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_text.s -S u/t_util_rich_text.cpp

u/t_util_rich_visitor.lo: u/t_util_rich_visitor.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_visitor.lo -c u/t_util_rich_visitor.cpp

u/t_util_rich_visitor.o: u/t_util_rich_visitor.cpp
	@echo "        Compiling u/t_util_rich_visitor.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_visitor.o -c u/t_util_rich_visitor.cpp

u/t_util_rich_visitor.s: u/t_util_rich_visitor.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_rich_visitor.s -S u/t_util_rich_visitor.cpp

u/t_util_runlengthexpandtransform.lo: u/t_util_runlengthexpandtransform.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_runlengthexpandtransform.lo -c u/t_util_runlengthexpandtransform.cpp

u/t_util_runlengthexpandtransform.o: u/t_util_runlengthexpandtransform.cpp
	@echo "        Compiling u/t_util_runlengthexpandtransform.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_runlengthexpandtransform.o -c u/t_util_runlengthexpandtransform.cpp

u/t_util_runlengthexpandtransform.s: u/t_util_runlengthexpandtransform.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_runlengthexpandtransform.s -S u/t_util_runlengthexpandtransform.cpp

u/t_util_skincolor.lo: u/t_util_skincolor.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_skincolor.lo -c u/t_util_skincolor.cpp

u/t_util_skincolor.o: u/t_util_skincolor.cpp
	@echo "        Compiling u/t_util_skincolor.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_skincolor.o -c u/t_util_skincolor.cpp

u/t_util_skincolor.s: u/t_util_skincolor.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_skincolor.s -S u/t_util_skincolor.cpp

u/t_util_slaveobject.lo: u/t_util_slaveobject.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_slaveobject.lo -c u/t_util_slaveobject.cpp

u/t_util_slaveobject.o: u/t_util_slaveobject.cpp
	@echo "        Compiling u/t_util_slaveobject.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_slaveobject.o -c u/t_util_slaveobject.cpp

u/t_util_slaveobject.s: u/t_util_slaveobject.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_slaveobject.s -S u/t_util_slaveobject.cpp

u/t_util_slaverequest.lo: u/t_util_slaverequest.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_slaverequest.lo -c u/t_util_slaverequest.cpp

u/t_util_slaverequest.o: u/t_util_slaverequest.cpp
	@echo "        Compiling u/t_util_slaverequest.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_slaverequest.o -c u/t_util_slaverequest.cpp

u/t_util_slaverequest.s: u/t_util_slaverequest.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_slaverequest.s -S u/t_util_slaverequest.cpp

u/t_util_slaverequestsender.lo: u/t_util_slaverequestsender.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_slaverequestsender.lo -c u/t_util_slaverequestsender.cpp

u/t_util_slaverequestsender.o: u/t_util_slaverequestsender.cpp
	@echo "        Compiling u/t_util_slaverequestsender.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_slaverequestsender.o -c u/t_util_slaverequestsender.cpp

u/t_util_slaverequestsender.s: u/t_util_slaverequestsender.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_slaverequestsender.s -S u/t_util_slaverequestsender.cpp

u/t_util_string.lo: u/t_util_string.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_string.lo -c u/t_util_string.cpp

u/t_util_string.o: u/t_util_string.cpp
	@echo "        Compiling u/t_util_string.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_string.o -c u/t_util_string.cpp

u/t_util_string.s: u/t_util_string.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_string.s -S u/t_util_string.cpp

u/t_util_stringinstructionlist.lo: u/t_util_stringinstructionlist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_stringinstructionlist.lo -c u/t_util_stringinstructionlist.cpp

u/t_util_stringinstructionlist.o: u/t_util_stringinstructionlist.cpp
	@echo "        Compiling u/t_util_stringinstructionlist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_stringinstructionlist.o -c u/t_util_stringinstructionlist.cpp

u/t_util_stringinstructionlist.s: u/t_util_stringinstructionlist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_stringinstructionlist.s -S u/t_util_stringinstructionlist.cpp

u/t_util_stringlist.lo: u/t_util_stringlist.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_stringlist.lo -c u/t_util_stringlist.cpp

u/t_util_stringlist.o: u/t_util_stringlist.cpp
	@echo "        Compiling u/t_util_stringlist.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_stringlist.o -c u/t_util_stringlist.cpp

u/t_util_stringlist.s: u/t_util_stringlist.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_stringlist.s -S u/t_util_stringlist.cpp

u/t_util_stringparser.lo: u/t_util_stringparser.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_stringparser.lo -c u/t_util_stringparser.cpp

u/t_util_stringparser.o: u/t_util_stringparser.cpp
	@echo "        Compiling u/t_util_stringparser.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_stringparser.o -c u/t_util_stringparser.cpp

u/t_util_stringparser.s: u/t_util_stringparser.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_stringparser.s -S u/t_util_stringparser.cpp

u/t_util_syntax_chighlighter.lo: u/t_util_syntax_chighlighter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_chighlighter.lo -c u/t_util_syntax_chighlighter.cpp

u/t_util_syntax_chighlighter.o: u/t_util_syntax_chighlighter.cpp
	@echo "        Compiling u/t_util_syntax_chighlighter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_chighlighter.o -c u/t_util_syntax_chighlighter.cpp

u/t_util_syntax_chighlighter.s: u/t_util_syntax_chighlighter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_chighlighter.s -S u/t_util_syntax_chighlighter.cpp

u/t_util_syntax_factory.lo: u/t_util_syntax_factory.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_factory.lo -c u/t_util_syntax_factory.cpp

u/t_util_syntax_factory.o: u/t_util_syntax_factory.cpp
	@echo "        Compiling u/t_util_syntax_factory.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_factory.o -c u/t_util_syntax_factory.cpp

u/t_util_syntax_factory.s: u/t_util_syntax_factory.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_factory.s -S u/t_util_syntax_factory.cpp

u/t_util_syntax_format.lo: u/t_util_syntax_format.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_format.lo -c u/t_util_syntax_format.cpp

u/t_util_syntax_format.o: u/t_util_syntax_format.cpp
	@echo "        Compiling u/t_util_syntax_format.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_format.o -c u/t_util_syntax_format.cpp

u/t_util_syntax_format.s: u/t_util_syntax_format.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_format.s -S u/t_util_syntax_format.cpp

u/t_util_syntax_highlighter.lo: u/t_util_syntax_highlighter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_highlighter.lo -c u/t_util_syntax_highlighter.cpp

u/t_util_syntax_highlighter.o: u/t_util_syntax_highlighter.cpp
	@echo "        Compiling u/t_util_syntax_highlighter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_highlighter.o -c u/t_util_syntax_highlighter.cpp

u/t_util_syntax_highlighter.s: u/t_util_syntax_highlighter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_highlighter.s -S u/t_util_syntax_highlighter.cpp

u/t_util_syntax_inihighlighter.lo: u/t_util_syntax_inihighlighter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_inihighlighter.lo -c u/t_util_syntax_inihighlighter.cpp

u/t_util_syntax_inihighlighter.o: u/t_util_syntax_inihighlighter.cpp
	@echo "        Compiling u/t_util_syntax_inihighlighter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_inihighlighter.o -c u/t_util_syntax_inihighlighter.cpp

u/t_util_syntax_inihighlighter.s: u/t_util_syntax_inihighlighter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_inihighlighter.s -S u/t_util_syntax_inihighlighter.cpp

u/t_util_syntax_keywordtable.lo: u/t_util_syntax_keywordtable.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_keywordtable.lo -c u/t_util_syntax_keywordtable.cpp

u/t_util_syntax_keywordtable.o: u/t_util_syntax_keywordtable.cpp
	@echo "        Compiling u/t_util_syntax_keywordtable.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_keywordtable.o -c u/t_util_syntax_keywordtable.cpp

u/t_util_syntax_keywordtable.s: u/t_util_syntax_keywordtable.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_keywordtable.s -S u/t_util_syntax_keywordtable.cpp

u/t_util_syntax_lisphighlighter.lo: u/t_util_syntax_lisphighlighter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_lisphighlighter.lo -c u/t_util_syntax_lisphighlighter.cpp

u/t_util_syntax_lisphighlighter.o: u/t_util_syntax_lisphighlighter.cpp
	@echo "        Compiling u/t_util_syntax_lisphighlighter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_lisphighlighter.o -c u/t_util_syntax_lisphighlighter.cpp

u/t_util_syntax_lisphighlighter.s: u/t_util_syntax_lisphighlighter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_lisphighlighter.s -S u/t_util_syntax_lisphighlighter.cpp

u/t_util_syntax_nullhighlighter.lo: u/t_util_syntax_nullhighlighter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_nullhighlighter.lo -c u/t_util_syntax_nullhighlighter.cpp

u/t_util_syntax_nullhighlighter.o: u/t_util_syntax_nullhighlighter.cpp
	@echo "        Compiling u/t_util_syntax_nullhighlighter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_nullhighlighter.o -c u/t_util_syntax_nullhighlighter.cpp

u/t_util_syntax_nullhighlighter.s: u/t_util_syntax_nullhighlighter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_nullhighlighter.s -S u/t_util_syntax_nullhighlighter.cpp

u/t_util_syntax_pascalhighlighter.lo: u/t_util_syntax_pascalhighlighter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_pascalhighlighter.lo -c u/t_util_syntax_pascalhighlighter.cpp

u/t_util_syntax_pascalhighlighter.o: u/t_util_syntax_pascalhighlighter.cpp
	@echo "        Compiling u/t_util_syntax_pascalhighlighter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_pascalhighlighter.o -c u/t_util_syntax_pascalhighlighter.cpp

u/t_util_syntax_pascalhighlighter.s: u/t_util_syntax_pascalhighlighter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_pascalhighlighter.s -S u/t_util_syntax_pascalhighlighter.cpp

u/t_util_syntax_scripthighlighter.lo: u/t_util_syntax_scripthighlighter.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_scripthighlighter.lo -c u/t_util_syntax_scripthighlighter.cpp

u/t_util_syntax_scripthighlighter.o: u/t_util_syntax_scripthighlighter.cpp
	@echo "        Compiling u/t_util_syntax_scripthighlighter.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_scripthighlighter.o -c u/t_util_syntax_scripthighlighter.cpp

u/t_util_syntax_scripthighlighter.s: u/t_util_syntax_scripthighlighter.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_scripthighlighter.s -S u/t_util_syntax_scripthighlighter.cpp

u/t_util_syntax_segment.lo: u/t_util_syntax_segment.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_segment.lo -c u/t_util_syntax_segment.cpp

u/t_util_syntax_segment.o: u/t_util_syntax_segment.cpp
	@echo "        Compiling u/t_util_syntax_segment.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_segment.o -c u/t_util_syntax_segment.cpp

u/t_util_syntax_segment.s: u/t_util_syntax_segment.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_syntax_segment.s -S u/t_util_syntax_segment.cpp

u/t_util_unicodechars.lo: u/t_util_unicodechars.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_unicodechars.lo -c u/t_util_unicodechars.cpp

u/t_util_unicodechars.o: u/t_util_unicodechars.cpp
	@echo "        Compiling u/t_util_unicodechars.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_unicodechars.o -c u/t_util_unicodechars.cpp

u/t_util_unicodechars.s: u/t_util_unicodechars.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_unicodechars.s -S u/t_util_unicodechars.cpp

u/t_util_updater.lo: u/t_util_updater.cpp
	$(CXX) -fPIC $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_updater.lo -c u/t_util_updater.cpp

u/t_util_updater.o: u/t_util_updater.cpp
	@echo "        Compiling u/t_util_updater.cpp..."
	@$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_updater.o -c u/t_util_updater.cpp

u/t_util_updater.s: u/t_util_updater.cpp
	$(CXX) $(CXXFLAGS) -I$(CXXTESTDIR) -D_CXXTEST_HAVE_EH -D_CXXTEST_HAVE_STD -g -o u/t_util_updater.s -S u/t_util_updater.cpp

ui/group1.lo: ui/group.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o ui/group1.lo -c ui/group.cpp

ui/group1.o: ui/group.cpp
	@echo "        Compiling ui/group.cpp..."
	@$(CXX) $(CXXFLAGS) -o ui/group1.o -c ui/group.cpp

ui/group1.s: ui/group.cpp
	$(CXX) $(CXXFLAGS) -o ui/group1.s -S ui/group.cpp

ui/rich/draw1.lo: ui/rich/draw.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o ui/rich/draw1.lo -c ui/rich/draw.cpp

ui/rich/draw1.o: ui/rich/draw.cpp
	@echo "        Compiling ui/rich/draw.cpp..."
	@$(CXX) $(CXXFLAGS) -o ui/rich/draw1.o -c ui/rich/draw.cpp

ui/rich/draw1.s: ui/rich/draw.cpp
	$(CXX) $(CXXFLAGS) -o ui/rich/draw1.s -S ui/rich/draw.cpp

ui/root8.lo: ui/root.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o ui/root8.lo -c ui/root.cpp

ui/root8.o: ui/root.cpp
	@echo "        Compiling ui/root.cpp..."
	@$(CXX) $(CXXFLAGS) -o ui/root8.o -c ui/root.cpp

ui/root8.s: ui/root.cpp
	$(CXX) $(CXXFLAGS) -o ui/root8.s -S ui/root.cpp

ui/widget1.lo: ui/widget.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o ui/widget1.lo -c ui/widget.cpp

ui/widget1.o: ui/widget.cpp
	@echo "        Compiling ui/widget.cpp..."
	@$(CXX) $(CXXFLAGS) -o ui/widget1.o -c ui/widget.cpp

ui/widget1.s: ui/widget.cpp
	$(CXX) $(CXXFLAGS) -o ui/widget1.s -S ui/widget.cpp

ui/widgets/statictext1.lo: ui/widgets/statictext.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o ui/widgets/statictext1.lo -c ui/widgets/statictext.cpp

ui/widgets/statictext1.o: ui/widgets/statictext.cpp
	@echo "        Compiling ui/widgets/statictext.cpp..."
	@$(CXX) $(CXXFLAGS) -o ui/widgets/statictext1.o -c ui/widgets/statictext.cpp

ui/widgets/statictext1.s: ui/widgets/statictext.cpp
	$(CXX) $(CXXFLAGS) -o ui/widgets/statictext1.s -S ui/widgets/statictext.cpp

util/application4.lo: util/application.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o util/application4.lo -c util/application.cpp

util/application4.o: util/application.cpp
	@echo "        Compiling util/application.cpp..."
	@$(CXX) $(CXXFLAGS) -o util/application4.o -c util/application.cpp

util/application4.s: util/application.cpp
	$(CXX) $(CXXFLAGS) -o util/application4.s -S util/application.cpp

util/plugin/consoleapplication1.lo: util/plugin/consoleapplication.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o util/plugin/consoleapplication1.lo -c util/plugin/consoleapplication.cpp

util/plugin/consoleapplication1.o: util/plugin/consoleapplication.cpp
	@echo "        Compiling util/plugin/consoleapplication.cpp..."
	@$(CXX) $(CXXFLAGS) -o util/plugin/consoleapplication1.o -c util/plugin/consoleapplication.cpp

util/plugin/consoleapplication1.s: util/plugin/consoleapplication.cpp
	$(CXX) $(CXXFLAGS) -o util/plugin/consoleapplication1.s -S util/plugin/consoleapplication.cpp

util/plugin/installer1.lo: util/plugin/installer.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o util/plugin/installer1.lo -c util/plugin/installer.cpp

util/plugin/installer1.o: util/plugin/installer.cpp
	@echo "        Compiling util/plugin/installer.cpp..."
	@$(CXX) $(CXXFLAGS) -o util/plugin/installer1.o -c util/plugin/installer.cpp

util/plugin/installer1.s: util/plugin/installer.cpp
	$(CXX) $(CXXFLAGS) -o util/plugin/installer1.s -S util/plugin/installer.cpp

util/plugin/manager1.lo: util/plugin/manager.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o util/plugin/manager1.lo -c util/plugin/manager.cpp

util/plugin/manager1.o: util/plugin/manager.cpp
	@echo "        Compiling util/plugin/manager.cpp..."
	@$(CXX) $(CXXFLAGS) -o util/plugin/manager1.o -c util/plugin/manager.cpp

util/plugin/manager1.s: util/plugin/manager.cpp
	$(CXX) $(CXXFLAGS) -o util/plugin/manager1.s -S util/plugin/manager.cpp

util/prefixargument1.lo: util/prefixargument.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o util/prefixargument1.lo -c util/prefixargument.cpp

util/prefixargument1.o: util/prefixargument.cpp
	@echo "        Compiling util/prefixargument.cpp..."
	@$(CXX) $(CXXFLAGS) -o util/prefixargument1.o -c util/prefixargument.cpp

util/prefixargument1.s: util/prefixargument.cpp
	$(CXX) $(CXXFLAGS) -o util/prefixargument1.s -S util/prefixargument.cpp

util/rich/parser3.lo: util/rich/parser.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o util/rich/parser3.lo -c util/rich/parser.cpp

util/rich/parser3.o: util/rich/parser.cpp
	@echo "        Compiling util/rich/parser.cpp..."
	@$(CXX) $(CXXFLAGS) -o util/rich/parser3.o -c util/rich/parser.cpp

util/rich/parser3.s: util/rich/parser.cpp
	$(CXX) $(CXXFLAGS) -o util/rich/parser3.s -S util/rich/parser.cpp

util/syntax/factory1.lo: util/syntax/factory.cpp
	$(CXX) -fPIC $(CXXFLAGS) -o util/syntax/factory1.lo -c util/syntax/factory.cpp

util/syntax/factory1.o: util/syntax/factory.cpp
	@echo "        Compiling util/syntax/factory.cpp..."
	@$(CXX) $(CXXFLAGS) -o util/syntax/factory1.o -c util/syntax/factory.cpp

util/syntax/factory1.s: util/syntax/factory.cpp
	$(CXX) $(CXXFLAGS) -o util/syntax/factory1.s -S util/syntax/factory.cpp


include depend.mk

.cpp.lo:
	$(CXX) -fPIC $(CXXFLAGS) -o $@ -c $<

.cpp.o:
	@echo "        Compiling $<..."
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

.cpp.s:
	$(CXX) $(CXXFLAGS) -o $@ -S $<


