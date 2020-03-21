//
//  StringExtensions+HTMLEntitiesList.swift
//  XUCore
//
//  Created by Charlie Monroe on 3/21/20.
//  Copyright © 2020 Charlie Monroe Software. All rights reserved.
//

import Foundation

internal let htmlEntityNameMapping: [String : String] = [
	"&AElig;": "Æ",
	"&AMP;": "&",
	"&Acy;": "А",
	"&Afr;": "𝔄",
	"&Alpha;": "Α",
	"&And;": "⩓",
	"&Aopf;": "𝔸",
	"&ApplyFunction;": "⁡",
	"&Ascr;": "𝒜",
	"&Assign;": "≔",
	"&Backslash;": "∖",
	"&Barv;": "⫧",
	"&Barwed;": "⌆",
	"&Bcy;": "Б",
	"&Because;": "∵",
	"&Bernoullis;": "ℬ",
	"&Beta;": "Β",
	"&Bfr;": "𝔅",
	"&Bopf;": "𝔹",
	"&Breve;": "˘",
	"&Bscr;": "ℬ",
	"&Bumpeq;": "≎",
	"&CHcy;": "Ч",
	"&COPY;": "©",
	"&Cap;": "⋒",
	"&CapitalDifferentialD;": "ⅅ",
	"&Cayleys;": "ℭ",
	"&Ccedil;": "Ç",
	"&Cconint;": "∰",
	"&Cedilla;": "¸",
	"&CenterDot;": "·",
	"&Cfr;": "ℭ",
	"&Chi;": "Χ",
	"&CircleDot;": "⊙",
	"&CircleMinus;": "⊖",
	"&CirclePlus;": "⊕",
	"&CircleTimes;": "⊗",
	"&ClockwiseContourIntegral;": "∲",
	"&CloseCurlyDoubleQuote;": "”",
	"&CloseCurlyQuote;": "’",
	"&Colon;": "∷",
	"&Colone;": "⩴",
	"&Congruent;": "≡",
	"&Conint;": "∯",
	"&ContourIntegral;": "∮",
	"&Copf;": "ℂ",
	"&Coproduct;": "∐",
	"&CounterClockwiseContourIntegral;": "∳",
	"&Cross;": "⨯",
	"&Cscr;": "𝒞",
	"&Cup;": "⋓",
	"&CupCap;": "≍",
	"&DD;": "ⅅ",
	"&DDotrahd;": "⤑",
	"&DJcy;": "Ђ",
	"&DScy;": "Ѕ",
	"&DZcy;": "Џ",
	"&Dagger;": "‡",
	"&Darr;": "↡",
	"&Dashv;": "⫤",
	"&Dcy;": "Д",
	"&Del;": "∇",
	"&Delta;": "Δ",
	"&Dfr;": "𝔇",
	"&DiacriticalAcute;": "´",
	"&DiacriticalDot;": "˙",
	"&DiacriticalDoubleAcute;": "˝",
	"&DiacriticalGrave;": "`",
	"&DiacriticalTilde;": "˜",
	"&Diamond;": "⋄",
	"&DifferentialD;": "ⅆ",
	"&Dopf;": "𝔻",
	"&Dot;": "¨",
	"&DotDot;": "⃜",
	"&DotEqual;": "≐",
	"&DoubleContourIntegral;": "∯",
	"&DoubleDot;": "¨",
	"&DoubleDownArrow;": "⇓",
	"&DoubleLeftArrow;": "⇐",
	"&DoubleLeftRightArrow;": "⇔",
	"&DoubleLeftTee;": "⫤",
	"&DoubleLongLeftArrow;": "⟸",
	"&DoubleLongLeftRightArrow;": "⟺",
	"&DoubleLongRightArrow;": "⟹",
	"&DoubleRightArrow;": "⇒",
	"&DoubleRightTee;": "⊨",
	"&DoubleUpArrow;": "⇑",
	"&DoubleUpDownArrow;": "⇕",
	"&DoubleVerticalBar;": "∥",
	"&DownArrow;": "↓",
	"&DownArrowBar;": "⤓",
	"&DownArrowUpArrow;": "⇵",
	"&DownBreve;": "̑",
	"&DownLeftRightVector;": "⥐",
	"&DownLeftTeeVector;": "⥞",
	"&DownLeftVector;": "↽",
	"&DownLeftVectorBar;": "⥖",
	"&DownRightTeeVector;": "⥟",
	"&DownRightVector;": "⇁",
	"&DownRightVectorBar;": "⥗",
	"&DownTee;": "⊤",
	"&DownTeeArrow;": "↧",
	"&Downarrow;": "⇓",
	"&Dscr;": "𝒟",
	"&Dstrok;": "Đ",
	"&ENG;": "Ŋ",
	"&ETH;": "Ð",
	"&Ecy;": "Э",
	"&Efr;": "𝔈",
	"&Element;": "∈",
	"&EmptySmallSquare;": "◻",
	"&EmptyVerySmallSquare;": "▫",
	"&Eopf;": "𝔼",
	"&Epsilon;": "Ε",
	"&Equal;": "⩵",
	"&EqualTilde;": "≂",
	"&Equilibrium;": "⇌",
	"&Escr;": "ℰ",
	"&Esim;": "⩳",
	"&Eta;": "Η",
	"&Exists;": "∃",
	"&ExponentialE;": "ⅇ",
	"&Fcy;": "Ф",
	"&Ffr;": "𝔉",
	"&FilledSmallSquare;": "◼",
	"&FilledVerySmallSquare;": "▪",
	"&Fopf;": "𝔽",
	"&ForAll;": "∀",
	"&Fouriertrf;": "ℱ",
	"&Fscr;": "ℱ",
	"&GJcy;": "Ѓ",
	"&GT;": ">",
	"&Gamma;": "Γ",
	"&Gammad;": "Ϝ",
	"&Gcedil;": "Ģ",
	"&Gcy;": "Г",
	"&Gfr;": "𝔊",
	"&Gg;": "⋙",
	"&Gopf;": "𝔾",
	"&GreaterEqual;": "≥",
	"&GreaterEqualLess;": "⋛",
	"&GreaterFullEqual;": "≧",
	"&GreaterGreater;": "⪢",
	"&GreaterLess;": "≷",
	"&GreaterSlantEqual;": "⩾",
	"&GreaterTilde;": "≳",
	"&Gscr;": "𝒢",
	"&Gt;": "≫",
	"&HARDcy;": "Ъ",
	"&Hacek;": "ˇ",
	"&Hat;": "^",
	"&Hfr;": "ℌ",
	"&HilbertSpace;": "ℋ",
	"&Hopf;": "ℍ",
	"&HorizontalLine;": "─",
	"&Hscr;": "ℋ",
	"&Hstrok;": "Ħ",
	"&HumpDownHump;": "≎",
	"&HumpEqual;": "≏",
	"&IEcy;": "Е",
	"&IJlig;": "Ĳ",
	"&IOcy;": "Ё",
	"&Icy;": "И",
	"&Ifr;": "ℑ",
	"&Im;": "ℑ",
	"&ImaginaryI;": "ⅈ",
	"&Implies;": "⇒",
	"&Int;": "∬",
	"&Integral;": "∫",
	"&Intersection;": "⋂",
	"&InvisibleComma;": "⁣",
	"&InvisibleTimes;": "⁢",
	"&Iopf;": "𝕀",
	"&Iota;": "Ι",
	"&Iscr;": "ℐ",
	"&Iukcy;": "І",
	"&Jcy;": "Й",
	"&Jfr;": "𝔍",
	"&Jopf;": "𝕁",
	"&Jscr;": "𝒥",
	"&Jsercy;": "Ј",
	"&Jukcy;": "Є",
	"&KHcy;": "Х",
	"&KJcy;": "Ќ",
	"&Kappa;": "Κ",
	"&Kcedil;": "Ķ",
	"&Kcy;": "К",
	"&Kfr;": "𝔎",
	"&Kopf;": "𝕂",
	"&Kscr;": "𝒦",
	"&LJcy;": "Љ",
	"&LT;": "<",
	"&Lambda;": "Λ",
	"&Lang;": "⟪",
	"&Laplacetrf;": "ℒ",
	"&Larr;": "↞",
	"&Lcedil;": "Ļ",
	"&Lcy;": "Л",
	"&LeftAngleBracket;": "⟨",
	"&LeftArrow;": "←",
	"&LeftArrowBar;": "⇤",
	"&LeftArrowRightArrow;": "⇆",
	"&LeftCeiling;": "⌈",
	"&LeftDoubleBracket;": "⟦",
	"&LeftDownTeeVector;": "⥡",
	"&LeftDownVector;": "⇃",
	"&LeftDownVectorBar;": "⥙",
	"&LeftFloor;": "⌊",
	"&LeftRightArrow;": "↔",
	"&LeftRightVector;": "⥎",
	"&LeftTee;": "⊣",
	"&LeftTeeArrow;": "↤",
	"&LeftTeeVector;": "⥚",
	"&LeftTriangle;": "⊲",
	"&LeftTriangleBar;": "⧏",
	"&LeftTriangleEqual;": "⊴",
	"&LeftUpDownVector;": "⥑",
	"&LeftUpTeeVector;": "⥠",
	"&LeftUpVector;": "↿",
	"&LeftUpVectorBar;": "⥘",
	"&LeftVector;": "↼",
	"&LeftVectorBar;": "⥒",
	"&Leftarrow;": "⇐",
	"&Leftrightarrow;": "⇔",
	"&LessEqualGreater;": "⋚",
	"&LessFullEqual;": "≦",
	"&LessGreater;": "≶",
	"&LessLess;": "⪡",
	"&LessSlantEqual;": "⩽",
	"&LessTilde;": "≲",
	"&Lfr;": "𝔏",
	"&Ll;": "⋘",
	"&Lleftarrow;": "⇚",
	"&Lmidot;": "Ŀ",
	"&LongLeftArrow;": "⟵",
	"&LongLeftRightArrow;": "⟷",
	"&LongRightArrow;": "⟶",
	"&Longleftarrow;": "⟸",
	"&Longleftrightarrow;": "⟺",
	"&Longrightarrow;": "⟹",
	"&Lopf;": "𝕃",
	"&LowerLeftArrow;": "↙",
	"&LowerRightArrow;": "↘",
	"&Lscr;": "ℒ",
	"&Lsh;": "↰",
	"&Lstrok;": "Ł",
	"&Lt;": "≪",
	"&Map;": "⤅",
	"&Mcy;": "М",
	"&MediumSpace;": " ",
	"&Mellintrf;": "ℳ",
	"&Mfr;": "𝔐",
	"&MinusPlus;": "∓",
	"&Mopf;": "𝕄",
	"&Mscr;": "ℳ",
	"&Mu;": "Μ",
	"&NJcy;": "Њ",
	"&Ncedil;": "Ņ",
	"&Ncy;": "Н",
	"&NegativeMediumSpace;": "​",
	"&NegativeThickSpace;": "​",
	"&NegativeThinSpace;": "​",
	"&NegativeVeryThinSpace;": "​",
	"&NestedGreaterGreater;": "≫",
	"&NestedLessLess;": "≪",
	"&NewLine;": "\n",
	"&Nfr;": "𝔑",
	"&NoBreak;": "⁠",
	"&NonBreakingSpace;": " ",
	"&Nopf;": "ℕ",
	"&Not;": "⫬",
	"&NotCongruent;": "≢",
	"&NotCupCap;": "≭",
	"&NotDoubleVerticalBar;": "∦",
	"&NotElement;": "∉",
	"&NotEqual;": "≠",
	"&NotEqualTilde;": "≂̸",
	"&NotExists;": "∄",
	"&NotGreater;": "≯",
	"&NotGreaterEqual;": "≱",
	"&NotGreaterFullEqual;": "≧̸",
	"&NotGreaterGreater;": "≫̸",
	"&NotGreaterLess;": "≹",
	"&NotGreaterSlantEqual;": "⩾̸",
	"&NotGreaterTilde;": "≵",
	"&NotHumpDownHump;": "≎̸",
	"&NotHumpEqual;": "≏̸",
	"&NotLeftTriangle;": "⋪",
	"&NotLeftTriangleBar;": "⧏̸",
	"&NotLeftTriangleEqual;": "⋬",
	"&NotLess;": "≮",
	"&NotLessEqual;": "≰",
	"&NotLessGreater;": "≸",
	"&NotLessLess;": "≪̸",
	"&NotLessSlantEqual;": "⩽̸",
	"&NotLessTilde;": "≴",
	"&NotNestedGreaterGreater;": "⪢̸",
	"&NotNestedLessLess;": "⪡̸",
	"&NotPrecedes;": "⊀",
	"&NotPrecedesEqual;": "⪯̸",
	"&NotPrecedesSlantEqual;": "⋠",
	"&NotReverseElement;": "∌",
	"&NotRightTriangle;": "⋫",
	"&NotRightTriangleBar;": "⧐̸",
	"&NotRightTriangleEqual;": "⋭",
	"&NotSquareSubset;": "⊏̸",
	"&NotSquareSubsetEqual;": "⋢",
	"&NotSquareSuperset;": "⊐̸",
	"&NotSquareSupersetEqual;": "⋣",
	"&NotSubset;": "⊂⃒",
	"&NotSubsetEqual;": "⊈",
	"&NotSucceeds;": "⊁",
	"&NotSucceedsEqual;": "⪰̸",
	"&NotSucceedsSlantEqual;": "⋡",
	"&NotSucceedsTilde;": "≿̸",
	"&NotSuperset;": "⊃⃒",
	"&NotSupersetEqual;": "⊉",
	"&NotTilde;": "≁",
	"&NotTildeEqual;": "≄",
	"&NotTildeFullEqual;": "≇",
	"&NotTildeTilde;": "≉",
	"&NotVerticalBar;": "∤",
	"&Nscr;": "𝒩",
	"&Nu;": "Ν",
	"&OElig;": "Œ",
	"&Ocy;": "О",
	"&Odblac;": "Ő",
	"&Ofr;": "𝔒",
	"&Omega;": "Ω",
	"&Omicron;": "Ο",
	"&Oopf;": "𝕆",
	"&OpenCurlyDoubleQuote;": "“",
	"&OpenCurlyQuote;": "‘",
	"&Or;": "⩔",
	"&Oscr;": "𝒪",
	"&Otimes;": "⨷",
	"&OverBar;": "‾",
	"&OverBrace;": "⏞",
	"&OverBracket;": "⎴",
	"&OverParenthesis;": "⏜",
	"&PartialD;": "∂",
	"&Pcy;": "П",
	"&Pfr;": "𝔓",
	"&Phi;": "Φ",
	"&Pi;": "Π",
	"&PlusMinus;": "±",
	"&Poincareplane;": "ℌ",
	"&Popf;": "ℙ",
	"&Pr;": "⪻",
	"&Precedes;": "≺",
	"&PrecedesEqual;": "⪯",
	"&PrecedesSlantEqual;": "≼",
	"&PrecedesTilde;": "≾",
	"&Prime;": "″",
	"&Product;": "∏",
	"&Proportion;": "∷",
	"&Proportional;": "∝",
	"&Pscr;": "𝒫",
	"&Psi;": "Ψ",
	"&QUOT;": "\"",
	"&Qfr;": "𝔔",
	"&Qopf;": "ℚ",
	"&Qscr;": "𝒬",
	"&RBarr;": "⤐",
	"&REG;": "®",
	"&Rang;": "⟫",
	"&Rarr;": "↠",
	"&Rarrtl;": "⤖",
	"&Rcedil;": "Ŗ",
	"&Rcy;": "Р",
	"&Re;": "ℜ",
	"&ReverseElement;": "∋",
	"&ReverseEquilibrium;": "⇋",
	"&ReverseUpEquilibrium;": "⥯",
	"&Rfr;": "ℜ",
	"&Rho;": "Ρ",
	"&RightAngleBracket;": "⟩",
	"&RightArrow;": "→",
	"&RightArrowBar;": "⇥",
	"&RightArrowLeftArrow;": "⇄",
	"&RightCeiling;": "⌉",
	"&RightDoubleBracket;": "⟧",
	"&RightDownTeeVector;": "⥝",
	"&RightDownVector;": "⇂",
	"&RightDownVectorBar;": "⥕",
	"&RightFloor;": "⌋",
	"&RightTee;": "⊢",
	"&RightTeeArrow;": "↦",
	"&RightTeeVector;": "⥛",
	"&RightTriangle;": "⊳",
	"&RightTriangleBar;": "⧐",
	"&RightTriangleEqual;": "⊵",
	"&RightUpDownVector;": "⥏",
	"&RightUpTeeVector;": "⥜",
	"&RightUpVector;": "↾",
	"&RightUpVectorBar;": "⥔",
	"&RightVector;": "⇀",
	"&RightVectorBar;": "⥓",
	"&Rightarrow;": "⇒",
	"&Ropf;": "ℝ",
	"&RoundImplies;": "⥰",
	"&Rrightarrow;": "⇛",
	"&Rscr;": "ℛ",
	"&Rsh;": "↱",
	"&RuleDelayed;": "⧴",
	"&SHCHcy;": "Щ",
	"&SHcy;": "Ш",
	"&SOFTcy;": "Ь",
	"&Sc;": "⪼",
	"&Scedil;": "Ş",
	"&Scy;": "С",
	"&Sfr;": "𝔖",
	"&ShortDownArrow;": "↓",
	"&ShortLeftArrow;": "←",
	"&ShortRightArrow;": "→",
	"&ShortUpArrow;": "↑",
	"&Sigma;": "Σ",
	"&SmallCircle;": "∘",
	"&Sopf;": "𝕊",
	"&Sqrt;": "√",
	"&Square;": "□",
	"&SquareIntersection;": "⊓",
	"&SquareSubset;": "⊏",
	"&SquareSubsetEqual;": "⊑",
	"&SquareSuperset;": "⊐",
	"&SquareSupersetEqual;": "⊒",
	"&SquareUnion;": "⊔",
	"&Sscr;": "𝒮",
	"&Star;": "⋆",
	"&Sub;": "⋐",
	"&Subset;": "⋐",
	"&SubsetEqual;": "⊆",
	"&Succeeds;": "≻",
	"&SucceedsEqual;": "⪰",
	"&SucceedsSlantEqual;": "≽",
	"&SucceedsTilde;": "≿",
	"&SuchThat;": "∋",
	"&Sum;": "∑",
	"&Sup;": "⋑",
	"&Superset;": "⊃",
	"&SupersetEqual;": "⊇",
	"&Supset;": "⋑",
	"&THORN;": "Þ",
	"&TRADE;": "™",
	"&TSHcy;": "Ћ",
	"&TScy;": "Ц",
	"&Tab;": "\t",
	"&Tau;": "Τ",
	"&Tcedil;": "Ţ",
	"&Tcy;": "Т",
	"&Tfr;": "𝔗",
	"&Therefore;": "∴",
	"&Theta;": "Θ",
	"&ThickSpace;": "  ",
	"&ThinSpace;": " ",
	"&Tilde;": "∼",
	"&TildeEqual;": "≃",
	"&TildeFullEqual;": "≅",
	"&TildeTilde;": "≈",
	"&Topf;": "𝕋",
	"&TripleDot;": "⃛",
	"&Tscr;": "𝒯",
	"&Tstrok;": "Ŧ",
	"&Uarr;": "↟",
	"&Uarrocir;": "⥉",
	"&Ubrcy;": "Ў",
	"&Ucy;": "У",
	"&Udblac;": "Ű",
	"&Ufr;": "𝔘",
	"&UnderBar;": "_",
	"&UnderBrace;": "⏟",
	"&UnderBracket;": "⎵",
	"&UnderParenthesis;": "⏝",
	"&Union;": "⋃",
	"&UnionPlus;": "⊎",
	"&Uopf;": "𝕌",
	"&UpArrow;": "↑",
	"&UpArrowBar;": "⤒",
	"&UpArrowDownArrow;": "⇅",
	"&UpDownArrow;": "↕",
	"&UpEquilibrium;": "⥮",
	"&UpTee;": "⊥",
	"&UpTeeArrow;": "↥",
	"&Uparrow;": "⇑",
	"&Updownarrow;": "⇕",
	"&UpperLeftArrow;": "↖",
	"&UpperRightArrow;": "↗",
	"&Upsi;": "ϒ",
	"&Upsilon;": "Υ",
	"&Uscr;": "𝒰",
	"&VDash;": "⊫",
	"&Vbar;": "⫫",
	"&Vcy;": "В",
	"&Vdash;": "⊩",
	"&Vdashl;": "⫦",
	"&Vee;": "⋁",
	"&Verbar;": "‖",
	"&Vert;": "‖",
	"&VerticalBar;": "∣",
	"&VerticalLine;": "|",
	"&VerticalSeparator;": "❘",
	"&VerticalTilde;": "≀",
	"&VeryThinSpace;": " ",
	"&Vfr;": "𝔙",
	"&Vopf;": "𝕍",
	"&Vscr;": "𝒱",
	"&Vvdash;": "⊪",
	"&Wedge;": "⋀",
	"&Wfr;": "𝔚",
	"&Wopf;": "𝕎",
	"&Wscr;": "𝒲",
	"&Xfr;": "𝔛",
	"&Xi;": "Ξ",
	"&Xopf;": "𝕏",
	"&Xscr;": "𝒳",
	"&YAcy;": "Я",
	"&YIcy;": "Ї",
	"&YUcy;": "Ю",
	"&Ycy;": "Ы",
	"&Yfr;": "𝔜",
	"&Yopf;": "𝕐",
	"&Yscr;": "𝒴",
	"&ZHcy;": "Ж",
	"&Zcy;": "З",
	"&ZeroWidthSpace;": "​",
	"&Zeta;": "Ζ",
	"&Zfr;": "ℨ",
	"&Zopf;": "ℤ",
	"&Zscr;": "𝒵",
	"&ac;": "∾",
	"&acE;": "∾̳",
	"&acd;": "∿",
	"&acute;": "´",
	"&acy;": "а",
	"&aelig;": "æ",
	"&af;": "⁡",
	"&afr;": "𝔞",
	"&alefsym;": "ℵ",
	"&aleph;": "ℵ",
	"&alpha;": "α",
	"&amalg;": "⨿",
	"&amp;": "&",
	"&and;": "∧",
	"&andand;": "⩕",
	"&andd;": "⩜",
	"&andslope;": "⩘",
	"&andv;": "⩚",
	"&ang;": "∠",
	"&ange;": "⦤",
	"&angle;": "∠",
	"&angmsd;": "∡",
	"&angmsdaa;": "⦨",
	"&angmsdab;": "⦩",
	"&angmsdac;": "⦪",
	"&angmsdad;": "⦫",
	"&angmsdae;": "⦬",
	"&angmsdaf;": "⦭",
	"&angmsdag;": "⦮",
	"&angmsdah;": "⦯",
	"&angrt;": "∟",
	"&angrtvb;": "⊾",
	"&angrtvbd;": "⦝",
	"&angsph;": "∢",
	"&angst;": "Å",
	"&angzarr;": "⍼",
	"&aopf;": "𝕒",
	"&ap;": "≈",
	"&apE;": "⩰",
	"&apacir;": "⩯",
	"&ape;": "≊",
	"&apid;": "≋",
	"&apos;": "'",
	"&approx;": "≈",
	"&approxeq;": "≊",
	"&ascr;": "𝒶",
	"&ast;": "*",
	"&asymp;": "≈",
	"&asympeq;": "≍",
	"&awconint;": "∳",
	"&awint;": "⨑",
	"&bNot;": "⫭",
	"&backcong;": "≌",
	"&backepsilon;": "϶",
	"&backprime;": "‵",
	"&backsim;": "∽",
	"&backsimeq;": "⋍",
	"&barvee;": "⊽",
	"&barwed;": "⌅",
	"&barwedge;": "⌅",
	"&bbrk;": "⎵",
	"&bbrktbrk;": "⎶",
	"&bcong;": "≌",
	"&bcy;": "б",
	"&bdquo;": "„",
	"&becaus;": "∵",
	"&because;": "∵",
	"&bemptyv;": "⦰",
	"&bepsi;": "϶",
	"&bernou;": "ℬ",
	"&beta;": "β",
	"&beth;": "ℶ",
	"&between;": "≬",
	"&bfr;": "𝔟",
	"&bigcap;": "⋂",
	"&bigcirc;": "◯",
	"&bigcup;": "⋃",
	"&bigodot;": "⨀",
	"&bigoplus;": "⨁",
	"&bigotimes;": "⨂",
	"&bigsqcup;": "⨆",
	"&bigstar;": "★",
	"&bigtriangledown;": "▽",
	"&bigtriangleup;": "△",
	"&biguplus;": "⨄",
	"&bigvee;": "⋁",
	"&bigwedge;": "⋀",
	"&bkarow;": "⤍",
	"&blacklozenge;": "⧫",
	"&blacksquare;": "▪",
	"&blacktriangle;": "▴",
	"&blacktriangledown;": "▾",
	"&blacktriangleleft;": "◂",
	"&blacktriangleright;": "▸",
	"&blank;": "␣",
	"&blk12;": "▒",
	"&blk14;": "░",
	"&blk34;": "▓",
	"&block;": "█",
	"&bne;": "=⃥",
	"&bnequiv;": "≡⃥",
	"&bnot;": "⌐",
	"&bopf;": "𝕓",
	"&bot;": "⊥",
	"&bottom;": "⊥",
	"&bowtie;": "⋈",
	"&boxDL;": "╗",
	"&boxDR;": "╔",
	"&boxDl;": "╖",
	"&boxDr;": "╓",
	"&boxH;": "═",
	"&boxHD;": "╦",
	"&boxHU;": "╩",
	"&boxHd;": "╤",
	"&boxHu;": "╧",
	"&boxUL;": "╝",
	"&boxUR;": "╚",
	"&boxUl;": "╜",
	"&boxUr;": "╙",
	"&boxV;": "║",
	"&boxVH;": "╬",
	"&boxVL;": "╣",
	"&boxVR;": "╠",
	"&boxVh;": "╫",
	"&boxVl;": "╢",
	"&boxVr;": "╟",
	"&boxbox;": "⧉",
	"&boxdL;": "╕",
	"&boxdR;": "╒",
	"&boxdl;": "┐",
	"&boxdr;": "┌",
	"&boxh;": "─",
	"&boxhD;": "╥",
	"&boxhU;": "╨",
	"&boxhd;": "┬",
	"&boxhu;": "┴",
	"&boxminus;": "⊟",
	"&boxplus;": "⊞",
	"&boxtimes;": "⊠",
	"&boxuL;": "╛",
	"&boxuR;": "╘",
	"&boxul;": "┘",
	"&boxur;": "└",
	"&boxv;": "│",
	"&boxvH;": "╪",
	"&boxvL;": "╡",
	"&boxvR;": "╞",
	"&boxvh;": "┼",
	"&boxvl;": "┤",
	"&boxvr;": "├",
	"&bprime;": "‵",
	"&breve;": "˘",
	"&brvbar;": "¦",
	"&bscr;": "𝒷",
	"&bsemi;": "⁏",
	"&bsim;": "∽",
	"&bsime;": "⋍",
	"&bsol;": "\\",
	"&bsolb;": "⧅",
	"&bsolhsub;": "⟈",
	"&bull;": "•",
	"&bullet;": "•",
	"&bump;": "≎",
	"&bumpE;": "⪮",
	"&bumpe;": "≏",
	"&bumpeq;": "≏",
	"&cap;": "∩",
	"&capand;": "⩄",
	"&capbrcup;": "⩉",
	"&capcap;": "⩋",
	"&capcup;": "⩇",
	"&capdot;": "⩀",
	"&caps;": "∩︀",
	"&caret;": "⁁",
	"&caron;": "ˇ",
	"&ccaps;": "⩍",
	"&ccedil;": "ç",
	"&ccups;": "⩌",
	"&ccupssm;": "⩐",
	"&cedil;": "¸",
	"&cemptyv;": "⦲",
	"&cent;": "¢",
	"&centerdot;": "·",
	"&cfr;": "𝔠",
	"&chcy;": "ч",
	"&check;": "✓",
	"&checkmark;": "✓",
	"&chi;": "χ",
	"&cir;": "○",
	"&cirE;": "⧃",
	"&circ;": "ˆ",
	"&circeq;": "≗",
	"&circlearrowleft;": "↺",
	"&circlearrowright;": "↻",
	"&circledR;": "®",
	"&circledS;": "Ⓢ",
	"&circledast;": "⊛",
	"&circledcirc;": "⊚",
	"&circleddash;": "⊝",
	"&cire;": "≗",
	"&cirfnint;": "⨐",
	"&cirmid;": "⫯",
	"&cirscir;": "⧂",
	"&clubs;": "♣",
	"&clubsuit;": "♣",
	"&colon;": ":",
	"&colone;": "≔",
	"&coloneq;": "≔",
	"&comma;": ",",
	"&commat;": "@",
	"&comp;": "∁",
	"&compfn;": "∘",
	"&complement;": "∁",
	"&complexes;": "ℂ",
	"&cong;": "≅",
	"&congdot;": "⩭",
	"&conint;": "∮",
	"&copf;": "𝕔",
	"&coprod;": "∐",
	"&copy;": "©",
	"&copysr;": "℗",
	"&crarr;": "↵",
	"&cross;": "✗",
	"&cscr;": "𝒸",
	"&csub;": "⫏",
	"&csube;": "⫑",
	"&csup;": "⫐",
	"&csupe;": "⫒",
	"&ctdot;": "⋯",
	"&cudarrl;": "⤸",
	"&cudarrr;": "⤵",
	"&cuepr;": "⋞",
	"&cuesc;": "⋟",
	"&cularr;": "↶",
	"&cularrp;": "⤽",
	"&cup;": "∪",
	"&cupbrcap;": "⩈",
	"&cupcap;": "⩆",
	"&cupcup;": "⩊",
	"&cupdot;": "⊍",
	"&cupor;": "⩅",
	"&cups;": "∪︀",
	"&curarr;": "↷",
	"&curarrm;": "⤼",
	"&curlyeqprec;": "⋞",
	"&curlyeqsucc;": "⋟",
	"&curlyvee;": "⋎",
	"&curlywedge;": "⋏",
	"&curren;": "¤",
	"&curvearrowleft;": "↶",
	"&curvearrowright;": "↷",
	"&cuvee;": "⋎",
	"&cuwed;": "⋏",
	"&cwconint;": "∲",
	"&cwint;": "∱",
	"&cylcty;": "⌭",
	"&dArr;": "⇓",
	"&dHar;": "⥥",
	"&dagger;": "†",
	"&daleth;": "ℸ",
	"&darr;": "↓",
	"&dash;": "‐",
	"&dashv;": "⊣",
	"&dbkarow;": "⤏",
	"&dblac;": "˝",
	"&dcy;": "д",
	"&dd;": "ⅆ",
	"&ddagger;": "‡",
	"&ddarr;": "⇊",
	"&ddotseq;": "⩷",
	"&deg;": "°",
	"&delta;": "δ",
	"&demptyv;": "⦱",
	"&dfisht;": "⥿",
	"&dfr;": "𝔡",
	"&dharl;": "⇃",
	"&dharr;": "⇂",
	"&diam;": "⋄",
	"&diamond;": "⋄",
	"&diamondsuit;": "♦",
	"&diams;": "♦",
	"&die;": "¨",
	"&digamma;": "ϝ",
	"&disin;": "⋲",
	"&div;": "÷",
	"&divide;": "÷",
	"&divideontimes;": "⋇",
	"&divonx;": "⋇",
	"&djcy;": "ђ",
	"&dlcorn;": "⌞",
	"&dlcrop;": "⌍",
	"&dollar;": "$",
	"&dopf;": "𝕕",
	"&dot;": "˙",
	"&doteq;": "≐",
	"&doteqdot;": "≑",
	"&dotminus;": "∸",
	"&dotplus;": "∔",
	"&dotsquare;": "⊡",
	"&doublebarwedge;": "⌆",
	"&downarrow;": "↓",
	"&downdownarrows;": "⇊",
	"&downharpoonleft;": "⇃",
	"&downharpoonright;": "⇂",
	"&drbkarow;": "⤐",
	"&drcorn;": "⌟",
	"&drcrop;": "⌌",
	"&dscr;": "𝒹",
	"&dscy;": "ѕ",
	"&dsol;": "⧶",
	"&dstrok;": "đ",
	"&dtdot;": "⋱",
	"&dtri;": "▿",
	"&dtrif;": "▾",
	"&duarr;": "⇵",
	"&duhar;": "⥯",
	"&dwangle;": "⦦",
	"&dzcy;": "џ",
	"&dzigrarr;": "⟿",
	"&eDDot;": "⩷",
	"&eDot;": "≑",
	"&easter;": "⩮",
	"&ecir;": "≖",
	"&ecolon;": "≕",
	"&ecy;": "э",
	"&ee;": "ⅇ",
	"&efDot;": "≒",
	"&efr;": "𝔢",
	"&eg;": "⪚",
	"&egs;": "⪖",
	"&egsdot;": "⪘",
	"&el;": "⪙",
	"&elinters;": "⏧",
	"&ell;": "ℓ",
	"&els;": "⪕",
	"&elsdot;": "⪗",
	"&empty;": "∅",
	"&emptyset;": "∅",
	"&emptyv;": "∅",
	"&emsp13;": " ",
	"&emsp14;": " ",
	"&emsp;": " ",
	"&eng;": "ŋ",
	"&ensp;": " ",
	"&eopf;": "𝕖",
	"&epar;": "⋕",
	"&eparsl;": "⧣",
	"&eplus;": "⩱",
	"&epsi;": "ε",
	"&epsilon;": "ε",
	"&epsiv;": "ϵ",
	"&eqcirc;": "≖",
	"&eqcolon;": "≕",
	"&eqsim;": "≂",
	"&eqslantgtr;": "⪖",
	"&eqslantless;": "⪕",
	"&equals;": "=",
	"&equest;": "≟",
	"&equiv;": "≡",
	"&equivDD;": "⩸",
	"&eqvparsl;": "⧥",
	"&erDot;": "≓",
	"&erarr;": "⥱",
	"&escr;": "ℯ",
	"&esdot;": "≐",
	"&esim;": "≂",
	"&eta;": "η",
	"&eth;": "ð",
	"&euro;": "€",
	"&excl;": "!",
	"&exist;": "∃",
	"&expectation;": "ℰ",
	"&exponentiale;": "ⅇ",
	"&fallingdotseq;": "≒",
	"&fcy;": "ф",
	"&female;": "♀",
	"&ffilig;": "ﬃ",
	"&fflig;": "ﬀ",
	"&ffllig;": "ﬄ",
	"&ffr;": "𝔣",
	"&filig;": "ﬁ",
	"&fjlig;": "fj",
	"&flat;": "♭",
	"&fllig;": "ﬂ",
	"&fltns;": "▱",
	"&fnof;": "ƒ",
	"&fopf;": "𝕗",
	"&forall;": "∀",
	"&fork;": "⋔",
	"&forkv;": "⫙",
	"&fpartint;": "⨍",
	"&frac12;": "½",
	"&frac13;": "⅓",
	"&frac14;": "¼",
	"&frac15;": "⅕",
	"&frac16;": "⅙",
	"&frac18;": "⅛",
	"&frac23;": "⅔",
	"&frac25;": "⅖",
	"&frac34;": "¾",
	"&frac35;": "⅗",
	"&frac38;": "⅜",
	"&frac45;": "⅘",
	"&frac56;": "⅚",
	"&frac58;": "⅝",
	"&frac78;": "⅞",
	"&frasl;": "⁄",
	"&frown;": "⌢",
	"&fscr;": "𝒻",
	"&gE;": "≧",
	"&gEl;": "⪌",
	"&gamma;": "γ",
	"&gammad;": "ϝ",
	"&gap;": "⪆",
	"&gcy;": "г",
	"&ge;": "≥",
	"&gel;": "⋛",
	"&geq;": "≥",
	"&geqq;": "≧",
	"&geqslant;": "⩾",
	"&ges;": "⩾",
	"&gescc;": "⪩",
	"&gesdot;": "⪀",
	"&gesdoto;": "⪂",
	"&gesdotol;": "⪄",
	"&gesl;": "⋛︀",
	"&gesles;": "⪔",
	"&gfr;": "𝔤",
	"&gg;": "≫",
	"&ggg;": "⋙",
	"&gimel;": "ℷ",
	"&gjcy;": "ѓ",
	"&gl;": "≷",
	"&glE;": "⪒",
	"&gla;": "⪥",
	"&glj;": "⪤",
	"&gnE;": "≩",
	"&gnap;": "⪊",
	"&gnapprox;": "⪊",
	"&gne;": "⪈",
	"&gneq;": "⪈",
	"&gneqq;": "≩",
	"&gnsim;": "⋧",
	"&gopf;": "𝕘",
	"&grave;": "`",
	"&gscr;": "ℊ",
	"&gsim;": "≳",
	"&gsime;": "⪎",
	"&gsiml;": "⪐",
	"&gt;": ">",
	"&gtcc;": "⪧",
	"&gtcir;": "⩺",
	"&gtdot;": "⋗",
	"&gtlPar;": "⦕",
	"&gtquest;": "⩼",
	"&gtrapprox;": "⪆",
	"&gtrarr;": "⥸",
	"&gtrdot;": "⋗",
	"&gtreqless;": "⋛",
	"&gtreqqless;": "⪌",
	"&gtrless;": "≷",
	"&gtrsim;": "≳",
	"&gvertneqq;": "≩︀",
	"&gvnE;": "≩︀",
	"&hArr;": "⇔",
	"&hairsp;": " ",
	"&half;": "½",
	"&hamilt;": "ℋ",
	"&hardcy;": "ъ",
	"&harr;": "↔",
	"&harrcir;": "⥈",
	"&harrw;": "↭",
	"&hbar;": "ℏ",
	"&hearts;": "♥",
	"&heartsuit;": "♥",
	"&hellip;": "…",
	"&hercon;": "⊹",
	"&hfr;": "𝔥",
	"&hksearow;": "⤥",
	"&hkswarow;": "⤦",
	"&hoarr;": "⇿",
	"&homtht;": "∻",
	"&hookleftarrow;": "↩",
	"&hookrightarrow;": "↪",
	"&hopf;": "𝕙",
	"&horbar;": "―",
	"&hscr;": "𝒽",
	"&hstrok;": "ħ",
	"&hybull;": "⁃",
	"&hyphen;": "‐",
	"&ic;": "⁣",
	"&icy;": "и",
	"&iecy;": "е",
	"&iexcl;": "¡",
	"&iff;": "⇔",
	"&ifr;": "𝔦",
	"&ii;": "ⅈ",
	"&iiiint;": "⨌",
	"&iiint;": "∭",
	"&iinfin;": "⧜",
	"&iiota;": "℩",
	"&ijlig;": "ĳ",
	"&image;": "ℑ",
	"&imagline;": "ℐ",
	"&imagpart;": "ℑ",
	"&imath;": "ı",
	"&imof;": "⊷",
	"&imped;": "Ƶ",
	"&in;": "∈",
	"&incare;": "℅",
	"&infin;": "∞",
	"&infintie;": "⧝",
	"&inodot;": "ı",
	"&int;": "∫",
	"&intcal;": "⊺",
	"&integers;": "ℤ",
	"&intercal;": "⊺",
	"&intlarhk;": "⨗",
	"&intprod;": "⨼",
	"&iocy;": "ё",
	"&iopf;": "𝕚",
	"&iota;": "ι",
	"&iprod;": "⨼",
	"&iquest;": "¿",
	"&iscr;": "𝒾",
	"&isin;": "∈",
	"&isinE;": "⋹",
	"&isindot;": "⋵",
	"&isins;": "⋴",
	"&isinsv;": "⋳",
	"&isinv;": "∈",
	"&it;": "⁢",
	"&iukcy;": "і",
	"&jcy;": "й",
	"&jfr;": "𝔧",
	"&jmath;": "ȷ",
	"&jopf;": "𝕛",
	"&jscr;": "𝒿",
	"&jsercy;": "ј",
	"&jukcy;": "є",
	"&kappa;": "κ",
	"&kappav;": "ϰ",
	"&kcedil;": "ķ",
	"&kcy;": "к",
	"&kfr;": "𝔨",
	"&kgreen;": "ĸ",
	"&khcy;": "х",
	"&kjcy;": "ќ",
	"&kopf;": "𝕜",
	"&kscr;": "𝓀",
	"&lAarr;": "⇚",
	"&lArr;": "⇐",
	"&lAtail;": "⤛",
	"&lBarr;": "⤎",
	"&lE;": "≦",
	"&lEg;": "⪋",
	"&lHar;": "⥢",
	"&laemptyv;": "⦴",
	"&lagran;": "ℒ",
	"&lambda;": "λ",
	"&lang;": "⟨",
	"&langd;": "⦑",
	"&langle;": "⟨",
	"&lap;": "⪅",
	"&laquo;": "«",
	"&larr;": "←",
	"&larrb;": "⇤",
	"&larrbfs;": "⤟",
	"&larrfs;": "⤝",
	"&larrhk;": "↩",
	"&larrlp;": "↫",
	"&larrpl;": "⤹",
	"&larrsim;": "⥳",
	"&larrtl;": "↢",
	"&lat;": "⪫",
	"&latail;": "⤙",
	"&late;": "⪭",
	"&lates;": "⪭︀",
	"&lbarr;": "⤌",
	"&lbbrk;": "❲",
	"&lbrace;": "{",
	"&lbrack;": "[",
	"&lbrke;": "⦋",
	"&lbrksld;": "⦏",
	"&lbrkslu;": "⦍",
	"&lcedil;": "ļ",
	"&lceil;": "⌈",
	"&lcub;": "{",
	"&lcy;": "л",
	"&ldca;": "⤶",
	"&ldquo;": "“",
	"&ldquor;": "„",
	"&ldrdhar;": "⥧",
	"&ldrushar;": "⥋",
	"&ldsh;": "↲",
	"&le;": "≤",
	"&leftarrow;": "←",
	"&leftarrowtail;": "↢",
	"&leftharpoondown;": "↽",
	"&leftharpoonup;": "↼",
	"&leftleftarrows;": "⇇",
	"&leftrightarrow;": "↔",
	"&leftrightarrows;": "⇆",
	"&leftrightharpoons;": "⇋",
	"&leftrightsquigarrow;": "↭",
	"&leftthreetimes;": "⋋",
	"&leg;": "⋚",
	"&leq;": "≤",
	"&leqq;": "≦",
	"&leqslant;": "⩽",
	"&les;": "⩽",
	"&lescc;": "⪨",
	"&lesdot;": "⩿",
	"&lesdoto;": "⪁",
	"&lesdotor;": "⪃",
	"&lesg;": "⋚︀",
	"&lesges;": "⪓",
	"&lessapprox;": "⪅",
	"&lessdot;": "⋖",
	"&lesseqgtr;": "⋚",
	"&lesseqqgtr;": "⪋",
	"&lessgtr;": "≶",
	"&lesssim;": "≲",
	"&lfisht;": "⥼",
	"&lfloor;": "⌊",
	"&lfr;": "𝔩",
	"&lg;": "≶",
	"&lgE;": "⪑",
	"&lhard;": "↽",
	"&lharu;": "↼",
	"&lharul;": "⥪",
	"&lhblk;": "▄",
	"&ljcy;": "љ",
	"&ll;": "≪",
	"&llarr;": "⇇",
	"&llcorner;": "⌞",
	"&llhard;": "⥫",
	"&lltri;": "◺",
	"&lmidot;": "ŀ",
	"&lmoust;": "⎰",
	"&lmoustache;": "⎰",
	"&lnE;": "≨",
	"&lnap;": "⪉",
	"&lnapprox;": "⪉",
	"&lne;": "⪇",
	"&lneq;": "⪇",
	"&lneqq;": "≨",
	"&lnsim;": "⋦",
	"&loang;": "⟬",
	"&loarr;": "⇽",
	"&lobrk;": "⟦",
	"&longleftarrow;": "⟵",
	"&longleftrightarrow;": "⟷",
	"&longmapsto;": "⟼",
	"&longrightarrow;": "⟶",
	"&looparrowleft;": "↫",
	"&looparrowright;": "↬",
	"&lopar;": "⦅",
	"&lopf;": "𝕝",
	"&loplus;": "⨭",
	"&lotimes;": "⨴",
	"&lowast;": "∗",
	"&lowbar;": "_",
	"&loz;": "◊",
	"&lozenge;": "◊",
	"&lozf;": "⧫",
	"&lpar;": "(",
	"&lparlt;": "⦓",
	"&lrarr;": "⇆",
	"&lrcorner;": "⌟",
	"&lrhar;": "⇋",
	"&lrhard;": "⥭",
	"&lrm;": "‎",
	"&lrtri;": "⊿",
	"&lsaquo;": "‹",
	"&lscr;": "𝓁",
	"&lsh;": "↰",
	"&lsim;": "≲",
	"&lsime;": "⪍",
	"&lsimg;": "⪏",
	"&lsqb;": "[",
	"&lsquo;": "‘",
	"&lsquor;": "‚",
	"&lstrok;": "ł",
	"&lt;": "<",
	"&ltcc;": "⪦",
	"&ltcir;": "⩹",
	"&ltdot;": "⋖",
	"&lthree;": "⋋",
	"&ltimes;": "⋉",
	"&ltlarr;": "⥶",
	"&ltquest;": "⩻",
	"&ltrPar;": "⦖",
	"&ltri;": "◃",
	"&ltrie;": "⊴",
	"&ltrif;": "◂",
	"&lurdshar;": "⥊",
	"&luruhar;": "⥦",
	"&lvertneqq;": "≨︀",
	"&lvnE;": "≨︀",
	"&mDDot;": "∺",
	"&macr;": "¯",
	"&male;": "♂",
	"&malt;": "✠",
	"&maltese;": "✠",
	"&map;": "↦",
	"&mapsto;": "↦",
	"&mapstodown;": "↧",
	"&mapstoleft;": "↤",
	"&mapstoup;": "↥",
	"&marker;": "▮",
	"&mcomma;": "⨩",
	"&mcy;": "м",
	"&mdash;": "—",
	"&measuredangle;": "∡",
	"&mfr;": "𝔪",
	"&mho;": "℧",
	"&micro;": "µ",
	"&mid;": "∣",
	"&midast;": "*",
	"&midcir;": "⫰",
	"&middot;": "·",
	"&minus;": "−",
	"&minusb;": "⊟",
	"&minusd;": "∸",
	"&minusdu;": "⨪",
	"&mlcp;": "⫛",
	"&mldr;": "…",
	"&mnplus;": "∓",
	"&models;": "⊧",
	"&mopf;": "𝕞",
	"&mp;": "∓",
	"&mscr;": "𝓂",
	"&mstpos;": "∾",
	"&mu;": "μ",
	"&multimap;": "⊸",
	"&mumap;": "⊸",
	"&nGg;": "⋙̸",
	"&nGt;": "≫⃒",
	"&nGtv;": "≫̸",
	"&nLeftarrow;": "⇍",
	"&nLeftrightarrow;": "⇎",
	"&nLl;": "⋘̸",
	"&nLt;": "≪⃒",
	"&nLtv;": "≪̸",
	"&nRightarrow;": "⇏",
	"&nVDash;": "⊯",
	"&nVdash;": "⊮",
	"&nabla;": "∇",
	"&nang;": "∠⃒",
	"&nap;": "≉",
	"&napE;": "⩰̸",
	"&napid;": "≋̸",
	"&napos;": "ŉ",
	"&napprox;": "≉",
	"&natur;": "♮",
	"&natural;": "♮",
	"&naturals;": "ℕ",
	"&nbsp;": " ",
	"&nbump;": "≎̸",
	"&nbumpe;": "≏̸",
	"&ncap;": "⩃",
	"&ncedil;": "ņ",
	"&ncong;": "≇",
	"&ncongdot;": "⩭̸",
	"&ncup;": "⩂",
	"&ncy;": "н",
	"&ndash;": "–",
	"&ne;": "≠",
	"&neArr;": "⇗",
	"&nearhk;": "⤤",
	"&nearr;": "↗",
	"&nearrow;": "↗",
	"&nedot;": "≐̸",
	"&nequiv;": "≢",
	"&nesear;": "⤨",
	"&nesim;": "≂̸",
	"&nexist;": "∄",
	"&nexists;": "∄",
	"&nfr;": "𝔫",
	"&ngE;": "≧̸",
	"&nge;": "≱",
	"&ngeq;": "≱",
	"&ngeqq;": "≧̸",
	"&ngeqslant;": "⩾̸",
	"&nges;": "⩾̸",
	"&ngsim;": "≵",
	"&ngt;": "≯",
	"&ngtr;": "≯",
	"&nhArr;": "⇎",
	"&nharr;": "↮",
	"&nhpar;": "⫲",
	"&ni;": "∋",
	"&nis;": "⋼",
	"&nisd;": "⋺",
	"&niv;": "∋",
	"&njcy;": "њ",
	"&nlArr;": "⇍",
	"&nlE;": "≦̸",
	"&nlarr;": "↚",
	"&nldr;": "‥",
	"&nle;": "≰",
	"&nleftarrow;": "↚",
	"&nleftrightarrow;": "↮",
	"&nleq;": "≰",
	"&nleqq;": "≦̸",
	"&nleqslant;": "⩽̸",
	"&nles;": "⩽̸",
	"&nless;": "≮",
	"&nlsim;": "≴",
	"&nlt;": "≮",
	"&nltri;": "⋪",
	"&nltrie;": "⋬",
	"&nmid;": "∤",
	"&nopf;": "𝕟",
	"&not;": "¬",
	"&notin;": "∉",
	"&notinE;": "⋹̸",
	"&notindot;": "⋵̸",
	"&notinva;": "∉",
	"&notinvb;": "⋷",
	"&notinvc;": "⋶",
	"&notni;": "∌",
	"&notniva;": "∌",
	"&notnivb;": "⋾",
	"&notnivc;": "⋽",
	"&npar;": "∦",
	"&nparallel;": "∦",
	"&nparsl;": "⫽⃥",
	"&npart;": "∂̸",
	"&npolint;": "⨔",
	"&npr;": "⊀",
	"&nprcue;": "⋠",
	"&npre;": "⪯̸",
	"&nprec;": "⊀",
	"&npreceq;": "⪯̸",
	"&nrArr;": "⇏",
	"&nrarr;": "↛",
	"&nrarrc;": "⤳̸",
	"&nrarrw;": "↝̸",
	"&nrightarrow;": "↛",
	"&nrtri;": "⋫",
	"&nrtrie;": "⋭",
	"&nsc;": "⊁",
	"&nsccue;": "⋡",
	"&nsce;": "⪰̸",
	"&nscr;": "𝓃",
	"&nshortmid;": "∤",
	"&nshortparallel;": "∦",
	"&nsim;": "≁",
	"&nsime;": "≄",
	"&nsimeq;": "≄",
	"&nsmid;": "∤",
	"&nspar;": "∦",
	"&nsqsube;": "⋢",
	"&nsqsupe;": "⋣",
	"&nsub;": "⊄",
	"&nsubE;": "⫅̸",
	"&nsube;": "⊈",
	"&nsubset;": "⊂⃒",
	"&nsubseteq;": "⊈",
	"&nsubseteqq;": "⫅̸",
	"&nsucc;": "⊁",
	"&nsucceq;": "⪰̸",
	"&nsup;": "⊅",
	"&nsupE;": "⫆̸",
	"&nsupe;": "⊉",
	"&nsupset;": "⊃⃒",
	"&nsupseteq;": "⊉",
	"&nsupseteqq;": "⫆̸",
	"&ntgl;": "≹",
	"&ntlg;": "≸",
	"&ntriangleleft;": "⋪",
	"&ntrianglelefteq;": "⋬",
	"&ntriangleright;": "⋫",
	"&ntrianglerighteq;": "⋭",
	"&nu;": "ν",
	"&num;": "#",
	"&numero;": "№",
	"&numsp;": " ",
	"&nvDash;": "⊭",
	"&nvHarr;": "⤄",
	"&nvap;": "≍⃒",
	"&nvdash;": "⊬",
	"&nvge;": "≥⃒",
	"&nvgt;": ">⃒",
	"&nvinfin;": "⧞",
	"&nvlArr;": "⤂",
	"&nvle;": "≤⃒",
	"&nvlt;": "<⃒",
	"&nvltrie;": "⊴⃒",
	"&nvrArr;": "⤃",
	"&nvrtrie;": "⊵⃒",
	"&nvsim;": "∼⃒",
	"&nwArr;": "⇖",
	"&nwarhk;": "⤣",
	"&nwarr;": "↖",
	"&nwarrow;": "↖",
	"&nwnear;": "⤧",
	"&oS;": "Ⓢ",
	"&oast;": "⊛",
	"&ocir;": "⊚",
	"&ocy;": "о",
	"&odash;": "⊝",
	"&odblac;": "ő",
	"&odiv;": "⨸",
	"&odsold;": "⦼",
	"&oelig;": "œ",
	"&ofcir;": "⦿",
	"&ofr;": "𝔬",
	"&ogon;": "˛",
	"&ogt;": "⧁",
	"&ohbar;": "⦵",
	"&ohm;": "Ω",
	"&oint;": "∮",
	"&olarr;": "↺",
	"&olcir;": "⦾",
	"&olcross;": "⦻",
	"&oline;": "‾",
	"&olt;": "⧀",
	"&omega;": "ω",
	"&omicron;": "ο",
	"&omid;": "⦶",
	"&ominus;": "⊖",
	"&oopf;": "𝕠",
	"&opar;": "⦷",
	"&operp;": "⦹",
	"&oplus;": "⊕",
	"&or;": "∨",
	"&orarr;": "↻",
	"&ord;": "⩝",
	"&order;": "ℴ",
	"&orderof;": "ℴ",
	"&ordf;": "ª",
	"&ordm;": "º",
	"&origof;": "⊶",
	"&oror;": "⩖",
	"&orslope;": "⩗",
	"&orv;": "⩛",
	"&oscr;": "ℴ",
	"&osol;": "⊘",
	"&otimes;": "⊗",
	"&otimesas;": "⨶",
	"&ovbar;": "⌽",
	"&par;": "∥",
	"&para;": "¶",
	"&parallel;": "∥",
	"&parsim;": "⫳",
	"&parsl;": "⫽",
	"&part;": "∂",
	"&pcy;": "п",
	"&percnt;": "%",
	"&period;": ".",
	"&permil;": "‰",
	"&perp;": "⊥",
	"&pertenk;": "‱",
	"&pfr;": "𝔭",
	"&phi;": "φ",
	"&phiv;": "ϕ",
	"&phmmat;": "ℳ",
	"&phone;": "☎",
	"&pi;": "π",
	"&pitchfork;": "⋔",
	"&piv;": "ϖ",
	"&planck;": "ℏ",
	"&planckh;": "ℎ",
	"&plankv;": "ℏ",
	"&plus;": "+",
	"&plusacir;": "⨣",
	"&plusb;": "⊞",
	"&pluscir;": "⨢",
	"&plusdo;": "∔",
	"&plusdu;": "⨥",
	"&pluse;": "⩲",
	"&plusmn;": "±",
	"&plussim;": "⨦",
	"&plustwo;": "⨧",
	"&pm;": "±",
	"&pointint;": "⨕",
	"&popf;": "𝕡",
	"&pound;": "£",
	"&pr;": "≺",
	"&prE;": "⪳",
	"&prap;": "⪷",
	"&prcue;": "≼",
	"&pre;": "⪯",
	"&prec;": "≺",
	"&precapprox;": "⪷",
	"&preccurlyeq;": "≼",
	"&preceq;": "⪯",
	"&precnapprox;": "⪹",
	"&precneqq;": "⪵",
	"&precnsim;": "⋨",
	"&precsim;": "≾",
	"&prime;": "′",
	"&primes;": "ℙ",
	"&prnE;": "⪵",
	"&prnap;": "⪹",
	"&prnsim;": "⋨",
	"&prod;": "∏",
	"&profalar;": "⌮",
	"&profline;": "⌒",
	"&profsurf;": "⌓",
	"&prop;": "∝",
	"&propto;": "∝",
	"&prsim;": "≾",
	"&prurel;": "⊰",
	"&pscr;": "𝓅",
	"&psi;": "ψ",
	"&puncsp;": " ",
	"&qfr;": "𝔮",
	"&qint;": "⨌",
	"&qopf;": "𝕢",
	"&qprime;": "⁗",
	"&qscr;": "𝓆",
	"&quaternions;": "ℍ",
	"&quatint;": "⨖",
	"&quest;": "?",
	"&questeq;": "≟",
	"&quot;": "\"",
	"&rAarr;": "⇛",
	"&rArr;": "⇒",
	"&rAtail;": "⤜",
	"&rBarr;": "⤏",
	"&rHar;": "⥤",
	"&race;": "∽̱",
	"&radic;": "√",
	"&raemptyv;": "⦳",
	"&rang;": "⟩",
	"&rangd;": "⦒",
	"&range;": "⦥",
	"&rangle;": "⟩",
	"&raquo;": "»",
	"&rarr;": "→",
	"&rarrap;": "⥵",
	"&rarrb;": "⇥",
	"&rarrbfs;": "⤠",
	"&rarrc;": "⤳",
	"&rarrfs;": "⤞",
	"&rarrhk;": "↪",
	"&rarrlp;": "↬",
	"&rarrpl;": "⥅",
	"&rarrsim;": "⥴",
	"&rarrtl;": "↣",
	"&rarrw;": "↝",
	"&ratail;": "⤚",
	"&ratio;": "∶",
	"&rationals;": "ℚ",
	"&rbarr;": "⤍",
	"&rbbrk;": "❳",
	"&rbrace;": "}",
	"&rbrack;": "]",
	"&rbrke;": "⦌",
	"&rbrksld;": "⦎",
	"&rbrkslu;": "⦐",
	"&rcedil;": "ŗ",
	"&rceil;": "⌉",
	"&rcub;": "}",
	"&rcy;": "р",
	"&rdca;": "⤷",
	"&rdldhar;": "⥩",
	"&rdquo;": "”",
	"&rdquor;": "”",
	"&rdsh;": "↳",
	"&real;": "ℜ",
	"&realine;": "ℛ",
	"&realpart;": "ℜ",
	"&reals;": "ℝ",
	"&rect;": "▭",
	"&reg;": "®",
	"&rfisht;": "⥽",
	"&rfloor;": "⌋",
	"&rfr;": "𝔯",
	"&rhard;": "⇁",
	"&rharu;": "⇀",
	"&rharul;": "⥬",
	"&rho;": "ρ",
	"&rhov;": "ϱ",
	"&rightarrow;": "→",
	"&rightarrowtail;": "↣",
	"&rightharpoondown;": "⇁",
	"&rightharpoonup;": "⇀",
	"&rightleftarrows;": "⇄",
	"&rightleftharpoons;": "⇌",
	"&rightrightarrows;": "⇉",
	"&rightsquigarrow;": "↝",
	"&rightthreetimes;": "⋌",
	"&ring;": "˚",
	"&risingdotseq;": "≓",
	"&rlarr;": "⇄",
	"&rlhar;": "⇌",
	"&rlm;": "‏",
	"&rmoust;": "⎱",
	"&rmoustache;": "⎱",
	"&rnmid;": "⫮",
	"&roang;": "⟭",
	"&roarr;": "⇾",
	"&robrk;": "⟧",
	"&ropar;": "⦆",
	"&ropf;": "𝕣",
	"&roplus;": "⨮",
	"&rotimes;": "⨵",
	"&rpar;": ")",
	"&rpargt;": "⦔",
	"&rppolint;": "⨒",
	"&rrarr;": "⇉",
	"&rsaquo;": "›",
	"&rscr;": "𝓇",
	"&rsh;": "↱",
	"&rsqb;": "]",
	"&rsquo;": "’",
	"&rsquor;": "’",
	"&rthree;": "⋌",
	"&rtimes;": "⋊",
	"&rtri;": "▹",
	"&rtrie;": "⊵",
	"&rtrif;": "▸",
	"&rtriltri;": "⧎",
	"&ruluhar;": "⥨",
	"&rx;": "℞",
	"&sbquo;": "‚",
	"&sc;": "≻",
	"&scE;": "⪴",
	"&scap;": "⪸",
	"&sccue;": "≽",
	"&sce;": "⪰",
	"&scedil;": "ş",
	"&scnE;": "⪶",
	"&scnap;": "⪺",
	"&scnsim;": "⋩",
	"&scpolint;": "⨓",
	"&scsim;": "≿",
	"&scy;": "с",
	"&sdotb;": "⊡",
	"&sdote;": "⩦",
	"&seArr;": "⇘",
	"&searhk;": "⤥",
	"&searr;": "↘",
	"&searrow;": "↘",
	"&sect;": "§",
	"&semi;": ";",
	"&seswar;": "⤩",
	"&setminus;": "∖",
	"&setmn;": "∖",
	"&sext;": "✶",
	"&sfr;": "𝔰",
	"&sfrown;": "⌢",
	"&sharp;": "♯",
	"&shchcy;": "щ",
	"&shcy;": "ш",
	"&shortmid;": "∣",
	"&shortparallel;": "∥",
	"&shy;": "­",
	"&sigma;": "σ",
	"&sigmaf;": "ς",
	"&sigmav;": "ς",
	"&sim;": "∼",
	"&simdot;": "⩪",
	"&sime;": "≃",
	"&simeq;": "≃",
	"&simg;": "⪞",
	"&simgE;": "⪠",
	"&siml;": "⪝",
	"&simlE;": "⪟",
	"&simne;": "≆",
	"&simplus;": "⨤",
	"&simrarr;": "⥲",
	"&slarr;": "←",
	"&smallsetminus;": "∖",
	"&smashp;": "⨳",
	"&smeparsl;": "⧤",
	"&smid;": "∣",
	"&smile;": "⌣",
	"&smt;": "⪪",
	"&smte;": "⪬",
	"&smtes;": "⪬︀",
	"&softcy;": "ь",
	"&sol;": "/",
	"&solb;": "⧄",
	"&solbar;": "⌿",
	"&sopf;": "𝕤",
	"&spades;": "♠",
	"&spadesuit;": "♠",
	"&spar;": "∥",
	"&sqcap;": "⊓",
	"&sqcaps;": "⊓︀",
	"&sqcup;": "⊔",
	"&sqcups;": "⊔︀",
	"&sqsub;": "⊏",
	"&sqsube;": "⊑",
	"&sqsubset;": "⊏",
	"&sqsubseteq;": "⊑",
	"&sqsup;": "⊐",
	"&sqsupe;": "⊒",
	"&sqsupset;": "⊐",
	"&sqsupseteq;": "⊒",
	"&squ;": "□",
	"&square;": "□",
	"&squarf;": "▪",
	"&squf;": "▪",
	"&srarr;": "→",
	"&sscr;": "𝓈",
	"&ssetmn;": "∖",
	"&ssmile;": "⌣",
	"&sstarf;": "⋆",
	"&star;": "☆",
	"&starf;": "★",
	"&straightepsilon;": "ϵ",
	"&straightphi;": "ϕ",
	"&strns;": "¯",
	"&sub;": "⊂",
	"&subE;": "⫅",
	"&subdot;": "⪽",
	"&sube;": "⊆",
	"&subedot;": "⫃",
	"&submult;": "⫁",
	"&subnE;": "⫋",
	"&subne;": "⊊",
	"&subplus;": "⪿",
	"&subrarr;": "⥹",
	"&subset;": "⊂",
	"&subseteq;": "⊆",
	"&subseteqq;": "⫅",
	"&subsetneq;": "⊊",
	"&subsetneqq;": "⫋",
	"&subsim;": "⫇",
	"&subsub;": "⫕",
	"&subsup;": "⫓",
	"&succ;": "≻",
	"&succapprox;": "⪸",
	"&succcurlyeq;": "≽",
	"&succeq;": "⪰",
	"&succnapprox;": "⪺",
	"&succneqq;": "⪶",
	"&succnsim;": "⋩",
	"&succsim;": "≿",
	"&sum;": "∑",
	"&sung;": "♪",
	"&sup1;": "¹",
	"&sup2;": "²",
	"&sup3;": "³",
	"&sup;": "⊃",
	"&supE;": "⫆",
	"&supdot;": "⪾",
	"&supdsub;": "⫘",
	"&supe;": "⊇",
	"&supedot;": "⫄",
	"&suphsol;": "⟉",
	"&suphsub;": "⫗",
	"&suplarr;": "⥻",
	"&supmult;": "⫂",
	"&supnE;": "⫌",
	"&supne;": "⊋",
	"&supplus;": "⫀",
	"&supset;": "⊃",
	"&supseteq;": "⊇",
	"&supseteqq;": "⫆",
	"&supsetneq;": "⊋",
	"&supsetneqq;": "⫌",
	"&supsim;": "⫈",
	"&supsub;": "⫔",
	"&supsup;": "⫖",
	"&swArr;": "⇙",
	"&swarhk;": "⤦",
	"&swarr;": "↙",
	"&swarrow;": "↙",
	"&swnwar;": "⤪",
	"&szlig;": "ß",
	"&target;": "⌖",
	"&tau;": "τ",
	"&tbrk;": "⎴",
	"&tcedil;": "ţ",
	"&tcy;": "т",
	"&telrec;": "⌕",
	"&tfr;": "𝔱",
	"&there4;": "∴",
	"&therefore;": "∴",
	"&theta;": "θ",
	"&thetasym;": "ϑ",
	"&thetav;": "ϑ",
	"&thickapprox;": "≈",
	"&thicksim;": "∼",
	"&thinsp;": " ",
	"&thkap;": "≈",
	"&thksim;": "∼",
	"&thorn;": "þ",
	"&tilde;": "˜",
	"&times;": "×",
	"&timesb;": "⊠",
	"&timesbar;": "⨱",
	"&timesd;": "⨰",
	"&tint;": "∭",
	"&toea;": "⤨",
	"&top;": "⊤",
	"&topbot;": "⌶",
	"&topcir;": "⫱",
	"&topf;": "𝕥",
	"&topfork;": "⫚",
	"&tosa;": "⤩",
	"&tprime;": "‴",
	"&trade;": "™",
	"&triangle;": "▵",
	"&triangledown;": "▿",
	"&triangleleft;": "◃",
	"&trianglelefteq;": "⊴",
	"&triangleq;": "≜",
	"&triangleright;": "▹",
	"&trianglerighteq;": "⊵",
	"&tridot;": "◬",
	"&trie;": "≜",
	"&triminus;": "⨺",
	"&triplus;": "⨹",
	"&trisb;": "⧍",
	"&tritime;": "⨻",
	"&trpezium;": "⏢",
	"&tscr;": "𝓉",
	"&tscy;": "ц",
	"&tshcy;": "ћ",
	"&tstrok;": "ŧ",
	"&twixt;": "≬",
	"&twoheadleftarrow;": "↞",
	"&twoheadrightarrow;": "↠",
	"&uArr;": "⇑",
	"&uHar;": "⥣",
	"&uarr;": "↑",
	"&ubrcy;": "ў",
	"&ucy;": "у",
	"&udarr;": "⇅",
	"&udblac;": "ű",
	"&udhar;": "⥮",
	"&ufisht;": "⥾",
	"&ufr;": "𝔲",
	"&uharl;": "↿",
	"&uharr;": "↾",
	"&uhblk;": "▀",
	"&ulcorn;": "⌜",
	"&ulcorner;": "⌜",
	"&ulcrop;": "⌏",
	"&ultri;": "◸",
	"&uml;": "¨",
	"&uopf;": "𝕦",
	"&uparrow;": "↑",
	"&updownarrow;": "↕",
	"&upharpoonleft;": "↿",
	"&upharpoonright;": "↾",
	"&uplus;": "⊎",
	"&upsi;": "υ",
	"&upsih;": "ϒ",
	"&upsilon;": "υ",
	"&upuparrows;": "⇈",
	"&urcorn;": "⌝",
	"&urcorner;": "⌝",
	"&urcrop;": "⌎",
	"&urtri;": "◹",
	"&uscr;": "𝓊",
	"&utdot;": "⋰",
	"&utri;": "▵",
	"&utrif;": "▴",
	"&uuarr;": "⇈",
	"&uwangle;": "⦧",
	"&vArr;": "⇕",
	"&vBar;": "⫨",
	"&vBarv;": "⫩",
	"&vDash;": "⊨",
	"&vangrt;": "⦜",
	"&varepsilon;": "ϵ",
	"&varkappa;": "ϰ",
	"&varnothing;": "∅",
	"&varphi;": "ϕ",
	"&varpi;": "ϖ",
	"&varpropto;": "∝",
	"&varr;": "↕",
	"&varrho;": "ϱ",
	"&varsigma;": "ς",
	"&varsubsetneq;": "⊊︀",
	"&varsubsetneqq;": "⫋︀",
	"&varsupsetneq;": "⊋︀",
	"&varsupsetneqq;": "⫌︀",
	"&vartheta;": "ϑ",
	"&vartriangleleft;": "⊲",
	"&vartriangleright;": "⊳",
	"&vcy;": "в",
	"&vdash;": "⊢",
	"&vee;": "∨",
	"&veebar;": "⊻",
	"&veeeq;": "≚",
	"&vellip;": "⋮",
	"&verbar;": "|",
	"&vert;": "|",
	"&vfr;": "𝔳",
	"&vltri;": "⊲",
	"&vnsub;": "⊂⃒",
	"&vnsup;": "⊃⃒",
	"&vopf;": "𝕧",
	"&vprop;": "∝",
	"&vrtri;": "⊳",
	"&vscr;": "𝓋",
	"&vsubnE;": "⫋︀",
	"&vsubne;": "⊊︀",
	"&vsupnE;": "⫌︀",
	"&vsupne;": "⊋︀",
	"&vzigzag;": "⦚",
	"&wedbar;": "⩟",
	"&wedge;": "∧",
	"&wedgeq;": "≙",
	"&weierp;": "℘",
	"&wfr;": "𝔴",
	"&wopf;": "𝕨",
	"&wp;": "℘",
	"&wr;": "≀",
	"&wreath;": "≀",
	"&wscr;": "𝓌",
	"&xcap;": "⋂",
	"&xcup;": "⋃",
	"&xdtri;": "▽",
	"&xfr;": "𝔵",
	"&xhArr;": "⟺",
	"&xharr;": "⟷",
	"&xi;": "ξ",
	"&xlArr;": "⟸",
	"&xlarr;": "⟵",
	"&xmap;": "⟼",
	"&xnis;": "⋻",
	"&xodot;": "⨀",
	"&xopf;": "𝕩",
	"&xoplus;": "⨁",
	"&xotime;": "⨂",
	"&xrArr;": "⟹",
	"&xrarr;": "⟶",
	"&xscr;": "𝓍",
	"&xsqcup;": "⨆",
	"&xuplus;": "⨄",
	"&xutri;": "△",
	"&xvee;": "⋁",
	"&xwedge;": "⋀",
	"&yacy;": "я",
	"&ycy;": "ы",
	"&yen;": "¥",
	"&yfr;": "𝔶",
	"&yicy;": "ї",
	"&yopf;": "𝕪",
	"&yscr;": "𝓎",
	"&yucy;": "ю",
	"&zcy;": "з",
	"&zeetrf;": "ℨ",
	"&zeta;": "ζ",
	"&zfr;": "𝔷",
	"&zhcy;": "ж",
	"&zigrarr;": "⇝",
	"&zopf;": "𝕫",
	"&zscr;": "𝓏",
	"&zwj;": "‍",
	"&zwnj;": "‌"
]
