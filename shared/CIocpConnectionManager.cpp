#include "stdafx.h"
#include "CIocpConnectionManager.h"

namespace IOCP
{

void CIocpConnectionManager::AddConnection( std::shared_ptr<CIocpConnection> cConnection )
{
    std::lock_guard<std::mutex> l( sMutex );

    sConnectionMap.insert( std::make_pair( cConnection->iID, cConnection ) );
}

bool CIocpConnectionManager::RemoveConnection( INT64 iID )
{
    std::lock_guard<std::mutex> l( sMutex );

    ConnectionMap_t::iterator itr = sConnectionMap.find( iID );

    if ( itr != sConnectionMap.end() )
        itr->second = nullptr;

    return (sConnectionMap.erase( iID ) > 0);
}

std::shared_ptr<CIocpConnection> CIocpConnectionManager::GetConnection( INT64 iID )
{
    std::lock_guard<std::mutex> l( sMutex );

    ConnectionMap_t::iterator itr = sConnectionMap.find( iID );

    if ( itr != sConnectionMap.end() )
        return itr->second;

    return std::shared_ptr<CIocpConnection>();
}

void CIocpConnectionManager::CloseAllConnections()
{
    std::lock_guard<std::mutex> l( sMutex );

    ConnectionMap_t::iterator itr = sConnectionMap.begin();

    while ( itr != sConnectionMap.end() )
    {
        CancelIo( (HANDLE)itr->second->sSocket );
        ++itr;
    }
}

};
