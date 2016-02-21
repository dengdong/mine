//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by adminstrator on 16/2/13.
//  Copyright © 2016年 ddd.cc. All rights reserved.
//

import Foundation


class CalculatorBrain {
    
    enum Op   {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
        
        
        var description :String {
            switch self {
            case .Operand(let operand ):
                return "\(operand)"
            case .UnaryOperation(let symbol, _):
                return "\(symbol)"
            case .BinaryOperation(let symbol , _):
                return "\(symbol)"
            }
        }
    }
    
    var opStack = [Op]()
    
    var knownOps = [String: Op]()
    
    init () {
        knownOps["+"] = Op.BinaryOperation("+", +)
        knownOps["−"] = Op.BinaryOperation("−"){$1 - $0}
        knownOps["×"] = Op.BinaryOperation("×", * )
        knownOps["÷"] = Op.BinaryOperation("÷"){$1 / $0}
        knownOps["√"] = Op.UnaryOperation("√", sqrt)
    }
    
    
    var program : AnyObject { // guaranteed to be a PropertyList
        get {
            return opStack.map{ $0.description}
        }
        set{
            if let opSymbols = newValue as? Array<String>{
                var newOpStack = [Op]()
                for opSymbol in opSymbols {
                    if let op = knownOps[opSymbol] {
                        newOpStack.append(op)
                    }else if let operand = NSNumberFormatter().numberFromString(opSymbol)?.doubleValue {
                        newOpStack.append(.Operand(operand))
                    }
                }
                opStack = newOpStack
            }
        }
    }
    
    
    func evaluate(ops:[Op]) ->(result : Double?, remainingOps : [Op]) {
        
        if !ops.isEmpty {
            var remainOps = ops
            let op = remainOps.removeLast()
            switch op {
            case .Operand(let operand):
                return ( operand, remainOps)
            case .UnaryOperation(_, let operation):
                let operandEvaluation = evaluate(remainOps)
                if let operand = operandEvaluation.result {
                    return (operation(operand), operandEvaluation.remainingOps)
                }
            case .BinaryOperation(_, let operation ):
                let op1Evaluation = evaluate(remainOps)
                if let operand1 = op1Evaluation.result{
                    let op2Evaluation = evaluate(op1Evaluation.remainingOps)
                    if let operand2 = op2Evaluation.result {
                        return (operation(operand1, operand2), op2Evaluation.remainingOps)
                    }
                }
                
            }
        }
        return (nil, ops)
    }
    
    func evaluate() -> Double?{
        
        let (result,remainder ) = evaluate(opStack)
        print(" opstack =\(opStack) , result = \(result) , remainder = \(remainder) ")
        return result
        
    }
    
    func pushOperand(operand: Double) -> Double?{
        opStack.append(Op.Operand(operand))
        return evaluate()
    }
    
    func performOperation(symbol : String ) -> Double? {
        if let operation = knownOps[symbol] {
            opStack.append(operation)
        }
        return evaluate()
    }
}

