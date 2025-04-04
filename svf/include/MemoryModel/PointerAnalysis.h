//===- PointerAnalysis.h -- Base class of pointer analyses--------------------//
//
//                     SVF: Static Value-Flow Analysis
//
// Copyright (C) <2013->  <Yulei Sui>
//

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.

// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//===----------------------------------------------------------------------===//

/*
 * PointerAnalysis.h
 *
 *  Created on: Nov 12, 2013
 *      Author: Yulei Sui
 */

#ifndef POINTERANALYSIS_H_
#define POINTERANALYSIS_H_

#include <unistd.h>
#include <signal.h>

#include "Graphs/CHG.h"
#include "Graphs/ThreadCallGraph.h"
#include "Graphs/SCC.h"
#include "MemoryModel/AbstractPointsToDS.h"
#include "MemoryModel/ConditionalPT.h"
#include "MemoryModel/MutablePointsToDS.h"
#include "MemoryModel/PersistentPointsToDS.h"
#include "MemoryModel/PointsTo.h"
#include "SVFIR/SVFIR.h"

namespace SVF
{

class CommonCHGraph;

class ICFG;
class PTAStat;
/*
 * Pointer Analysis Base Class
 */
class PointerAnalysis
{

public:
    /// Pointer analysis type list
    enum PTATY
    {
        // Whole program analysis
        Andersen_BASE,		///< Base Andersen PTA
        Andersen_WPA,		///< Andersen PTA
        AndersenSCD_WPA,    ///< Selective cycle detection andersen-style WPA
        AndersenSFR_WPA,    ///< Stride-based field representation
        AndersenWaveDiff_WPA,	///< Diff wave propagation andersen-style WPA
        Steensgaard_WPA,      ///< Steensgaard PTA
        CSCallString_WPA,	///< Call string based context sensitive WPA
        CSSummary_WPA,		///< Summary based context sensitive WPA
        FSDATAFLOW_WPA,	///< Traditional Dataflow-based flow sensitive WPA
        FSSPARSE_WPA,		///< Sparse flow sensitive WPA
        VFS_WPA,		///< Versioned sparse flow-sensitive WPA
        FSCS_WPA,			///< Flow-, context- sensitive WPA
        CFLFICI_WPA,		///< Flow-, context-, insensitive CFL-reachability-based analysis
        CFLFSCI_WPA,		///< Flow-insensitive, context-sensitive CFL-reachability-based analysis
        CFLFSCS_WPA,	///< Flow-, context-, CFL-reachability-based analysis
        TypeCPP_WPA, ///<  Type-based analysis for C++

        // Demand driven analysis
        FieldS_DDA,		///< Field sensitive DDA
        FlowS_DDA,		///< Flow sensitive DDA
        PathS_DDA,		///< Guarded value-flow DDA
        Cxt_DDA,		///< context sensitive DDA


        Default_PTA		///< default pta without any analysis
    };

    /// Implementation type: BVDataPTAImpl or CondPTAImpl.
    enum PTAImplTy
    {
        BaseImpl,   ///< Represents PointerAnalaysis.
        BVDataImpl, ///< Represents BVDataPTAImpl.
        CondImpl,   ///< Represents CondPTAImpl.
    };

    /// Indirect call edges type, map a callsite to a set of callees
    //@{
    typedef Set<const CallICFGNode*> CallSiteSet;
    typedef SVFIR::CallSiteToFunPtrMap CallSiteToFunPtrMap;
    typedef Set<const FunObjVar*> FunctionSet;
    typedef OrderedMap<const CallICFGNode*, FunctionSet> CallEdgeMap;
    typedef SCCDetection<CallGraph*> CallGraphSCC;
    typedef Set<const GlobalObjVar*> VTableSet;
    typedef Set<const FunObjVar*> VFunSet;
    //@}

    static const std::string aliasTestMayAlias;
    static const std::string aliasTestMayAliasMangled;
    static const std::string aliasTestNoAlias;
    static const std::string aliasTestNoAliasMangled;
    static const std::string aliasTestPartialAlias;
    static const std::string aliasTestPartialAliasMangled;
    static const std::string aliasTestMustAlias;
    static const std::string aliasTestMustAliasMangled;
    static const std::string aliasTestFailMayAlias;
    static const std::string aliasTestFailMayAliasMangled;
    static const std::string aliasTestFailNoAlias;
    static const std::string aliasTestFailNoAliasMangled;

private:
    /// Release the memory
    void destroy();

protected:

    /// User input flags
    //@{
    /// Flag for printing the statistic results
    bool print_stat;
    /// Flag for validating points-to/alias results
    bool alias_validation;
    /// Flag for iteration budget for on-the-fly statistics
    u32_t OnTheFlyIterBudgetForStat;
    //@}

