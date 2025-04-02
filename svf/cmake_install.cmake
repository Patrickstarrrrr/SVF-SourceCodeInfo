# Install script for directory: /Users/jiayi/SVF-SourceCodeInfo/svf

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/libSvfCore.a")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/lib" TYPE STATIC_LIBRARY FILES "/Users/jiayi/SVF-SourceCodeInfo/lib/libSvfCore.a")
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/libSvfCore.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/libSvfCore.a")
    execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}/usr/local/lib/libSvfCore.a")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/AE/Core/AbstractState.h;/usr/local/include/AE/Core/AbstractValue.h;/usr/local/include/AE/Core/AddressValue.h;/usr/local/include/AE/Core/ICFGWTO.h;/usr/local/include/AE/Core/IntervalValue.h;/usr/local/include/AE/Core/NumericValue.h;/usr/local/include/AE/Core/RelExeState.h;/usr/local/include/AE/Core/RelationSolver.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/include/AE/Core" TYPE FILE FILES
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/AE/Core/AbstractState.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/AE/Core/AbstractValue.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/AE/Core/AddressValue.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/AE/Core/ICFGWTO.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/AE/Core/IntervalValue.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/AE/Core/NumericValue.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/AE/Core/RelExeState.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/AE/Core/RelationSolver.h"
    )
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/AE/Svfexe/AEDetector.h;/usr/local/include/AE/Svfexe/AbsExtAPI.h;/usr/local/include/AE/Svfexe/AbstractInterpretation.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/include/AE/Svfexe" TYPE FILE FILES
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/AE/Svfexe/AEDetector.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/AE/Svfexe/AbsExtAPI.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/AE/Svfexe/AbstractInterpretation.h"
    )
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/CFL/CFGNormalizer.h;/usr/local/include/CFL/CFGrammar.h;/usr/local/include/CFL/CFLAlias.h;/usr/local/include/CFL/CFLBase.h;/usr/local/include/CFL/CFLGramGraphChecker.h;/usr/local/include/CFL/CFLGraphBuilder.h;/usr/local/include/CFL/CFLSVFGBuilder.h;/usr/local/include/CFL/CFLSolver.h;/usr/local/include/CFL/CFLStat.h;/usr/local/include/CFL/CFLVF.h;/usr/local/include/CFL/GrammarBuilder.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/include/CFL" TYPE FILE FILES
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/CFL/CFGNormalizer.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/CFL/CFGrammar.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/CFL/CFLAlias.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/CFL/CFLBase.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/CFL/CFLGramGraphChecker.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/CFL/CFLGraphBuilder.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/CFL/CFLSVFGBuilder.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/CFL/CFLSolver.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/CFL/CFLStat.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/CFL/CFLVF.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/CFL/GrammarBuilder.h"
    )
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/DDA/ContextDDA.h;/usr/local/include/DDA/DDAClient.h;/usr/local/include/DDA/DDAPass.h;/usr/local/include/DDA/DDAStat.h;/usr/local/include/DDA/DDAVFSolver.h;/usr/local/include/DDA/FlowDDA.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/include/DDA" TYPE FILE FILES
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/DDA/ContextDDA.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/DDA/DDAClient.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/DDA/DDAPass.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/DDA/DDAStat.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/DDA/DDAVFSolver.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/DDA/FlowDDA.h"
    )
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/FastCluster/fastcluster.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/include/FastCluster" TYPE FILE FILES "/Users/jiayi/SVF-SourceCodeInfo/svf/include/FastCluster/fastcluster.h")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/Graphs/BasicBlockG.h;/usr/local/include/Graphs/CDG.h;/usr/local/include/Graphs/CFLGraph.h;/usr/local/include/Graphs/CHG.h;/usr/local/include/Graphs/CallGraph.h;/usr/local/include/Graphs/ConsG.h;/usr/local/include/Graphs/ConsGEdge.h;/usr/local/include/Graphs/ConsGNode.h;/usr/local/include/Graphs/DOTGraphTraits.h;/usr/local/include/Graphs/GenericGraph.h;/usr/local/include/Graphs/GraphPrinter.h;/usr/local/include/Graphs/GraphTraits.h;/usr/local/include/Graphs/GraphWriter.h;/usr/local/include/Graphs/ICFG.h;/usr/local/include/Graphs/ICFGEdge.h;/usr/local/include/Graphs/ICFGNode.h;/usr/local/include/Graphs/ICFGStat.h;/usr/local/include/Graphs/IRGraph.h;/usr/local/include/Graphs/SCC.h;/usr/local/include/Graphs/SVFG.h;/usr/local/include/Graphs/SVFGEdge.h;/usr/local/include/Graphs/SVFGNode.h;/usr/local/include/Graphs/SVFGOPT.h;/usr/local/include/Graphs/SVFGStat.h;/usr/local/include/Graphs/ThreadCallGraph.h;/usr/local/include/Graphs/VFG.h;/usr/local/include/Graphs/VFGEdge.h;/usr/local/include/Graphs/VFGNode.h;/usr/local/include/Graphs/WTO.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/include/Graphs" TYPE FILE FILES
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/BasicBlockG.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/CDG.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/CFLGraph.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/CHG.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/CallGraph.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/ConsG.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/ConsGEdge.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/ConsGNode.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/DOTGraphTraits.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/GenericGraph.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/GraphPrinter.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/GraphTraits.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/GraphWriter.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/ICFG.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/ICFGEdge.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/ICFGNode.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/ICFGStat.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/IRGraph.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/SCC.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/SVFG.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/SVFGEdge.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/SVFGNode.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/SVFGOPT.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/SVFGStat.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/ThreadCallGraph.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/VFG.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/VFGEdge.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/VFGNode.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Graphs/WTO.h"
    )
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/MSSA/MSSAMuChi.h;/usr/local/include/MSSA/MemPartition.h;/usr/local/include/MSSA/MemRegion.h;/usr/local/include/MSSA/MemSSA.h;/usr/local/include/MSSA/SVFGBuilder.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/include/MSSA" TYPE FILE FILES
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/MSSA/MSSAMuChi.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/MSSA/MemPartition.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/MSSA/MemRegion.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/MSSA/MemSSA.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/MSSA/SVFGBuilder.h"
    )
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/MTA/LockAnalysis.h;/usr/local/include/MTA/MHP.h;/usr/local/include/MTA/MTA.h;/usr/local/include/MTA/MTAStat.h;/usr/local/include/MTA/TCT.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/include/MTA" TYPE FILE FILES
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/MTA/LockAnalysis.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/MTA/MHP.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/MTA/MTA.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/MTA/MTAStat.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/MTA/TCT.h"
    )
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/MemoryModel/AbstractPointsToDS.h;/usr/local/include/MemoryModel/AccessPath.h;/usr/local/include/MemoryModel/ConditionalPT.h;/usr/local/include/MemoryModel/MutablePointsToDS.h;/usr/local/include/MemoryModel/PersistentPointsToCache.h;/usr/local/include/MemoryModel/PersistentPointsToDS.h;/usr/local/include/MemoryModel/PointerAnalysis.h;/usr/local/include/MemoryModel/PointerAnalysisImpl.h;/usr/local/include/MemoryModel/PointsTo.h;/usr/local/include/MemoryModel/SVFLoop.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/include/MemoryModel" TYPE FILE FILES
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/MemoryModel/AbstractPointsToDS.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/MemoryModel/AccessPath.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/MemoryModel/ConditionalPT.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/MemoryModel/MutablePointsToDS.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/MemoryModel/PersistentPointsToCache.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/MemoryModel/PersistentPointsToDS.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/MemoryModel/PointerAnalysis.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/MemoryModel/PointerAnalysisImpl.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/MemoryModel/PointsTo.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/MemoryModel/SVFLoop.h"
    )
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/SABER/DoubleFreeChecker.h;/usr/local/include/SABER/FileChecker.h;/usr/local/include/SABER/LeakChecker.h;/usr/local/include/SABER/ProgSlice.h;/usr/local/include/SABER/SaberCheckerAPI.h;/usr/local/include/SABER/SaberCondAllocator.h;/usr/local/include/SABER/SaberSVFGBuilder.h;/usr/local/include/SABER/SrcSnkDDA.h;/usr/local/include/SABER/SrcSnkSolver.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/include/SABER" TYPE FILE FILES
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/SABER/DoubleFreeChecker.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/SABER/FileChecker.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/SABER/LeakChecker.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/SABER/ProgSlice.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/SABER/SaberCheckerAPI.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/SABER/SaberCondAllocator.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/SABER/SaberSVFGBuilder.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/SABER/SrcSnkDDA.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/SABER/SrcSnkSolver.h"
    )
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/SVFIR/ObjTypeInfo.h;/usr/local/include/SVFIR/PAGBuilderFromFile.h;/usr/local/include/SVFIR/SVFIR.h;/usr/local/include/SVFIR/SVFStatements.h;/usr/local/include/SVFIR/SVFType.h;/usr/local/include/SVFIR/SVFValue.h;/usr/local/include/SVFIR/SVFVariables.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/include/SVFIR" TYPE FILE FILES
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/SVFIR/ObjTypeInfo.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/SVFIR/PAGBuilderFromFile.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/SVFIR/SVFIR.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/SVFIR/SVFStatements.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/SVFIR/SVFType.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/SVFIR/SVFValue.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/SVFIR/SVFVariables.h"
    )
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/Util/Annotator.h;/usr/local/include/Util/BitVector.h;/usr/local/include/Util/CDGBuilder.h;/usr/local/include/Util/CallGraphBuilder.h;/usr/local/include/Util/Casting.h;/usr/local/include/Util/CommandLine.h;/usr/local/include/Util/CoreBitVector.h;/usr/local/include/Util/CxtStmt.h;/usr/local/include/Util/DPItem.h;/usr/local/include/Util/ExtAPI.h;/usr/local/include/Util/GeneralType.h;/usr/local/include/Util/GraphReachSolver.h;/usr/local/include/Util/NodeIDAllocator.h;/usr/local/include/Util/Options.h;/usr/local/include/Util/PTAStat.h;/usr/local/include/Util/SVFBugReport.h;/usr/local/include/Util/SVFLoopAndDomInfo.h;/usr/local/include/Util/SVFStat.h;/usr/local/include/Util/SVFUtil.h;/usr/local/include/Util/SparseBitVector.h;/usr/local/include/Util/ThreadAPI.h;/usr/local/include/Util/WorkList.h;/usr/local/include/Util/Z3Expr.h;/usr/local/include/Util/cJSON.h;/usr/local/include/Util/iterator.h;/usr/local/include/Util/iterator_range.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/include/Util" TYPE FILE FILES
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/Annotator.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/BitVector.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/CDGBuilder.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/CallGraphBuilder.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/Casting.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/CommandLine.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/CoreBitVector.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/CxtStmt.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/DPItem.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/ExtAPI.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/GeneralType.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/GraphReachSolver.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/NodeIDAllocator.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/Options.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/PTAStat.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/SVFBugReport.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/SVFLoopAndDomInfo.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/SVFStat.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/SVFUtil.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/SparseBitVector.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/ThreadAPI.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/WorkList.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/Z3Expr.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/cJSON.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/iterator.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/Util/iterator_range.h"
    )
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/WPA/Andersen.h;/usr/local/include/WPA/AndersenPWC.h;/usr/local/include/WPA/CSC.h;/usr/local/include/WPA/FlowSensitive.h;/usr/local/include/WPA/Steensgaard.h;/usr/local/include/WPA/TypeAnalysis.h;/usr/local/include/WPA/VersionedFlowSensitive.h;/usr/local/include/WPA/WPAFSSolver.h;/usr/local/include/WPA/WPAPass.h;/usr/local/include/WPA/WPASolver.h;/usr/local/include/WPA/WPAStat.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/include/WPA" TYPE FILE FILES
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/WPA/Andersen.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/WPA/AndersenPWC.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/WPA/CSC.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/WPA/FlowSensitive.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/WPA/Steensgaard.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/WPA/TypeAnalysis.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/WPA/VersionedFlowSensitive.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/WPA/WPAFSSolver.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/WPA/WPAPass.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/WPA/WPASolver.h"
    "/Users/jiayi/SVF-SourceCodeInfo/svf/include/WPA/WPAStat.h"
    )
endif()

