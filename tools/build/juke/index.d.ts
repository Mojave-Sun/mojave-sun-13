// Generated by dts-bundle-generator v5.9.0

/// <reference types="node" />

import _chalk from 'chalk';
import { SpawnOptionsWithoutStdio } from 'child_process';

export declare class ExitCode extends Error {
	code: number | null;
	signal: string | null;
	constructor(code: number | null, signal?: string | null);
}
export declare type ExecOptions = SpawnOptionsWithoutStdio & {
	/**
	 * If `true`, this exec call will not pipe its output to stdio.
	 * @default false
	 */
	silent?: boolean;
	/**
	 * Throw an exception on non-zero exit code.
	 * @default true
	 */
	throw?: boolean;
};
export declare type ExecReturn = {
	/** Exit code of the program. */
	code: number | null;
	/** Signal received by the program which caused it to exit. */
	signal: NodeJS.Signals | null;
	/** Output collected from `stdout` */
	stdout: string;
	/** Output collected from `stderr` */
	stderr: string;
	/** A combined output collected from `stdout` and `stderr`. */
	combined: string;
};
export declare const exec: (executable: string, args?: string[], options?: ExecOptions) => Promise<ExecReturn>;
export declare const logger: {
	log: (...args: unknown[]) => void;
	error: (...args: unknown[]) => void;
	action: (...args: unknown[]) => void;
	warn: (...args: unknown[]) => void;
	info: (...args: unknown[]) => void;
	debug: (...args: unknown[]) => void;
};
export declare type ParameterType = (string | string[] | number | number[] | boolean | boolean[]);
export declare type ParameterStringType = ("string" | "string[]" | "number" | "number[]" | "boolean" | "boolean[]");
export declare type ParameterTypeByString<T extends ParameterStringType> = (T extends "string" ? string : T extends "string[]" ? string[] : T extends "number" ? number : T extends "number[]" ? number[] : T extends "boolean" ? boolean : T extends "boolean[]" ? boolean[] : never);
export declare type ParameterConfig<T extends ParameterStringType> = {
	/**
	 * Parameter name, in "camelCase".
	 */
	readonly name: string;
	/**
	 * Parameter type, one of:
	 * - `string`
	 * - `string[]`
	 * - `number`
	 * - `number[]`
	 * - `boolean`
	 * - `boolean[]`
	 */
	readonly type: T;
	/**
	 * Short flag for use in CLI, can only be a single character.
	 */
	readonly alias?: string;
};
export declare type ParameterCreator = <T extends ParameterStringType>(config: ParameterConfig<T>) => Parameter<ParameterTypeByString<T>>;
declare class Parameter<T extends ParameterType = any> {
	readonly name: string;
	readonly type: ParameterStringType;
	readonly alias?: string | undefined;
	constructor(name: string, type: ParameterStringType, alias?: string | undefined);
	isString(): T extends string | string[] ? true : false;
	isNumber(): T extends number | number[] ? true : false;
	isBoolean(): T extends boolean | boolean[] ? true : false;
	isArray(): T extends Array<unknown> ? true : false;
	toKebabCase(): string;
	toConstCase(): string;
	toCamelCase(): string;
}
export declare type ExecutionContext = {
	/** Get parameter value. */
	get: <T extends ParameterType>(parameter: Parameter<T>) => (T extends Array<unknown> ? T : T | null);
};
export declare type BooleanLike = boolean | null | undefined;
export declare type WithExecutionContext<R> = (context: ExecutionContext) => R | Promise<R>;
export declare type WithOptionalExecutionContext<R> = R | WithExecutionContext<R>;
export declare type DependsOn = WithOptionalExecutionContext<(Target | BooleanLike)[]>;
export declare type ExecutesFn = WithExecutionContext<unknown>;
export declare type OnlyWhenFn = WithExecutionContext<BooleanLike>;
export declare type FileIo = WithOptionalExecutionContext<(string | BooleanLike)[]>;
export declare type Target = {
	name: string;
	dependsOn: DependsOn;
	executes?: ExecutesFn;
	inputs: FileIo;
	outputs: FileIo;
	parameters: Parameter[];
	onlyWhen?: OnlyWhenFn;
};
export declare type TargetConfig = {
	/**
	 * Target name. This parameter is required.
	 */
	name: string;
	/**
	 * Dependencies for this target. They will be ran before executing this
	 * target, and may run in parallel.
	 */
	dependsOn?: DependsOn;
	/**
	 * Function that is delegated to the execution engine for building this
	 * target. It is normally an async function, which accepts a single
	 * argument - execution context (contains `get` for interacting with
	 * parameters).
	 *
	 * @example
	 * executes: async ({ get }) => {
	 *   console.log(get(Parameter));
	 * },
	 */
	executes?: ExecutesFn;
	/**
	 * Files that are consumed by this target.
	 */
	inputs?: FileIo;
	/**
	 * Files that are produced by this target. Additionally, they are also
	 * touched every time target finishes executing in order to stop
	 * this target from re-running.
	 */
	outputs?: FileIo;
	/**
	 * Parameters that are local to this task. Can be retrieved via `get`
	 * in the executor function.
	 */
	parameters?: Parameter[];
	/**
	 * Target will run only when this function returns true. It accepts a
	 * single argument - execution context.
	 */
	onlyWhen?: OnlyWhenFn;
};
export declare type TargetCreator = (target: TargetConfig) => Target;
export declare type RunnerConfig = {
	targets?: Target[];
	default?: Target;
	parameters?: Parameter[];
};
export declare const chalk: _chalk.Chalk & _chalk.ChalkFunction & {
	supportsColor: false | _chalk.ColorSupport;
	Level: _chalk.Level;
	Color: ("black" | "red" | "green" | "yellow" | "blue" | "magenta" | "cyan" | "white" | "gray" | "grey" | "blackBright" | "redBright" | "greenBright" | "yellowBright" | "blueBright" | "magentaBright" | "cyanBright" | "whiteBright") | ("bgBlack" | "bgRed" | "bgGreen" | "bgYellow" | "bgBlue" | "bgMagenta" | "bgCyan" | "bgWhite" | "bgGray" | "bgGrey" | "bgBlackBright" | "bgRedBright" | "bgGreenBright" | "bgYellowBright" | "bgBlueBright" | "bgMagentaBright" | "bgCyanBright" | "bgWhiteBright");
	ForegroundColor: "black" | "red" | "green" | "yellow" | "blue" | "magenta" | "cyan" | "white" | "gray" | "grey" | "blackBright" | "redBright" | "greenBright" | "yellowBright" | "blueBright" | "magentaBright" | "cyanBright" | "whiteBright";
	BackgroundColor: "bgBlack" | "bgRed" | "bgGreen" | "bgYellow" | "bgBlue" | "bgMagenta" | "bgCyan" | "bgWhite" | "bgGray" | "bgGrey" | "bgBlackBright" | "bgRedBright" | "bgGreenBright" | "bgYellowBright" | "bgBlueBright" | "bgMagentaBright" | "bgCyanBright" | "bgWhiteBright";
	Modifiers: "bold" | "reset" | "dim" | "italic" | "underline" | "inverse" | "hidden" | "strikethrough" | "visible";
	stderr: _chalk.Chalk & {
		supportsColor: false | _chalk.ColorSupport;
	};
};
export declare const glob: typeof import("glob");
/**
 * Configures Juke Build and starts executing targets.
 *
 * @param config Juke Build configuration.
 * @returns Exit code of the whole runner process.
 */
export declare const setup: (config?: RunnerConfig) => Promise<number>;
export declare const createTarget: TargetCreator;
export declare const createParameter: ParameterCreator;
export declare const sleep: (time: number) => Promise<unknown>;
/**
 * Resolves a glob pattern and returns files that are safe
 * to call `stat` on.
 */
export declare const resolveGlob: (globPath: string) => string[];

export {};