    /// SVFIR
    static SVFIR* pag;
    /// Pointer analysis Type
    PTATY ptaTy;
    /// PTA implementation type.
    PTAImplTy ptaImplTy;
    /// Statistics
    PTAStat* stat;
    /// Call graph used for pointer analysis
    CallGraph* callgraph;
    /// SCC for PTACallGraph
    CallGraphSCC* callGraphSCC;
    /// Interprocedural control-flow graph
    ICFG* icfg;
    /// CHGraph
    CommonCHGraph *chgraph;

public:
    /// Get ICFG
    inline ICFG* getICFG() const
    {
        return pag->getICFG();
    }
    /// Return number of resolved indirect call edges
    inline u32_t getNumOfResolvedIndCallEdge() const
    {
        return getCallGraph()->getNumOfResolvedIndCallEdge();
    }
    /// Return call graph
    inline CallGraph* getCallGraph() const
    {
        return callgraph;
    }
    /// Return call graph SCC
    inline CallGraphSCC* getCallGraphSCC() const
    {
        return callGraphSCC;
    }

    /// Constructor
    PointerAnalysis(SVFIR* pag, PTATY ty = Default_PTA, bool alias_check = true);

    /// Type of pointer analysis
    inline PTATY getAnalysisTy() const
    {
        return ptaTy;
    }

    /// Return implementation type of the pointer analysis.
    inline PTAImplTy getImplTy() const
    {
        return ptaImplTy;
    }

    /// Get/set SVFIR
    ///@{
    inline SVFIR* getPAG() const
    {
        return pag;
    }
    //@}

    /// Get PTA stat
    inline PTAStat* getStat() const
    {
        return stat;
    }

    /// Get all Valid Pointers for resolution
    inline OrderedNodeSet& getAllValidPtrs()
    {
        return pag->getAllValidPtrs();
    }

    /// Destructor
    virtual ~PointerAnalysis();

    /// Initialization of a pointer analysis, including building symbol table and SVFIR etc.
    virtual void initialize();

    /// Finalization of a pointer analysis, including checking alias correctness
    virtual void finalize();

    /// Start Analysis here (main part of pointer analysis). It needs to be implemented in child class
    virtual void analyze() = 0;

    /// Compute points-to results on-demand, overridden by derived classes
    virtual void computeDDAPts(NodeID) {}

    /// Interface exposed to users of our pointer analysis, given Value infos
    virtual AliasResult alias(const SVFVar* V1,
                              const SVFVar* V2) = 0;

    /// Interface exposed to users of our pointer analysis, given PAGNodeID
    virtual AliasResult alias(NodeID node1, NodeID node2) = 0;

    /// Get points-to targets of a pointer. It needs to be implemented in child class
    virtual const PointsTo& getPts(NodeID ptr) = 0;

    /// Given an object, get all the nodes having whose pointsto contains the object.
    /// Similar to getPts, this also needs to be implemented in child classes.
    virtual const NodeSet& getRevPts(NodeID nodeId) = 0;

    /// Print targets of a function pointer
    void printIndCSTargets(const CallICFGNode* cs, const FunctionSet& targets);

    // Debug purpose
    //@{
    virtual void dumpTopLevelPtsTo() {}
    virtual void dumpAllPts() {}
    virtual void dumpCPts() {}
    virtual void dumpPts(NodeID ptr, const PointsTo& pts);
    void printIndCSTargets();
    void dumpAllTypes();
    //@}

protected:
    /// Return all indirect callsites
    inline const CallSiteToFunPtrMap& getIndirectCallsites() const
    {
        return pag->getIndirectCallsites();
    }
    /// Return function pointer PAGNode at a callsite cs
    inline NodeID getFunPtr(const CallICFGNode* cs) const
    {
        return pag->getFunPtr(cs);
    }
    /// Alias check functions to verify correctness of pointer analysis
    //@{
    virtual void validateTests();
    virtual void validateSuccessTests(std::string fun);
    virtual void validateExpectedFailureTests(std::string fun);
    //@}

    /// Reset all object node as field-sensitive.
    void resetObjFieldSensitive();

public:
    /// Dump the statistics
    void dumpStat();

    /// Determine whether a points-to contains a black hole or constant node
    //@{
    inline bool containBlackHoleNode(const PointsTo& pts)
    {
        return pts.test(pag->getBlackHoleNode());
    }
    inline bool containConstantNode(const PointsTo& pts)
    {
        return pts.test(pag->getConstantNode());
    }
    virtual inline bool isBlkObjOrConstantObj(NodeID ptd) const
    {
        return pag->isBlkObjOrConstantObj(ptd);
    }
    //@}

