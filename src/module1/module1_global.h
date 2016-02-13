#ifndef MODULE1_GLOBAL_H
#define MODULE1_GLOBAL_H

#include <QtGlobal>

#if defined(MODULE1_LIBRARY)
#  define MODULE1_EXPORT Q_DECL_EXPORT
#else
#  define MODULE1_EXPORT Q_DECL_IMPORT
#endif

#endif // MODULE1_GLOBAL_H