    /// Whether this object is heap or array
    //@{
    inline bool isHeapMemObj(NodeID id) const
    {
        return pag->getBaseObject(id) && SVFUtil::isa<HeapObjVar, DummyObjVar>(pag->getBaseObject(id));
    }

    inline bool isArrayMemObj(NodeID id) const
    {
        const BaseObjVar* obj = pag->getBaseObject(id);
        assert(obj && "base object is null??");
        return obj->isArray();
    }
    //@}

    /// For field-sensitivity
    ///@{
    inline bool isFIObjNode(NodeID id) const
    {
        return (SVFUtil::isa<BaseObjVar>(pag->getGNode(id)));
    }
    inline NodeID getBaseObjVar(NodeID id)
    {
        return pag->getBaseObjVar(id);
    }
    inline NodeID getFIObjVar(NodeID id)
    {
        return pag->getFIObjVar(id);
    }
    inline NodeID getGepObjVar(NodeID id, const APOffset& ap)
    {
        return pag->getGepObjVar(id, ap);
    }
    virtual inline const NodeBS& getAllFieldsObjVars(NodeID id)
    {
        return pag->getAllFieldsObjVars(id);
    }
    inline void setObjFieldInsensitive(NodeID id)
    {
        BaseObjVar* baseObj = const_cast<BaseObjVar*>(pag->getBaseObject(id));
        baseObj->setFieldInsensitive();
    }
    inline bool isFieldInsensitive(NodeID id) const
    {
        const BaseObjVar* baseObj = pag->getBaseObject(id);
        return baseObj->isFieldInsensitive();
    }
    ///@}

    /// Whether print statistics
    inline bool printStat()
    {
        return print_stat;
    }

    /// Whether print statistics
    inline void disablePrintStat()
    {
        print_stat = false;
    }

    /// Get callees from an indirect callsite
    //@{
    inline CallEdgeMap& getIndCallMap()
    {
        return getCallGraph()->getIndCallMap();
    }
    inline bool hasIndCSCallees(const CallICFGNode* cs) const
    {
        return getCallGraph()->hasIndCSCallees(cs);
    }
    inline const FunctionSet& getIndCSCallees(const CallICFGNode* cs) const
    {
        return getCallGraph()->getIndCSCallees(cs);
    }
    //@}

    /// Resolve indirect call edges
    virtual void resolveIndCalls(const CallICFGNode* cs, const PointsTo& target, CallEdgeMap& newEdges);

    /// PTACallGraph SCC related methods
    //@{
    /// PTACallGraph SCC detection
    inline void callGraphSCCDetection()
    {
        if(callGraphSCC==nullptr)
            callGraphSCC = new CallGraphSCC(callgraph);

        callGraphSCC->find();
    }
    /// Get SCC rep node of a SVFG node.
    inline NodeID getCallGraphSCCRepNode(NodeID id) const
    {
        return callGraphSCC->repNode(id);
    }
    /// Return TRUE if this edge is inside a PTACallGraph SCC, i.e., src node and dst node are in the same SCC on the SVFG.
    inline bool inSameCallGraphSCC(const FunObjVar* fun1,const FunObjVar* fun2)
    {
        const CallGraphNode* src = callgraph->getCallGraphNode(fun1);
        const CallGraphNode* dst = callgraph->getCallGraphNode(fun2);
        return (getCallGraphSCCRepNode(src->getId()) == getCallGraphSCCRepNode(dst->getId()));
    }
    inline bool isInRecursion(const FunObjVar* fun) const
    {
        return callGraphSCC->isInCycle(callgraph->getCallGraphNode(fun)->getId());
    }
    /// Whether a local variable is in function recursions
    bool isLocalVarInRecursiveFun(NodeID id) const;
    //@}

    /// Return PTA name
    virtual const std::string PTAName() const
    {
        return "Pointer Analysis";
    }

    /// get CHGraph
    CommonCHGraph *getCHGraph() const
    {
        return chgraph;
    }

    void getVFnsFromCHA(const CallICFGNode* cs, VFunSet &vfns);
    void getVFnsFromPts(const CallICFGNode* cs, const PointsTo &target, VFunSet &vfns);
    void connectVCallToVFns(const CallICFGNode* cs, const VFunSet &vfns, CallEdgeMap& newEdges);
    virtual void resolveCPPIndCalls(const CallICFGNode* cs,
                                    const PointsTo& target,
                                    CallEdgeMap& newEdges);
};

} // End namespace SVF

#endif /* POINTERANALYSIS_H_ */
